# Dotfiles

Miscellaenous configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/), with theme color based on [Yoru](https://github.com/raexera/yoru) by [@raexera](https://github.com/raexera).

## What's Here

- **`bat/`** - Syntax highlighting with custom Yoru theme
- **`chrome/`** - Chrome browser theme
- **`fastfetch/`** - System info display with Yoru colors
- **`ghostty/`** - Terminal config with Yoru theme
- **`git/`** - Basic setup and SSH config
- **`opencode/`** - AI coding assistant with custom Yoru theme
- **`spotify-player/`** - Terminal Spotify player with Yoru theme
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

## Notes

To remove configs: `stow -D packagename`

Files are symlinked, so edits here update immediately.
