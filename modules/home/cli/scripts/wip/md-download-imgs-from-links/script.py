import re, os
import requests
import sys
from urllib.parse import urlparse

def process_file(md_file):
    base = os.path.splitext(md_file)[0]
    img_dir = f"{base}-img"
    os.makedirs(img_dir, exist_ok=True)

    with open(md_file, "r", encoding="utf-8") as f:
        content = f.read()

    # Markdown image regex: ![alt](url)
    pattern = r'!\[[^\]]*\]\((https?://[^)]+)\)'
    urls = re.findall(pattern, content)

    for url in urls:
        # Extract filename from URL
        filename = os.path.basename(urlparse(url).path)
        local_path = os.path.join(img_dir, filename)

        # Download if not exists
        if not os.path.exists(local_path):
            print(f"Downloading: {url}")
            r = requests.get(url, timeout=10)
            if r.status_code == 200:
                with open(local_path, "wb") as out:
                    out.write(r.content)

        # Replace link in text
        content = content.replace(url, f"{img_dir}/{filename}")

    with open(md_file, "w", encoding="utf-8") as f:
        f.write(content)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: download-images.py <file1.md> [file2.md] ...")
        sys.exit(1)
    for f in sys.argv[1:]:
        process_file(f)
