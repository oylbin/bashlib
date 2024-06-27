# get the latest version of this file at https://raw.githubusercontent.com/oylbin/bashlib/main/bashlib.sh
if [ -z "$BASH" ]; then echo "bashlib.sh supports bash only!"; exit 1; fi

#SCRIPTDIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LANG=en_US.UTF-8

export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '

shopt -s expand_aliases

function log_with_time {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"
}

# Check if the given variable names are set and non-empty.
# Exits the script with code 1 if any variable is unset or empty.
# Important: Pass the variable name as the argument, not the value itself.
# Parameters:
#   $@ - Variable names to check.
#
# Usage:
#   DATA_DIR="/data"
#   LOG_PATH="/var/log"
#   exit_if_no_param DATA_DIR LOG_PATH
function exit_if_no_param {
    for i in "$@"
    do
        if [[ ! "${!i}" ]]
        then
            log_with_time "no input: $i"
            exit 1
        fi
    done
    return 0
}

# Use this function to check if the file specified by the variable name exists.
# Pass the variable name as the argument, not the file path itself.
# Example usage:
# FILE_NAME=/path/to/not/exists
# exit_if_no_file FILE_NAME
#
function exit_if_no_file {
    for i in "$@" ;do
        if ! test -f "${!i}"; then
            log_with_time "file not exists: $i -> ${!i}"
            exit 1
        fi
    done
    return 0
}


# Check if the directories specified by the variable names exist.
# Exits the script with code 1 if any directory does not exist.
# Important: Pass the variable name as the argument, not the directory path itself.
# Parameters:
#   $@ - Variable names representing the directories to check.
#
# Usage:
#   CONFIG_DIR="/etc/config"
#   DATA_DIR="/data"
#   exit_if_no_dir CONFIG_DIR DATA_DIR
#
function exit_if_no_dir {
    for i in "$@" ;do
        if ! test -d "${!i}"; then
            log_with_time "dir not exists: $i"
            exit 1
        fi
    done
    return 0
}

function exit_if_no_program {
    for p in "$@" ; do
        if ! which "$p" >/dev/null 2>&1; then
            log_with_time "you need install '$p' first."
            exit 1
        fi
    done
    return 0
}

function prepend_path_if_exists {
    dir="$1"
    if [[ -d "$dir" ]]
    then
        export PATH="$dir":$PATH
    fi
}
