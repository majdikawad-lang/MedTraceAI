import httpx
print(httpx.get("http://vector_db:6333/collections/medical_guidelines/points/count").text)
