#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo "
${RED}

░█▀▀█ ░█─── ─█▀▀█ ░█▀▀█ ░█─▄▀ ░█▀▀█ ░█▀▀▀█ ░█▄─░█ ░█▀▀▀█ ─█▀▀█ 
░█▀▀▄ ░█─── ░█▄▄█ ░█─── ░█▀▄─ ░█─▄▄ ░█──░█ ░█░█░█ ─▄▄▄▀▀ ░█▄▄█ 
░█▄▄█ ░█▄▄█ ░█─░█ ░█▄▄█ ░█─░█ ░█▄▄█ ░█▄▄▄█ ░█──▀█ ░█▄▄▄█ ░█─░█
                                                        RedShock Version 2
${NC}
"

# Check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Install a package using APT package manager
install_package() {
  if command_exists apt; then
    sudo apt update
    sudo apt install -y "$1"
  elif command_exists yum; then
    sudo yum install -y "$1"
  else
    echo -e "${RED}Error: Unable to install $1. Please install it manually.${NC}"
    exit 1
  fi
}

# Install tools if not already installed
install_tools() {
  tools=("nmap" "zap-cli" "nikto" "sqlmap" "dirb" "wfuzz" "ffuf" "arachni" "gobuster" "sslyze" "sniper" "wpscan" "joomscan" "lynis" "sublist3r" "amass" "hydra" "niktodb")

  for tool in "${tools[@]}"; do
    if ! command_exists "$tool"; then
      echo -e "${YELLOW}Installing $tool...${NC}"
      install_package "$tool"
    else
      echo -e "${GREEN}$tool ${NC} is already installed[${GREEN}§]${NC}"
    fi
  done
}

# Run the actual scanning script
run_scanning() {
  # Your existing scanning script goes here

  echo -e "${GREEN}Scan complete.${NC}"
}

# Main script starts here

echo -e "${YELLOW}Enter the target URL (e.g., http://localhost):${NC}"
read target_url

# Install necessary tools
install_tools

# Run the scanning script
run_scanning
