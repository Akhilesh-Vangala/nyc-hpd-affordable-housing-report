import os
import urllib.request

BASE = os.path.dirname(os.path.abspath(__file__))
RAW = os.path.join(BASE, "data", "raw")
os.makedirs(RAW, exist_ok=True)

URLS = [
    ("https://data.cityofnewyork.us/api/views/hq68-rnsi/rows.csv?accessType=DOWNLOAD", "hpd_projects.csv"),
    ("https://data.cityofnewyork.us/api/views/hg8x-zxpr/rows.csv?accessType=DOWNLOAD", "hpd_buildings.csv"),
]
for url, name in URLS:
    path = os.path.join(RAW, name)
    if os.path.exists(path):
        print(f"Exists: {name}")
        continue
    try:
        urllib.request.urlretrieve(url, path)
        print(f"Downloaded: {name}")
    except Exception as e:
        print(f"Error {name}: {e}")
