FROM ghcr.io/getpaseo/paseo:latest

USER root
RUN npm install -g opencode-ai

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      github-cli \
      curl \
      fzf \
      make \
      gcc \
      bun \
      python \
      uv \
      go \
      jq \
    rm -rf /var/lib/apt/lists/*

RUN bun install -g @oh-my-pi/pi-coding-agent
