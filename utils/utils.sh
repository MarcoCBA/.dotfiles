#/bin/sh

# Color definitions
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'

# Log utils
function log_info() { echo -e ">>> ${cyan}$@${black} <<<"; }
function log_success() { echo -e ">>> ${green}$@${black} <<<"; }

# Function to safely link files
function safe_ln() {
    mv $2 $2.bak.$(date +%s)
    ln -s $1 $2
}
