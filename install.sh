#!/bin/bash

# Prompt for running apt commands with root rights
read -p "Do you want to run the apt commands with root rights? (y/n): " root_rights

# Function to execute a command with or without sudo
execute_command() {
    if [[ $root_rights == [Yy]* ]]; then
        sudo "$@"
    else
        "$@"
    fi
}

# Update package lists
execute_command apt update

# Upgrade installed packages
execute_command apt upgrade -y

# Install Git
execute_command apt install git -y

# Install Zsh
execute_command apt install zsh -y

# Install htop
execute_command apt install htop -y

# Generate a random port number between 50000 and 64000
random_port=$(shuf -i 50000-64000 -n 1)

# Uncomment the Port line if commented and change the SSH port in /etc/ssh/sshd_config
execute_command sed -i '/^#Port/s/^#//' /etc/ssh/sshd_config
execute_command sed -i "s/^Port .*/Port $random_port/" /etc/ssh/sshd_config

# Prominently print the new SSH port
echo "============================================="
echo "IMPORTANT: Your new SSH port is $random_port"
echo "============================================="

# Ask user if they've noted the new SSH port
while true; do
    read -p "Have you noted the new SSH port? (y/n): " noted_port
    if [[ $noted_port == [Yy]* ]]; then
        break
    fi
done

# Inform user to restart SSH server
echo "Please restart the SSH server to apply the changes."

# Download and run Oh My Zsh installer
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
