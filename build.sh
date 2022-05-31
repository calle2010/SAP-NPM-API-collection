#!/bin/sh
set -eu

npm config rm @sap:registry
rm -rf node_modules
mkdir node_modules
npm install libnpmsearch
node update-package-json.js
jq '.' new-package.json > package.json
rm new-package.json
#npm install
if [ "$1" = "full" ]; then
  echo full build
  if [ -d apis ]; then
    rm -r apis/
  fi
else
  echo download updated packages only
  # Reduce list of packages to update by using diff on package.json
  git diff package.json | grep + | grep "@sap" | sed 's/[^"]*"\([^"]*\).*/\1/' > packages.txt
fi

echo "updating $(wc -l packages.txt)"

xargs -P 5 -n 1 -I{} sh -c './npm_download.sh {}' <packages.txt

while read -r package; do
  packageNoPrefix=$(echo "$package" | sed 's/@sap//g')
  mkdir -p "apis$packageNoPrefix"
  rsync -zarv  --include "*/" --include="*.md" --exclude="*" "node_modules/$package/" "apis$packageNoPrefix"
  cp "node_modules/$package/LICENS*" "apis$packageNoPrefix"
  if [ -d "./node_modules/$package/doc" ]; then
    cp -r "./node_modules/$package/doc" "apis$packageNoPrefix/"
  fi
  if [ -d "./node_modules/$package/docs" ]; then
    cp -r "./node_modules/$package/docs" "apis$packageNoPrefix/"
  fi  
done <packages.txt
echo "now execute 'mkdocs build -f mkdocs.yml'"
echo "this will take several minutes"
