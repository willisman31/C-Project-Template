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

Zed-Shaw	C project template from Shaw's "Learn C the Hard Way"

EOF
	fi
	return 0
}



function github-template() {
	wd=$(dirname $0)
	scriptname="$wd/templates/$1-template.sh"
	/bin/sh $scriptname $1
	if [[ $? -eq 0 ]]; then
		echo "Created Github template"
		return 0
	else
		echo "There was an error creating the Github template"
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
		case $1 in
			"shaw")
				shaw-template $1
				;;
			"github")
				github-template $1
				;;
			*)
				echo "Invalid template name"
				usage '-h'
				exit -1
				;;
		esac
	fi

}

main $@

