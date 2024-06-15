#!/bin/bash

mkdir -p /etc/sysdiagx/output
date=$(date +"%d-%m-%Y-%H-%M-%S")
output="/etc/sysdiagx/output/${date}.txt"
# output="/etc/sysdiagx/output/latest.txt"
# echo "" > "${output}"

cpu() {
    echo "======================================== CPU ========================================"
    lscpu
    echo ""
    echo "======================================== CPU ========================================" >> "$output"
    lscpu >> "$output"
    echo "" >> "$output"
}

gpu() {
    echo "======================================== GPU ========================================"
    lspci | grep -i "VGA"
    echo ""
    echo "======================================== GPU ========================================" >> "$output"
    lspci | grep -i "VGA" >> "$output"
    echo "" >> "$output"
}

board() {
    echo "======================================== Board ========================================"
    dmidecode -t baseboard
    echo ""
    echo "======================================== Board ========================================" >> "$output"
    dmidecode -t baseboard >> "$output"
    echo "" >> "$output"
}

ram() {
    echo "======================================== RAM ========================================"
    free -h
    echo ""
    echo "======================================== RAM ========================================" >> "$output"
    free -h >> "$output"
    echo "" >> "$output"
}

storage() {
    echo "======================================== Storage ========================================"
    df -h
    echo ""
    echo "======================================== Storage ========================================" >> "$output"
    df -h >> "$output"
    echo "" >> "$output"
}

network() {
    echo "======================================== Networking ========================================"
    ifconfig -a
    echo ""
    echo "======================================== Networking ========================================" >> "$output"
    ifconfig -a >> "$output"
    echo "" >> "$output"
}

kernel() {
    echo "======================================== Kernel ========================================"
    uname -a
    echo ""
    echo "======================================== Kernel ========================================" >> "$output"
    uname -a >> "$output"
    echo "" >> "$output"
}

user() {
    echo "$(whoami)"
}

logo() {
        echo "
  ██████▓██   ██▓  ██████ ▓█████▄  ██▓ ▄▄▄        ▄████ ▒██   ██▒
▒██    ▒ ▒██  ██▒▒██    ▒ ▒██▀ ██▌▓██▒▒████▄     ██▒ ▀█▒▒▒ █ █ ▒░
░ ▓██▄    ▒██ ██░░ ▓██▄   ░██   █▌▒██▒▒██  ▀█▄  ▒██░▄▄▄░░░  █   ░
  ▒   ██▒ ░ ▐██▓░  ▒   ██▒░▓█▄   ▌░██░░██▄▄▄▄██ ░▓█  ██▓ ░ █ █ ▒ 
▒██████▒▒ ░ ██▒▓░▒██████▒▒░▒████▓ ░██░ ▓█   ▓██▒░▒▓███▀▒▒██▒ ▒██▒
▒ ▒▓▒ ▒ ░  ██▒▒▒ ▒ ▒▓▒ ▒ ░ ▒▒▓  ▒ ░▓   ▒▒   ▓▒█░ ░▒   ▒ ▒▒ ░ ░▓ ░
░ ░▒  ░ ░▓██ ░▒░ ░ ░▒  ░ ░ ░ ▒  ▒  ▒ ░  ▒   ▒▒ ░  ░   ░ ░░   ░▒ ░
░  ░  ░  ▒ ▒ ░░  ░  ░  ░   ░ ░  ░  ▒ ░  ░   ▒   ░ ░   ░  ░    ░  
      ░  ░ ░           ░     ░     ░        ░  ░      ░  ░    ░  
         ░ ░               ░                                                                                                                                                                                                   
"

echo "Logged as: $(user)

" >> "$output"
}

_print() {
    logo
    cpu
    gpu
    board
    ram
    storage
    network
    kernel
}

clear
_print

echo "

Thank you for using SysDiagX!"
echo "System report has been saved into $output"
echo "Support developer here => https://buymeacoffee.com/ondra907"
