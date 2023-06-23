# Server Setup Basics

This repository contains scripts for basic server setup. Below is the command to install and run the scripts:

## What does this script?

It installs these tools:
- Git: Version control system used for tracking changes in files.
- Zsh: A powerful and customizable shell with additional features and improvements over the default shell (Bash).
- htop: An interactive process viewer and system monitor that provides detailed information about system resources and processes.

Additionally, the script makes the following changes to the system configuration:
- Generates a random port number between 50000 and 64000.
- Modifies the SSH configuration file (/etc/ssh/sshd_config) to uncomment the Port line if it is commented out and changes the SSH port to the generated random port.
- Requests the user to manually restart the SSH server to apply the changes.
- Please note that the script also initiates the installation of Oh My Zsh, a framework for managing Zsh configuration. Oh My Zsh provides various themes, plugins, and features to enhance the Zsh shell experience. However, the exact set of components installed by Oh My Zsh may vary based on your system and configuration.

If you have any further questions or need additional information, feel free to ask!

## Usage

### Step 1
```shell
cd ~ && curl -o install.sh https://raw.githubusercontent.com/j0hannesr0th/server-setup-basics/main/install.sh && chmod +x install.sh && sudo ./install.sh
```

### Step 2

```shell
cd ~ && curl -o post_install.sh https://raw.githubusercontent.com/j0hannesr0th/server-setup-basics/main/post_install.sh && chmod +x post_install.sh && ./post_install.sh && rm install.sh && rm post_install.sh
```
