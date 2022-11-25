#!/bin/bash

# Created by argbash-init v2.9.0
# ARG_OPTIONAL_SINGLE([name],[n],[Name of the test image],[ssg_test_suite])
# ARG_OPTIONAL_SINGLE([scenarios],[s],[Regex to reduce selection of tested scenarios],[])
# ARG_OPTIONAL_SINGLE([datastream],[d],[Path to the datastream to use in tests. Autodetected by default.])
# ARG_OPTIONAL_SINGLE([remediate-using],[r],[What to remediate with],[oscap])
# ARG_OPTIONAL_SINGLE([logdir],[l],[Directory where logs will be stored])
# ARG_OPTIONAL_BOOLEAN([dontclean],[],[Dont remove HTML reports from the log directory.])
# ARG_OPTIONAL_BOOLEAN([dry-run],[],[Just print the test suite command-line.])
# ARG_OPTIONAL_BOOLEAN([docker],[],[Use Docker instead of Podman as container backend.])
# ARG_USE_ENV([ADDITIONAL_SSGTS_OPTIONS],[],[Deprecated, use ADDITIONAL_TEST_OPTIONS])
# ARG_USE_ENV([ADDITIONAL_TEST_OPTIONS],[],[Whitespace-separated string of arguments to pass to Automatus])
# ARG_POSITIONAL_INF([rule],[The short rule ID. Wildcards are supported.],[1])
# ARG_TYPE_GROUP_SET([remediations],[REMEDIATION],[remediate-using],[oscap,bash,ansible])
# ARG_DEFAULTS_POS([])
# DEFINE_SCRIPT_DIR([])
# ARG_HELP([Test a rule using the container backend.])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.10.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info

# Setting environmental variables
# Setting environmental variables


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}

# validators

remediations()
{
	local _allowed=("oscap" "bash" "ansible") _seeking="$1"
	for element in "${_allowed[@]}"
	do
		test "$element" = "$_seeking" && echo "$element" && return 0
	done
	die "Value '$_seeking' (of argument '$2') doesn't match the list of allowed values: 'oscap', 'bash' and 'ansible'" 4
}


begins_with_short_option()
{
	local first_option all_short_options='nsdrlh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_rule=('' )
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_name="ssg_test_suite"
_arg_scenarios=
_arg_datastream=
_arg_remediate_using="oscap"
_arg_logdir=
_arg_dontclean="off"
_arg_dry_run="off"
_arg_docker="off"


print_help()
{
	printf '%s\n' "Test a rule using the container backend."
	printf 'Usage: %s [-n|--name <arg>] [-s|--scenarios <arg>] [-d|--datastream <arg>] [-r|--remediate-using <REMEDIATION>] [-l|--logdir <arg>] [--(no-)dontclean] [--(no-)dry-run] [--(no-)docker] [-h|--help] <rule-1> [<rule-2>] ... [<rule-n>] ...\n' "$0"
	printf '\t%s\n' "<rule>: The short rule ID. Wildcards are supported."
	printf '\t%s\n' "-n, --name: Name of the test image (default: 'ssg_test_suite')"
	printf '\t%s\n' "-s, --scenarios: Regex to reduce selection of tested scenarios (no default)"
	printf '\t%s\n' "-d, --datastream: Path to the datastream to use in tests. Autodetected by default. (no default)"
	printf '\t%s\n' "-r, --remediate-using: What to remediate with. Can be one of: 'oscap', 'bash' and 'ansible' (default: 'oscap')"
	printf '\t%s\n' "-l, --logdir: Directory where logs will be stored (no default)"
	printf '\t%s\n' "--dontclean, --no-dontclean: Dont remove HTML reports from the log directory. (off by default)"
	printf '\t%s\n' "--dry-run, --no-dry-run: Just print the test suite command-line. (off by default)"
	printf '\t%s\n' "--docker, --no-docker: Use Docker instead of Podman as container backend. (off by default)"
	printf '\t%s\n' "-h, --help: Prints help"
	printf '\nEnvironment variables that are supported:\n'
	printf '\t%s\n' "ADDITIONAL_SSGTS_OPTIONS: Deprecated, use ADDITIONAL_TEST_OPTIONS."
	printf '\t%s\n' "ADDITIONAL_TEST_OPTIONS: Whitespace-separated string of arguments to pass to Automatus."

}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-n|--name)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_name="$2"
				shift
				;;
			--name=*)
				_arg_name="${_key##--name=}"
				;;
			-n*)
				_arg_name="${_key##-n}"
				;;
			-s|--scenarios)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_scenarios="$2"
				shift
				;;
			--scenarios=*)
				_arg_scenarios="${_key##--scenarios=}"
				;;
			-s*)
				_arg_scenarios="${_key##-s}"
				;;
			-d|--datastream)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_datastream="$2"
				shift
				;;
			--datastream=*)
				_arg_datastream="${_key##--datastream=}"
				;;
			-d*)
				_arg_datastream="${_key##-d}"
				;;
			-r|--remediate-using)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_remediate_using="$(remediations "$2" "remediate-using")" || exit 1
				shift
				;;
			--remediate-using=*)
				_arg_remediate_using="$(remediations "${_key##--remediate-using=}" "remediate-using")" || exit 1
				;;
			-r*)
				_arg_remediate_using="$(remediations "${_key##-r}" "remediate-using")" || exit 1
				;;
			-l|--logdir)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_logdir="$2"
				shift
				;;
			--logdir=*)
				_arg_logdir="${_key##--logdir=}"
				;;
			-l*)
				_arg_logdir="${_key##-l}"
				;;
			--no-dontclean|--dontclean)
				_arg_dontclean="on"
				test "${1:0:5}" = "--no-" && _arg_dontclean="off"
				;;
			--no-dry-run|--dry-run)
				_arg_dry_run="on"
				test "${1:0:5}" = "--no-" && _arg_dry_run="off"
				;;
			--no-docker|--docker)
				_arg_docker="on"
				test "${1:0:5}" = "--no-" && _arg_docker="off"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


