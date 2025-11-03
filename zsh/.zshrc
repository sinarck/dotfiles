# Znap plugin manager
[[ -r ~/.zsh-snap/znap.zsh ]] ||
  git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git ~/.zsh-snap
source ~/.zsh-snap/znap.zsh

# Development tools and language managers
export BUN_INSTALL="$HOME/.bun"
export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_NO_ENV_HINTS=1
export EDITOR="cursor"
export VISUAL="cursor"
export PNPM_HOME="$HOME/.local/share/pnpm"
export ANDROID_HOME=$HOME/Library/Android/sdk
export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"

# History settings
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt EXTENDED_HISTORY          # Record timestamp of command
setopt INC_APPEND_HISTORY        # Write immediately, not on shell exit
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicates first
setopt HIST_IGNORE_DUPS          # Don't record duplicate consecutive commands
setopt HIST_IGNORE_ALL_DUPS      # Delete old duplicate entries
setopt HIST_FIND_NO_DUPS         # Don't display duplicates when searching
setopt HIST_IGNORE_SPACE         # Don't record commands starting with space
setopt HIST_SAVE_NO_DUPS         # Don't write duplicates to history file
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks
setopt HIST_VERIFY               # Don't execute immediately on history expansion

# Directory navigation
setopt AUTO_CD                   # Type directory name to cd into it
setopt AUTO_PUSHD                # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicate directories
setopt PUSHD_SILENT              # Don't print directory stack after pushd/popd

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

# Colors and syntax highlighting styles
[[ -r ~/.config/zsh/colors.zsh ]] && source ~/.config/zsh/colors.zsh

# Command aliases
alias ls='eza --icons --hyperlink -1'
alias ll='eza --icons --hyperlink -l'
alias la='eza --icons --hyperlink -la'
alias tree='eza --tree --icons'
alias cat='bat --style=plain'
alias ipaddr='ipconfig getifaddr en0'
alias fetch='fastfetch'
alias c='clear'
alias ga='git add'
alias gaa='git add --all'

# Znap manages plugins from this directory
zstyle ':znap:*' repos-dir ~/.zsh-plugins

# Tab completion styles
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{#e79881}%B%d%b%f'
zstyle ':completion:*:warnings' format '%F{#df5b61}No matches found%f'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Plugins
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search
znap source zsh-users/zsh-syntax-highlighting

# Arrow keys search history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Smart directory jumping
znap eval zoxide 'zoxide init zsh'

# Lazy-load heavy tools on first use
znap function nvm 'source "$NVM_DIR/nvm.sh"'
znap function sdk 'source "$SDKMAN_DIR/bin/sdkman-init.sh"'
znap function fuck 'znap eval thefuck-alias "thefuck --alias"'

# Prompt
znap eval starship 'starship init zsh --print-full-init'

