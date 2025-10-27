# Install plugin manager if necessary
if [[ ! -f $HOME/.zsh-snap/znap.zsh ]]; then
  mkdir -p $HOME/.zsh-snap &&
    git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git $HOME/.zsh-snap
fi

source $HOME/.zsh-snap/znap.zsh

# Environment Variables
export BUN_INSTALL="$HOME/.bun"
export XDG_CONFIG_HOME="$HOME/.config"
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_NO_ENV_HINTS=1
export EDITOR="cursor"
export VISUAL="cursor"
export PNPM_HOME="$HOME/.local/share/pnpm"
export ANDROID_HOME=$HOME/Library/Android/sdk

# History Configuration
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000

# History Options
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

# Directory Navigation Options
setopt AUTO_CD                   # Type directory name to cd into it
setopt AUTO_PUSHD                # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicate directories
setopt PUSHD_SILENT              # Don't print directory stack after pushd/popd

# Build PATH with proper precedence order
PATH="$BUN_INSTALL/bin:$PATH"
PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/sbin:$PATH"
PATH="/opt/homebrew/opt/e2fsprogs/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"

 # PNPM binaries
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) PATH="$PNPM_HOME:$PATH" ;;
esac

# User and system PATH additions
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"

# System and application paths
PATH="$PATH:/System/Cryptexes/App/usr/bin"
PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin"
PATH="$PATH:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin"
PATH="$PATH:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin"
PATH="$PATH:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin"
PATH="$PATH:/Library/Apple/usr/bin"
PATH="$PATH:/Applications/iTerm.app/Contents/Resources/utilities"

export PATH

# Bun completions
if [ -s "$BUN_INSTALL/_bun" ]; then
  source "$BUN_INSTALL/_bun"
fi

# LS_COLORS for eza 
export LS_COLORS="di=38;5;110:ln=38;5;117:so=38;5;223:pi=38;5;223:ex=38;5;150:bd=38;5;217:cd=38;5;217:su=38;5;204:sg=38;5;204:tw=38;5;110:ow=38;5;110:*.txt=38;5;253:*.md=38;5;223:*.json=38;5;223:*.js=38;5;150:*.ts=38;5;150:*.py=38;5;223:*.sh=38;5;150:*.rs=38;5;223:*.go=38;5;117:*.java=38;5;204:*.zip=38;5;204:*.tar=38;5;204:*.gz=38;5;204"
export EZA_COLORS="da=38;5;244:sb=38;5;244:sn=38;5;244:uu=38;5;150:un=38;5;204:gu=38;5;150:gn=38;5;204"

# Aliases
alias ls='eza --icons --hyperlink -1'
alias ll='eza --icons --hyperlink -l'
alias la='eza --icons --hyperlink -la'
alias tree='eza --tree --icons'
alias cat='bat --style=plain'
alias ipaddr="ipconfig getifaddr en0"
alias fetch="fastfetch"
alias c="clear"

# Plugin directory
zstyle ':znap:*' repos-dir ~/.zsh-plugins

# Completion Styling 
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{#e79881}%B%d%b%f'
zstyle ':completion:*:warnings' format '%F{#df5b61}No matches found%f'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Plugins & Extensions
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search
znap source zsh-users/zsh-syntax-highlighting

# Syntax Highlighting Colors 
ZSH_HIGHLIGHT_STYLES[default]='fg=#edeff0'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#df5b61'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#c58cec'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#81c19b'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#81c19b'
ZSH_HIGHLIGHT_STYLES[function]='fg=#709ad2'
ZSH_HIGHLIGHT_STYLES[command]='fg=#81c19b'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#70b8ca'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#e79881'
ZSH_HIGHLIGHT_STYLES[path]='fg=#709ad2,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#e79881'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#de8f78'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#de8f78'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#2c2e2f'

# Autosuggestion Colors 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#2c2e2f'

# History Substring Search Colors 
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=#edeff0,bg=#2c2e2f'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=#df5b61'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=0.08

# History search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Tool Initializations
znap eval thefuck-alias 'thefuck --alias'
znap eval zoxide 'zoxide init zsh'

# Lazy Loading
export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"

znap function nvm 'source "$NVM_DIR/nvm.sh"'

if [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]]; then
  znap function sdk 'source "$SDKMAN_DIR/bin/sdkman-init.sh"'
fi

# Prompt
znap eval starship 'starship init zsh --print-full-init'
znap prompt starship/starship
