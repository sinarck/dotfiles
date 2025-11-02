# File listing colors for eza
export LS_COLORS="di=38;5;110:ln=38;5;117:so=38;5;223:pi=38;5;223:ex=38;5;150:bd=38;5;217:cd=38;5;217:su=38;5;204:sg=38;5;204:tw=38;5;110:ow=38;5;110:*.txt=38;5;253:*.md=38;5;223:*.json=38;5;223:*.js=38;5;150:*.ts=38;5;150:*.py=38;5;223:*.sh=38;5;150:*.rs=38;5;223:*.go=38;5;117:*.java=38;5;204:*.zip=38;5;204:*.tar=38;5;204:*.gz=38;5;204"
export EZA_COLORS="da=38;5;244:sb=38;5;244:sn=38;5;244:uu=38;5;150:un=38;5;204:gu=38;5;150:gn=38;5;204"

# Syntax highlighting colors
typeset -gA ZSH_HIGHLIGHT_STYLES
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

# Autosuggestion color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#2c2e2f'

# History search colors
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=#edeff0,bg=#2c2e2f'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=#df5b61'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_TIMEOUT=0.08
