# Changelog

## 0.1.1

- Fixed Home Assistant startup by disabling Docker init for the add-on
- Kept the Home Assistant base image init process as PID 1

## 0.1.0

- Initial release
- Added a `ttyd`-based Home Assistant terminal with persistent `/data` storage
- Added `npm`, `git`, `ripgrep`, and a pinned OpenAI Codex CLI
