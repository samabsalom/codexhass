ARG BUILD_FROM=alpine:3.22
FROM ${BUILD_FROM}

ARG CODEX_VERSION=0.117.0

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
    ttyd \
  && npm install -g "@openai/codex@${CODEX_VERSION}" \
  && codex --version

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
