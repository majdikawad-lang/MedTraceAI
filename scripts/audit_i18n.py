"""
Automated i18n Localization Auditor Script for MedTrace AI.

Scans en.ts and ar.ts translation dictionaries to ensure 100% key parity,
and audits frontend TSX component files for missing translation keys.
"""
import os
import re
import sys

# Ensure UTF-8 output encoding for Windows terminal compatibility
if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8")

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EN_PATH = os.path.join(BASE_DIR, "src", "i18n", "locales", "en.ts")
AR_PATH = os.path.join(BASE_DIR, "src", "i18n", "locales", "ar.ts")
COMPONENTS_DIR = os.path.join(BASE_DIR, "src", "components")

def parse_keys(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    # Match keys in export const ... = { key: "value", ... }
    matches = re.findall(r'^\s*([a-zA-Z0-9_]+)\s*:', content, re.MULTILINE)
    return set(matches)

def main():
    print("==================================================")
    print("   MedTrace AI Automated i18n Localization Audit  ")
    print("==================================================")
    
    if not os.path.exists(EN_PATH) or not os.path.exists(AR_PATH):
        print("Error: Dictionary files en.ts or ar.ts not found.")
        sys.exit(1)
        
    en_keys = parse_keys(EN_PATH)
    ar_keys = parse_keys(AR_PATH)
    
    print(f"Total English Keys  (en.ts): {len(en_keys)}")
    print(f"Total Arabic Keys   (ar.ts): {len(ar_keys)}")
    
    missing_in_ar = en_keys - ar_keys
    missing_in_en = ar_keys - en_keys
    
    errors = 0
    if missing_in_ar:
        print(f"\n[ERROR] Keys present in en.ts but missing in ar.ts ({len(missing_in_ar)}):")
        for k in sorted(missing_in_ar):
            print(f"   - {k}")
        errors += 1
    else:
        print("\n[PASS] All English keys are translated in ar.ts")
        
    if missing_in_en:
        print(f"\n[ERROR] Keys present in ar.ts but missing in en.ts ({len(missing_in_en)}):")
        for k in sorted(missing_in_en):
            print(f"   - {k}")
        errors += 1
    else:
        print("[PASS] All Arabic keys exist in en.ts")

    # Scan components for t('key') usages and check if keys exist
    print("\nScanning component files for t('key') reference integrity...")
    missing_used_keys = set()
    used_keys_count = 0
    
    for root, _, files in os.walk(COMPONENTS_DIR):
        for file in files:
            if file.endswith(".tsx") or file.endswith(".ts"):
                path = os.path.join(root, file)
                with open(path, "r", encoding="utf-8") as f:
                    text = f.read()
                # Find t('key') or t("key")
                refs = re.findall(r"\bt\(['\"]([a-zA-Z0-9_]+)['\"]", text)
                for ref in refs:
                    used_keys_count += 1
                    if ref not in en_keys:
                        missing_used_keys.add((ref, os.path.basename(path)))

    if missing_used_keys:
        print(f"\n[ERROR] Found {len(missing_used_keys)} key(s) used in components but missing in en.ts:")
        for k, comp in sorted(missing_used_keys):
            print(f"   - '{k}' in {comp}")
        errors += 1
    else:
        print(f"[PASS] All {used_keys_count} component t('key') calls are registered in dictionary.")

    print("\n--------------------------------------------------")
    if errors == 0:
        print("RESULT: LOCALIZATION AUDIT PASSED 100% CLEAN!")
        sys.exit(0)
    else:
        print(f"RESULT: LOCALIZATION AUDIT FAILED with {errors} issue group(s).")
        sys.exit(1)

if __name__ == "__main__":
    main()
