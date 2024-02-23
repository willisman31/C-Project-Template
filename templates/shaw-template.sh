#!/bin/bash
# Create project using template provided by Zed Shaw in "Learn C The Hard Way"

project=$1
mkdir "./$project"
base_dir="$(dirname $0)/.."

printf "# $1\n\nA new project using the C programming language\n\nTemplate modeled after an early example from Zed Shaw's *Learn C The hard Way*\n" | cat > ./$project/README.md

cat $base_dir/artifacts/LICENSE | cat > "./$project/LICENSE"
sed -i '' -e "s/ERASEME/$(whoami)/g" ./$project/LICENSE 2>/dev/null

mkdir "./$project/src"
mkdir "./$project/bin"
mkdir "./$project/test"

cp $base_dir/artifacts/shaw/dbg.h "./$project/src/"
cp $base_dir/artifacts/shaw/Makefile "./$project/"

