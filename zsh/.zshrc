export PATH=$HOME/bin:/usr/local/bin:$PATH
# echo source ~/.bash_profile

eval "$(brew shellenv)"
# source .zprofile in all zsh shells (just in case)
[[ -f "$HOME/.zprofile" ]] && source "$HOME/.zprofile"

eval "$(gdircolors)"

export HOMEBREW_GITHUB_API_TOKEN="API_TOKEN"
export GITHUB_API_TOKEN="API_TOKEN"

#----------------------------------------

# zsh plugins
plugins=(
    git 
    brew
    kubectl
    kubectx
    ## with oh-my-zsh and not homebrew
    # zsh-autosuggestions ( git clone <find link in the repo> and uncomment  )
    # zsh-syntax-highlighting ( git clone <find link in the repo> and uncomment )
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


# unbind ctrl g in terminal
bindkey -r "^G"

# Starship 
bindkey -v
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# FZF
eval "$(fzf --zsh)"

# FZF with Git right in the shell by Junegunn : check out his github below
# Keymaps for this is available at https://github.com/junegunn/fzf-git.sh
# source ~/scripts/fzf-git.sh

# Atuin Configs
# export ATUIN_NOBIND="true"
# eval "$(atuin init zsh)"
# bindkey '^r' _atuin_search_widget
# bindkey '^r' atuin-up-search-viins
#User configuration
# export MANPATH="/usr/local/man:$MANPATH"

#----- Vim Editing modes & keymaps ------ 
set -o vi

export EDITOR=nvim
export VISUAL=nvim

bindkey -M viins '^E' autosuggest-accept
bindkey -M viins '^P' up-line-or-history
bindkey -M viins '^N' down-line-or-history
# -------------------ALIAS----------------------
# These alias need to have the same exact space as written here
# HACK: For Running Go Server using Air
alias air='$(go env GOPATH)/bin/air'

# other Aliases shortcuts
alias c="clear"
alias e="exit"
alias vim="nvim"

# Tmux 
alias tmux="tmux -f $TMUX_CONF"
alias a="attach"
# calls the tmux new session script
alias tns="~/scripts/tmux-sessionizer"

# fzf 
# called from ~/scripts/
alias nlof="~/scripts/fzf_listoldfiles.sh"
# opens documentation through fzf (eg: git,zsh etc.)
alias fman="compgen -c | fzf | xargs man"

# zoxide (called from ~/scripts/)
alias nzo="~/scripts/zoxide_openfiles_nvim.sh"

# Next level of an ls 
# options :  --no-filesize --no-time --no-permissions 
alias ls="eza --no-filesize --long --color=always --icons=always --no-user" 

# tree
alias tree="tree -L 3 -a -I '.git' --charset X "
alias dtree="tree -L 3 -a -d -I '.git' --charset X "

# lstr
alias lstr="lstr --icons"

alias nvim-scratch="NVIM_APPNAME=nvim-scratch nvim"

# lazygit
alias lg="lazygit"

# brew installations activation (new mac systems brew path: opt/homebrew , not usr/local )
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
