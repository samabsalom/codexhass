# Codex Home Assistant Add-ons

This repository contains a custom Home Assistant add-on that provides a lightweight browser terminal through Home Assistant ingress. The terminal includes:

- `npm`
- `codex`
- persistent shell state under `/data`

## Included add-on

- `codex_terminal`: a `ttyd`-based terminal with `npm`, `git`, and the OpenAI Codex CLI preinstalled

## Persistence

The add-on stores its persistent state inside Home Assistant's add-on data volume:

- `HOME=/data/home`
- workspace: `/data/workspace`

That means Codex auth, npm cache, shell history, and anything else you keep under `/data` survives restarts and upgrades.

## Publish To GitHub

1. Create an empty GitHub repository.
2. From this directory, run:

```bash
git init
git add .
git commit -m "Initial Home Assistant Codex add-on"
git branch -M main
git remote add origin git@github.com:<your-user>/<your-repo>.git
git push -u origin main
```

If you prefer HTTPS, use:

```bash
git remote add origin https://github.com/<your-user>/<your-repo>.git
```

## Add To Home Assistant

1. In Home Assistant, open `Settings -> Add-ons -> Add-on Store`.
2. Open the overflow menu in the top right and choose `Repositories`.
3. Paste your GitHub repository URL and save.
4. Install `Codex Terminal`.
5. Start the add-on and open it from the sidebar.
6. Run `codex login` in the terminal. Your login will persist in `/data/home/.codex`.

## Notes

- The add-on is built from source by Home Assistant because `config.yaml` intentionally omits an `image` field.
- The current Codex CLI package publishes Linux binaries for `amd64` and `aarch64`, so the add-on is limited to those Home Assistant architectures.
