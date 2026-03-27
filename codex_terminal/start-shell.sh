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

SESSION_NAME=workspace
WORKSPACE=/data/workspace

mkdir -p "${WORKSPACE}"
cd "${WORKSPACE}"

if tmux has-session -t "${SESSION_NAME}" 2>/dev/null; then
  exec tmux attach-session -t "${SESSION_NAME}"
fi

exec tmux new-session -s "${SESSION_NAME}" -c "${WORKSPACE}" /bin/zsh -il
