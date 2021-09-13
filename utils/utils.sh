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
NC='\033[0m'

# Manual actions
function log_manual() {
    echo -e "${red}>>> MANUAL: $@ <<<${NC}"
    read -r -p "Press any key to continue..."
}

# Log utils
function log_info() { echo -e "${cyan}>>> $@ <<<${NC}"; }
function log_success() { echo -e "${green}>>> $@ <<<${NC}"; }

# Function to safely link files
function safe_ln() {
    [ -f $2 ] && mv $2 $2.bak.$(date +%s)
    ln -s $1 $2
}