handle_passed_args_count()
{
	local _required_args_string="'rule'"
	test "${_positionals_count}" -ge 1 || _PRINT_HELP=yes die "FATAL ERROR: Not enough positional arguments - we require at least 1 (namely: $_required_args_string), but got only ${_positionals_count}." 1
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names="_arg_rule "
	_our_args=$((${#_positionals[@]} - 1))
	for ((ii = 0; ii < _our_args; ii++))
	do
		_positional_names="$_positional_names _arg_rule[$((ii + 1))]"
	done

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
handle_passed_args_count
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" || { echo "Couldn't determine the script's running directory, which probably matters, bailing out" >&2; exit 2; }
# Validation of values


### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash
CONTAINER_BACKEND="podman"
CONTAINER_OPT="--container"
if test "$_arg_docker" = on; then
	CONTAINER_BACKEND="docker"
	CONTAINER_OPT="--docker"
fi

$CONTAINER_BACKEND images | grep -q "$_arg_name" || die "Couldn't find the $CONTAINER_BACKEND image '$_arg_name'"

additional_args=()
test "$_arg_dontclean" = on && additional_args+=(--dontclean)

# Don't act on the default value.
test -n "$_arg_scenarios" && additional_args+=(--scenario "$_arg_scenarios")

test -n "$_arg_datastream" && additional_args+=(--datastream "$_arg_datastream")

test -n "$_arg_remediate_using" && additional_args+=(--remediate-using "$_arg_remediate_using")

test -n "$_arg_logdir" && additional_args+=(--logdir "$_arg_logdir")

if test -n "$ADDITIONAL_SSGTS_OPTIONS"; then
	test -n "$ADDITIONAL_TEST_OPTIONS" && die "Specify additional options preferably using ADDITIONAL_TEST_OPTIONS env var, or by ADDITIONAL_SSGTS_OPTIONS, but not by both."
	echo "Detected usage of ADDITIONAL_SSGTS_OPTIONS, please prefer the ADDITIONAL_TEST_OPTIONS environment variable interface." >&2
	ADDITIONAL_TEST_OPTIONS="$ADDITIONAL_SSGTS_OPTIONS"
fi

command=(python3 "${script_dir}/automatus.py" rule ${ADDITIONAL_TEST_OPTIONS} --remove-platforms --remove-machine-only --remove-ocp4-only "${additional_args[@]}" "$CONTAINER_OPT" "$_arg_name" -- "${_arg_rule[@]}")
if test "$_arg_dry_run" = on; then
	printf '%s\n' "${command[*]}"
else
	"${command[@]}"
fi

# ] <-- needed because of Argbash
