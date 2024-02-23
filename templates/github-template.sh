#!/bin/bash
# Create github-template

base_dir="$(dirname $0)/.."

project=$1
mkdir "./$project"

printf "# $1\n\nA new project using the C programming language\n" | cat > ./$project/README.md
cat $base_dir/artifacts/LICENSE | cat > "./$project/LICENSE"

sed -i '' -e "s/ERASEME/$(whoami)/g" ./$project/LICENSE 2>/dev/null

printf "" 2>/dev/null

