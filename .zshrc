# Switching NodeJS versions
alias nodeLatest='export PATH="/opt/homebrew/opt/node/bin:$PATH"'
alias node16='export PATH="/opt/homebrew/opt/node@16/bin:$PATH"'
alias vsu='npx @volvo/vce-service-util@latest'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
export NVM_DIR="$HOME/.nvm"
source ~/.nvm/nvm.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/henlit/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/henlit/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/henlit/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/henlit/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
clear

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Search ~/Code for folders
function work() {
	cd "$(find $HOME/Code -type d -maxdepth 2 | fzf)"
}

