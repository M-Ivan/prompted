# Displays your private ip in the prompt
function private_ip() {
    # MacOS and Linux have different commands to get the private IP address
    if [[ "$OSTYPE" == "darwin"* ]]; then
        ip_address=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}')
    else
        ip_address=$(hostname -I | awk '{print $1}')
    fi

    echo $ip_address

}

# Displays the current git branch in the prompt or empty string if not in a git repo
function git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        echo "($branch)"
    fi
}

function set_ps1() {
    local last_exit_code=$?
    local prompt_symbol="√"

    if [[ $SHELL == *"bash"* ]]; then
        local user_name="\u"
        local workspace="\w"

    fi
    if [[ $SHELL == *"zsh"* ]]; then
        local user_name="%n"
        local workspace="%~"
    fi

    if [[ $last_exit_code -ne 0 ]]; then
        prompt_symbol=$last_exit_code
    fi

    ip_address=$(private_ip)
    local branch=$(git_branch)

    PS1="${prompt_symbol} ${user_name}@${ip_address} > ${workspace} ${branch} \$ "
}

# Apply the function to update PS1
if [[ $SHELL == *"bash"* ]]; then
    PROMPT_COMMAND=set_ps1
elif [[ $SHELL == *"zsh"* ]]; then
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd set_ps1
fi
