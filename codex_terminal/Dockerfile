ARG BUILD_FROM=alpine:3.22
FROM ${BUILD_FROM}

ARG CODEX_VERSION=0.117.0
ARG OH_MY_ZSH_REF=master
ARG ZSH_AUTOSUGGESTIONS_REF=master
ARG ZSH_SYNTAX_HIGHLIGHTING_REF=master

RUN apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    git \
    less \
    nano \
    nodejs \
    npm \
    openssh-client \
    ripgrep \
    tmux \
    ttyd \
    zsh \
  && git clone --depth=1 --branch "${OH_MY_ZSH_REF}" https://github.com/ohmyzsh/ohmyzsh.git /opt/oh-my-zsh \
  && mkdir -p /opt/oh-my-zsh/custom/plugins \
  && git clone --depth=1 --branch "${ZSH_AUTOSUGGESTIONS_REF}" https://github.com/zsh-users/zsh-autosuggestions.git /opt/oh-my-zsh/custom/plugins/zsh-autosuggestions \
  && git clone --depth=1 --branch "${ZSH_SYNTAX_HIGHLIGHTING_REF}" https://github.com/zsh-users/zsh-syntax-highlighting.git /opt/oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
  && npm install -g "@openai/codex@${CODEX_VERSION}" \
  && codex --version

COPY defaults /opt/codex-terminal-defaults
COPY run.sh /run.sh
COPY start-shell.sh /usr/local/bin/start-shell.sh
RUN chmod a+x /run.sh
RUN chmod a+x /usr/local/bin/start-shell.sh

CMD ["/run.sh"]
