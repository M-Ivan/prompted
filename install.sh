#!/bin/bash

echo "Installing prompted..."
# Define the source and target files
PROMPT_SCRIPT="prompted.sh"
TARGET_DIR="$HOME"
TARGET_FILE="$TARGET_DIR/$PROMPT_SCRIPT"

echo "Copying the prompted definition to $TARGET_DIR"
# Copy the custom prompt script to the home directory
cp "./$PROMPT_SCRIPT" "$TARGET_FILE"

# Function to source the custom prompt script if not already sourced
source_prompt_script() {
    local profile_file="$1"
    local source_command="source $TARGET_FILE"

    echo "Adding source command to $profile_file"
    # Check if the source command is already in the profile file
    if ! grep -Fxq "$source_command" "$profile_file"; then
        echo "$source_command" >>"$profile_file"
        echo "Added source command to $profile_file"
    else
        echo "Source command already present in $profile_file"
    fi
}

# Source the custom prompt script in .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    source_prompt_script "$HOME/.zshrc"
fi

# Source the custom prompt script in .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    source_prompt_script "$HOME/.bashrc"
fi

echo "Installation complete. Please restart your terminal or run 'source ~/.zshrc' or 'source ~/.bashrc' to apply the changes."
echo "If you like prompted gift me a star on GitHub! https://github.com/M-Ivan/prompted"
