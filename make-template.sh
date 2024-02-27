#!/bin/bash
# --------------------------------------------------------------------------- #
# Create templates for C Projects
# --------------------------------------------------------------------------- #

# Help message and general usage information
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

Shaw		C project template from Shaw's "Learn C the Hard Way"
Github		C project template based on Github default filesystem

Return code info:

0	Success
1	Error with template creation script
2	Nonexistent template
3	Unspecified template
100	Help and usage

EOF
	fi
	return 100
}

# Point to the template-generation script located in the ./templates directory
function template() {
	wd=$(dirname $0)
	template=$(lower $1)
	scriptname="$wd/templates/$template-template.sh"

	if [[ ! -f $scriptname ]]; then
		echo "The template you tried to create doesn't currently exist"
		return 2
	fi

	/bin/sh $scriptname $1
	if [[ $? -eq 0 ]]; then
		echo "Template created successfully"
		return 0
	else
		echo "There was an error creating the template"
		return 1
	fi
}

# Convert text to lowercase to error-proof calls to template scripts
function lower() {
	echo $@ | tr '[:upper:]' '[:lower:]'
	return $?
}

function main() {
	while [[ -n $1 && $temp -lt 1 ]]; do
		case($1)
			'--help')
			'-h')
				usage
				export temp=$?
				break
				;;
			'-t')
				if [[ -n $2 ]]; then
					template $2
					export temp=$?
					shift 2
				else
					echo "Specify a template"
					export temp=3
				fi
				;;
			'-o')
				if [[ -n $2 ]]; then
					# set output dir
				else
					echo "Specify an output location"
					export temp=4
				fi
				;;
			*)
		esac
	done
	if [[ ! -n $temp ]]; then
		export temp=1
	fi
	rc=${temp}
	unset $temp
	exit $rc
}

main $@

