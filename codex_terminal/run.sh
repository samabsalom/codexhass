#!/usr/bin/env bash
set -euo pipefail

export HOME=/data/home
export SHELL=/bin/zsh
export TERM=xterm-256color
export COLORTERM=truecolor
export EDITOR=nano
export PAGER=less
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export NPM_CONFIG_CACHE="${HOME}/.npm"
export NPM_CONFIG_PREFIX="${HOME}/.npm-global"
export PATH="${HOME}/.local/bin:${HOME}/bin:${NPM_CONFIG_PREFIX}/bin:${PATH}"

WORKSPACE=/data/workspace

mkdir -p \
  "${HOME}" \
  "${XDG_CONFIG_HOME}" \
  "${XDG_CACHE_HOME}" \
  "${NPM_CONFIG_CACHE}" \
  "${NPM_CONFIG_PREFIX}/bin" \
  "${WORKSPACE}"

touch "${HOME}/.bash_history"
touch "${HOME}/.zsh_history"

if [[ ! -f "${HOME}/.zshrc" ]]; then
  cp /opt/codex-terminal-defaults/zshrc "${HOME}/.zshrc"
fi

if [[ ! -f "${HOME}/.tmux.conf" ]]; then
  cp /opt/codex-terminal-defaults/tmux.conf "${HOME}/.tmux.conf"
fi

cat > /etc/motd <<'EOF'
Codex Terminal for Home Assistant

Persistent paths:
  HOME      -> /data/home
  workspace -> /data/workspace

This terminal starts in a persistent tmux session named "workspace".
Close the browser tab and reconnect later to resume the same session.
EOF

cd "${WORKSPACE}"
exec ttyd \
  -W \
  -p 7681 \
  -t titleFixed="Codex Terminal" \
  -t fontSize=15 \
  /usr/local/bin/start-shell.sh
