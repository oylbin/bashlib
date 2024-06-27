# Bashlib.sh

`bashlib.sh` is a collection of Bash utility functions designed to enhance script robustness and functionality. 

### Usage Examples

Here are some examples of how to use the functions provided by `bashlib.sh`:

#### Logging with Timestamp
```bash
# Log a message with the current date and time
log_with_time "This is an informational log entry."
```

#### Checking if Variables are Set
```bash
# Check if required variables are set and exit if any are unset or empty
CONFIG_PATH="/etc/myconfig"
DB_USER="admin"
exit_if_no_param CONFIG_PATH DB_USER
```

#### Checking for File Existence
```bash
# Verify the existence of a necessary file using a variable name
FILE_NAME="/path/to/important/file"
exit_if_no_file FILE_NAME
```

#### Checking for Directory Existence
```bash
# Ensure required directories are present
DATA_DIR="/data"
LOG_DIR="/logs"
exit_if_no_dir DATA_DIR LOG_DIR
```

#### Ensuring Required Programs are Installed
```bash
# Check if necessary programs are installed, e.g., curl and tar
exit_if_no_program curl tar
```

#### Prepending Paths
```bash
# Prepend a directory to the PATH environment variable if it exists
CUSTOM_BIN="/usr/local/custom/bin"
prepend_path_if_exists CUSTOM_BIN
```

These examples demonstrate how to integrate `bashlib.sh` functions into your Bash scripts to handle common tasks such as logging, environment setup, and validation checks efficiently.
