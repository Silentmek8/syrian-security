#!/bin/bash

# Banner (Syrian Security)
if ! command -v figlet &> /dev/null; then
  echo "Please install figlet to display the banner: sudo apt install figlet"
  exit 1
fi

clear
figlet "Syrian Security"
echo -e " GitHub CVE PoC Finder by Syrian Security Version 1.0\n" 

# Prompt for keyword
read -p "Enter keyword (e.g. wordpress, apache, joomla): " KEYWORD

# Color setup
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
YELLOW=$(tput setaf 3)
BOLD=$(tput bold)
RESET=$(tput sgr0)

MAX_DESC_LENGTH=100

# Description cleaner
clean_desc() {
  echo "$1" | sed 's/[_*\[\]\(\)#<>-]//g' | cut -c1-${MAX_DESC_LENGTH}
}

# Fetch data
curl -s "https://api.github.com/search/repositories?q=${KEYWORD}+CVE+exploit+PoC&sort=updated" | \
jq -r '.items[] | [.full_name, .html_url, .description, .stargazers_count, .updated_at] | @tsv' | \
while IFS=$'\t' read -r name url desc stars updated; do
  short_desc=$(clean_desc "$desc")
  echo -e "\n${BOLD}Name:${RESET} ${CYAN}${name}${RESET}"
  echo -e "${BOLD}URL:${RESET} ${GREEN}${url}${RESET}"
  echo -e "${BOLD}Description:${RESET} ${YELLOW}${short_desc}${RESET}"
  echo -e "${BOLD}Stars:${RESET} ${stars}"
  echo -e "${BOLD}Last Updated:${RESET} ${updated}"
  echo -e "----------------------------"
done
