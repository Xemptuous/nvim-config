#!/usr/bin/env bash
if command -v tree-sitter &> /dev/null
then
  exit 0
fi

store_dir="$HOME/.local/share/nvim"
url="https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.7/tree-sitter-linux-x64.gz"

url=$(curl -s https://api.github.com/repos/tree-sitter/tree-sitter/releases/latest \
  | grep browser_download_url.*linux \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | xargs
);
filename=$(echo "$url" | grep -Po "([^\/]+)\/?$")
old="$store_dir/$filename"
new="$store_dir/tree-sitter"
wget -qO "$old" "$url";
gzip -d "$old";
filename=$(echo "$filename" | grep -Po ".*(?=\.)")
old="$store_dir/$filename"
mv "$old" "$new";
chmod +x "$new"
