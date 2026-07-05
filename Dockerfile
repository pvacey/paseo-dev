FROM archlinux:latest

RUN pacman -Syu --noconfirm \
    git github-cli jq fzf make gcc diffutils openssh lsof net-tools unzip nodejs npm bun python uv go \
    && pacman -Scc --noconfirm

RUN npm install -g @getpaseo/cli opencode-ai \
    && npm cache clean --force

RUN curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash

WORKDIR /workspace
