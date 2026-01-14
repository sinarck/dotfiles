# Znap plugin manager
[[ -r ~/.zsh-snap/znap.zsh ]] ||
  git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git ~/.zsh-snap
source ~/.zsh-snap/znap.zsh

# Prompt
znap eval starship 'starship init zsh --print-full-init'

# Speed improvements (set early)
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1
DISABLE_COMPFIX="true"

# Development tools and language managers
export BUN_INSTALL="$HOME/.bun"
export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_NO_ENV_HINTS=1
export EDITOR="zed"
export VISUAL="zed"
export PNPM_HOME="$HOME/.local/share/pnpm"
export ANDROID_HOME=$HOME/Library/Android/sdk
export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"
export QMK_HOME="~/qmk_firmware"

# History settings
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# PATH setup (N qualifier skips non-existent directories)
path=(
  $BUN_INSTALL/bin(N)
  /opt/homebrew/{bin,sbin}(N)
  /opt/homebrew/opt/e2fsprogs/bin(N)
  /usr/local/bin(N)
  $HOME/.cargo/bin(N)
  $PNPM_HOME(N)
  $path
  $HOME/.local/bin(N)
  $ANDROID_HOME/{emulator,platform-tools}(N)
  /Applications/iTerm.app/Contents/Resources/utilities(N)
)

# Znap repos directory
zstyle ':znap:*' repos-dir ~/.zsh-plugins

# Tab completion styles (before plugins)
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{#e79881}%B%d%b%f'
zstyle ':completion:*:warnings' format '%F{#df5b61}No matches found%f'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colors (cached)
[[ -r ~/.config/zsh/colors.zsh ]] && znap eval colors 'cat ~/.config/zsh/colors.zsh'

# Plugins
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search
znap source zdharma-continuum/fast-syntax-highlighting

# Arrow keys search history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Cached evals
znap eval zoxide 'zoxide init zsh'
znap eval try 'ruby ~/.local/try.rb init ~/Developer/tries'
znap eval bun-completion 'cat "$HOME/.bun/_bun"'

# Lazy-load heavy tools on first use
znap function _nvm nvm 'source "$NVM_DIR/nvm.sh"'
compctl -K _nvm nvm

znap function _sdk sdk 'source "$SDKMAN_DIR/bin/sdkman-init.sh"'
compctl -K _sdk sdk

znap function _fuck fuck 'znap eval thefuck-alias "thefuck --alias"'
compctl -K _fuck fuck

# Command aliases
alias ls='eza --icons -1'
alias ll='eza --icons -l'
alias la='eza --icons -la'
alias tree='eza --tree --icons'
alias cat='bat --style=plain'
alias ipaddr='ipconfig getifaddr en0'
alias fetch='fastfetch'
alias c='clear'
alias spot="spotify_player"
alias localserve="bpx live-server --port=5500 ."

# Git aliases
alias ga="git add"
alias gaa="git add ."
alias gcm="git commit -am"
alias gp="git push"
alias gg="git add "
alias gs="git status"
alias gst="git stash"
alias gstp="git stash pop"

# bun completions
[ -s "/Users/charon/.bun/_bun" ] && source "/Users/charon/.bun/_bun"
