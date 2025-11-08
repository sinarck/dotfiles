# Dotfiles

My configs, managed with [GNU Stow](https://www.gnu.org/software/stow/).

Theme colors based on [Yoru](https://github.com/raexera/yoru) by [@raexera](https://github.com/raexera).

## What's Here

- **`bat/`** - Syntax highlighting with custom Yoru theme
- **`fastfetch/`** - System info display with Yoru colors
- **`ghostty/`** - Terminal config with Yoru theme
- **`git/`** - Git config with SSH signing
- **`opencode/`** - AI coding assistant with custom Yoru theme
- **`starship/`** - Prompt with Yoru colors
- **`zsh/`** - Shell config with znap and lazy loading

## Setup

```bash
# Clone
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Stow everything
stow */

# Or pick what you want
stow zsh starship ghostty
```

You'll need `stow` installed first (`brew install stow` on Mac).

## Details

### Zsh
- znap plugin manager with lazy-loaded nvm and sdkman
- 1M+ history with smart deduplication
- Yoru-themed syntax highlighting and completions
- Custom LS_COLORS for eza

### Bat
- Custom Yoru theme for syntax highlighting
- Nice defaults with line numbers

### Fastfetch
- Color-coded system info modules
- Compact display with small logo
- Shows OS, kernel, host, disk, battery, and memory

### Starship
- Minimal two-line prompt
- Yoru color palette throughout
- Shows git, language versions, and command duration

### Ghostty
- GeistMono NF font
- Custom Yoru theme in `themes/yoru`
- Clean titlebar on macOS

### Git
- SSH commit signing
- Git LFS enabled
- Pulls in private config for user details

### Opencode
- Custom Yoru theme for consistent visual experience
- Modern color palette with enhanced contrast
- Syntax highlighting optimized for readability

## Notes

To remove configs: `stow -D packagename`

Files are symlinked, so edits here update immediately.