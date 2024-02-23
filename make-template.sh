#!/bin/bash
# --------------------------------------------------------------------------- #
# Create templates for C Projects
# --------------------------------------------------------------------------- #

function usage() {
	if [[ $1 == '-h' ]]; then
		echo "$0 [-h] Template [ProjectName]"
	else
		cat << EOF
usage: $0 [-h|--help] [-t] Template

Options:

-t		Specify a template to use
--help		This help message
- h		Basic usage message

Choose from one of the following templates:

shaw		C project template from Shaw's "Learn C the Hard Way"
github		C project template based on Github default filesystem

Return code info:

0	Success
1	Error with template creation script
2	Nonexistent template
100	Help and usage

EOF
	fi
	return 100
}

function template() {
	wd=$(dirname $0)
	scriptname="$wd/templates/$1-template.sh"

	if [[ ! -f $scriptname ]]; then
		echo "The template you tried to create does not current exist"
		return 2
	fi

	/bin/sh $scriptname $1
	if [[ $? -eq 0 ]]; then
		echo "Created template"
		return 0
	else
		echo "There was an error creating the template"
		return 1
	fi
}

function main() {
	if [[ $1 == '--help' || $1 == '-h' ]]; then
		usage
		export temp=$?
	elif [[ $1 == '-t' && -n $2 ]]; then
		shift ;
		template $1
		export temp=$?
	fi

	rc=${temp}
	unset $temp
	exit $rc
}

main $@

