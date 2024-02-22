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

--help		This help message
- h		Basic usage message

Choose from one of the following templates:

shaw		C project template from Shaw's "Learn C the Hard Way"
github		C project template based on Github default filesystem

EOF
	fi
	return 0
}



function template() {
	wd=$(dirname $0)
	scriptname="$wd/templates/$1-template.sh"
	/bin/sh $scriptname $1
	if [[ $? -eq 0 ]]; then
		echo "Created template"
		return 0
	else
		echo "There was an error creating the template"
		return 1
	fi
}

function shaw-template() {
	echo "Create Shaw template"
}

function main() {

	if [[ $1 == '--help' || $1 == '-h' ]]; then
		usage
	elif [[ $1 == '-t' && -n $2 ]]; then
		shift ;
		template $1
	fi

}

main $@

