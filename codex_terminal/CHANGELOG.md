# Changelog

## 0.1.3

- Added `zsh`, `oh-my-zsh`, and `tmux`
- Started the terminal inside a persistent tmux session named `workspace`
- Added Linux-safe `zsh` and `tmux` defaults adapted from the owner's dotfiles

## 0.1.2

- Mapped Home Assistant config, share, and add-on config directories into `/data/workspace`
- Kept the add-on within Home Assistant's supported directory mapping model

## 0.1.1

- Fixed Home Assistant startup by disabling Docker init for the add-on
- Kept the Home Assistant base image init process as PID 1

## 0.1.0

- Initial release
- Added a `ttyd`-based Home Assistant terminal with persistent `/data` storage
- Added `npm`, `git`, `ripgrep`, and a pinned OpenAI Codex CLI
