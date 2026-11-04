FROM ghcr.io/getpaseo/paseo:latest

USER root
RUN npm install -g opencode-ai

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      curl \
      jq \
      fzf \
      make \
      gcc \
      unzip \
      python3 \
      python-is-python3 \
      git \
      wget \
      vim \
      less \
      tmux \
      htop \
      tree \
      zip \
      ripgrep \
      fd-find \
      man-db \
      openssh-client \
      build-essential \
      pkg-config \
      libssl-dev \
    && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update && apt-get install -y github-cli \
    && curl -fsSL https://golang.org/dl/$(curl -fsSL https://go.dev/VERSION\?m\=text | head -1).linux-amd64.tar.gz | tar -C /usr/local -xzf - \
    && curl -fsSL https://omp.sh/install | sh \
    && pip install uv; \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://github.com/oven-sh/bun/releases/latest/download/bun-linux-x64.zip -o bun.zip \
    && unzip bun.zip \
    && mv bun-linux-x64/bun /usr/local/bin/bun \
    && chmod +x /usr/local/bin/bun \
    && rm -rf bun.zip bun-linux-x64

RUN bun --version
