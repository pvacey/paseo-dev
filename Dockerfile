FROM archlinux:latest

RUN pacman -Syu --noconfirm \
    git github-cli jq fzf make gcc diffutils openssh lsof net-tools unzip nodejs npm bun python uv go \
    && pacman -Scc --noconfirm

RUN npm install -g @getpaseo/cli opencode-ai \
    && cd $(npm root -g)/opencode-ai && node postinstall.mjs \
    && npm cache clean --force

COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

WORKDIR /workspace
