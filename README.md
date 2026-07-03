# paseo-dev

This Docker image provides a development environment for [paseo](https://paseo.dev), including the paseo CLI tool (`@getpaseo/cli`), `opencode-ai`, and common development dependencies (git, gh, node, bun, python, go, etc.)

Built on `archlinux:latest`.

## Usage

```
docker build -t paseo-dev .
docker run -it --rm -v $(pwd):/workspace paseo-dev
```