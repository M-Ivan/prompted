#!/bin/bash

# Define the source and target files
PROMPT_SCRIPT="prompted.sh"
TARGET_DIR="$HOME"
TARGET_FILE="$TARGET_DIR/$PROMPT_SCRIPT"

echo "Installing prompted in $TARGET_FILE script..."
# Create a custom prompt script
cp "./$PROMPT_SCRIPT" "$TARGET_FILE"

# Function to source the custom prompt script if not already sourced
function source_prompt_script() {
    local profile_file="$1"
    local source_command="source $TARGET_FILE"

    # Check if the source command is already in the profile file
    if ! grep -Fxq "$source_command" "$profile_file"; then
        echo "$source_command" >>"$profile_file"
        echo "Added source command to $profile_file"
        echo "Installation complete. Please restart your terminal or run 'source $profile_file to apply the changes."
    else
        echo "Source command already present in $profile_file"
    fi
}

# Detect shell and source accordingly
if [ -n "$ZSH_VERSION" ]; then
    # For Zsh
    if [ -f "$HOME/.zshrc" ]; then
        source_prompt_script "$HOME/.zshrc"
    fi
elif [ -n "$BASH_VERSION" ]; then
    # For Bash
    if [ -f "$HOME/.bashrc" ]; then
        source_prompt_script "$HOME/.bashrc"
    fi
else
    echo "Unsupported shell. Please use Bash or Zsh."
    exit 1
fi
