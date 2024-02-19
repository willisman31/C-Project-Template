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
	echo "Create Github template"
}

function shaw-template() {
	echo "Create Shaw template"
}

function main() {

	if [[ $1 == '--help' || $1 == '-h' ]]; then
		usage
	else
		case $1 in
			"Zed-Shaw")
				shaw-template ${@:2}
				;;
			"Github")
				github-template ${@:2}
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

