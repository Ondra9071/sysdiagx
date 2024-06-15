# SysDiagX
SysDiagX is a lightweight bash script designed to provide detailed system information with ease. Whether you're troubleshooting, documenting your system configuration, or simply curious about your hardware and software setup, SysDiagX offers comprehensive insights at your fingertips.

## Features
- Detailed System Overview: Get comprehensive details about your CPU, GPU, motherboard, RAM, storage devices, and network configuration.
- Console and File Output: View system information directly in your terminal and save a complete log into a text file.
- User-Friendly: Simple to use with clear sectioned outputs for quick reference and troubleshooting.

## Usage:
### Install [curl](https://curl.se/) with your package manager, for example I'm using APT for Ubuntu/Debian:
```
sudo apt update && sudo apt install curl && curl --version
```
### Run installation script
```
curl -sS https://sysdiagx.ondrejpacovsky.cz/ftp/install.sh | sudo bash
```
If everything worked as it should then everything should be installed. Then just always use this command:
```sysdiagx```

### File output
SysDiagX will also save a complete log of the system information to `/etc/sysdiagx/output/`. This log file contains the same detailed information shown in the terminal output, making it easy to reference or share. (**Beware that the file contains an IP in the Network part**)

### License
This project is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License. By using this script, you agree to abide by the terms of this license. For more details, see the [LICENSE](./LICENSE) file included in this repository.
