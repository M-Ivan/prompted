#!/bin/bash

# Define the target file
PROMPT_SCRIPT="prompted.sh"
TARGET_FILE="$HOME/$PROMPT_SCRIPT"
SOURCE_COMMAND="source $TARGET_FILE"

# Function to remove the source command from the profile file
remove_source_command() {
    local profile_file="$1"

    echo "profile $1"

    # Check if the profile file exists
    if [ -f "$profile_file" ]; then
        # Remove the source command from the profile file
        sed -i.bak "\|$SOURCE_COMMAND|d" "$profile_file"
        echo "Removed source command from $profile_file"
        echo "Uninstallation complete. Please restart your terminal or run source $profile_file to apply the changes."
    fi
}
# Remove the custom prompt script from the home directory
if [ -f "$TARGET_FILE" ]; then
    echo "Removing $TARGET_FILE..."
    rm "$TARGET_FILE"
    echo "Removed $TARGET_FILE"
else
    echo "$TARGET_FILE does not exist"
fi

# Detect shell and remove source accordingly

if [ -f "$HOME/.zshrc" ]; then
    remove_source_command "$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    remove_source_command "$HOME/.bashrc"
else
    echo "Unsupported shell. Please use Bash or Zsh."
    exit 1

fi
