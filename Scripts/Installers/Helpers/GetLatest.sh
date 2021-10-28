repo="CoreBytee/Sugar"

echo "$repo"


curl -s "https://api.github.com/repos/$repo/releases" | \
    python3 -c "import sys, json; print(json.load(sys.stdin)[0]['tag_name'])"

