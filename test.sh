SCRIPTDIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SCRIPTDIR/bashlib.sh

exit_if_no_param SCRIPTDIR

#FILE_NAME=/path/to/not/exists
#exit_if_no_file FILE_NAME

FILE_NAME=$SCRIPTDIR/bashlib.sh
exit_if_no_file FILE_NAME

#DIR_NAME=/path/to/not/exists
#exit_if_no_dir DIR_NAME

exit_if_no_dir SCRIPTDIR

#exit_if_no_program dummyprogram
exit_if_no_program which
