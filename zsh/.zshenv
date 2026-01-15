# Set ZDOTDIR to keep ~ clean
export ZDOTDIR="$HOME/.config/zsh"

# Prevent macOS /etc/zshrc from running compinit early
skip_global_compinit=1

# Disable macOS session restoration
SHELL_SESSIONS_DISABLE=1
