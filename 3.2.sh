#!/bin/bash

echo "# SYSTEM"
echo
{
  echo "OS: $(awk -F= '/^PRETTY_NAME/ {gsub(/"/,"",$2); print $2}' /etc/os-release)" # https://runcloud.io/blog/check-os-version-in-linux
echo
  echo
  echo "# HARDWARE"
  echo
  echo "CPU: $(lscpu | grep 'Model name' | sed 's/Model name:\s*//')" # https://askubuntu.com/questions/988440/how-do-i-get-the-model-name-of-my-processor

  # awk is because the grep is already formatting with columns, but the column command make a weird mix of both
  lscpu | grep -E '^Core|^Socket|^CPU\(' | awk -F: '{print $1": "$2}' # https://unix.stackexchange.com/questions/218074/how-to-know-number-of-cores-of-a-system-in-linux
  
  echo "Total Memory: $(free -h --si | awk '/Mem:/ {print $2}')" # https://stackoverflow.com/questions/65871372/linux-find-os-disk-size-using-df-and-awk
  echo "Total Disk Space: $(df -h --total | awk '/total/ {print $2}')"
  echo
  echo "# CURRENT STATE"
  echo
  mem_used=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
  mem_used_h=$(free -h --si | awk '/Mem:/ {print $3}')
  echo "Used Memory: ${mem_used}% (${mem_used_h})"

  swap_used=$(free | awk '/Swap:/ { if ($2>0) printf "%.0f", $3/$2 * 100; else print 0 }') # https://stackoverflow.com/questions/53266933/system-command-for-awk
swap_used_h=$(free -m | awk '/Swap:/ {print $3 " MB"}')
  swap_used_h=$(free -m | awk '/Swap:/ {print $3 " MB"}')
  echo "Swap: ${swap_used}% (${swap_used_h})"

  disk_used=$(df -h --total | awk '/total/ {print $5}')
  echo "Used Disk Space: ${disk_used}"
} | column -t -s ':'                                                                                                                                                                                # Nils Moreau--Thomas
