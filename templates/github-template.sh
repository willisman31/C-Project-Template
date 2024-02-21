#!/bin/bash
# Create github-template

project=$1
mkdir "./$project"

printf "# $1\n\nA new project using the C programming language\n" | cat > ./$project/README.md
cat ./LICENSE | cat > "./$project/LICENSE"

sed -i '' -e "s/Jacob Willis/-/g" ./$project/LICENSE 2>/dev/null

printf "" 2>/dev/null

