# Displays your private ip in the prompt
function private_ip() {
    ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'
}

# Displays the current git branch in the prompt or empty string if not in a git repo
function git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        echo "($branch)"
    fi
}

# Displays the prompt with the last exit code if it was not 0
# And loads other vars
function zsh_prompt() {
    local last_exit_code=$?
    local prompt_symbol="√"

    if [[ $last_exit_code -ne 0 ]]; then
        prompt_symbol=$last_exit_code
    fi

    local user_name="%n"
    local ip_address=$(private_ip)
    local workspace="%~"
    local branch=$(git_branch)

    # Format definition
    PS1="${prompt_symbol} ${user_name}@${ip_address} > ${workspace} ${branch} \$ "
}

autoload -U add-zsh-hook
add-zsh-hook precmd zsh_prompt
