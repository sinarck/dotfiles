# znap: Fastest Zsh plugin manager
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
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export PNPM_HOME="/Users/charon/.local/share/pnpm"
export ANDROID_HOME=$HOME/Library/Android/sdk

# History
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_SAVE_NO_DUPS

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
PATH="$PATH:/Users/charon/.local/bin"                          
PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"
PATH="$PATH:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/Applications/iTerm.app/Contents/Resources/utilities"

export PATH

# Node Version Manager (nvm)
export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  source "$NVM_DIR/nvm.sh" --no-use
elif type brew >/dev/null 2>&1 && [[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ]]; then
  source "$(brew --prefix)/opt/nvm/nvm.sh" --no-use
fi
if [[ -s "$NVM_DIR/bash_completion" ]]; then
  source "$NVM_DIR/bash_completion"
fi

# Bun completions
if [ -s "$BUN_INSTALL/_bun" ]; then
  source "$BUN_INSTALL/_bun"
fi

# Shell Completions (znap handles compinit automatically)
znap eval pipx-completions 'register-python-argcomplete pipx'

# Aliases
alias ls='eza --icons --hyperlink -1'
alias ipaddr="ipconfig getifaddr en0"

# Plugin directory
zstyle ':znap:*' repos-dir ~/.zsh-plugins

# Plugins & Extensions
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search
znap source zsh-users/zsh-syntax-highlighting

# Subtle, background-free styling to avoid loud highlights
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=default'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=244'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=0.08

# History search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Tool Initializations (znap eval for 10x speed improvement)
znap eval thefuck-alias 'thefuck --alias'

# Fast prompt initialization (15-40ms)
znap eval starship 'starship init zsh --print-full-init'
znap prompt starship/starship