#!/usr/bin/env bash
set -euo pipefail

export HOME=/data/home
export SHELL=/bin/bash
export TERM=xterm-256color
export COLORTERM=truecolor
export EDITOR=nano
export PAGER=less
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export NPM_CONFIG_CACHE="${HOME}/.npm"
export NPM_CONFIG_PREFIX="${HOME}/.npm-global"
export PATH="${NPM_CONFIG_PREFIX}/bin:${PATH}"

WORKSPACE=/data/workspace

mkdir -p \
  "${HOME}" \
  "${XDG_CONFIG_HOME}" \
  "${XDG_CACHE_HOME}" \
  "${NPM_CONFIG_CACHE}" \
  "${NPM_CONFIG_PREFIX}/bin" \
  "${WORKSPACE}"

touch "${HOME}/.bash_history"

if [[ ! -f "${HOME}/.bash_profile" ]]; then
  cat > "${HOME}/.bash_profile" <<'EOF'
if [[ -f "${HOME}/.bashrc" ]]; then
  . "${HOME}/.bashrc"
fi
EOF
fi

if [[ ! -f "${HOME}/.bashrc" ]]; then
  cat > "${HOME}/.bashrc" <<'EOF'
export PATH="${HOME}/.npm-global/bin:${PATH}"
export NPM_CONFIG_PREFIX="${HOME}/.npm-global"
export NPM_CONFIG_CACHE="${HOME}/.npm"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export TERM=xterm-256color
export COLORTERM=truecolor
export EDITOR=nano
export PAGER=less
export PS1='[\u@codex \W]\$ '
cd /data/workspace
EOF
fi

cat > /etc/motd <<'EOF'
Codex Terminal for Home Assistant

Persistent paths:
  HOME      -> /data/home
  workspace -> /data/workspace

Codex login, npm cache, shell history, and everything under /data survive restarts.
EOF

cd "${WORKSPACE}"
exec ttyd \
  -W \
  -p 7681 \
  -t titleFixed="Codex Terminal" \
  -t fontSize=15 \
  /bin/bash --login
