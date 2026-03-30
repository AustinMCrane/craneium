# Craneium Agent

## Purpose

A general-purpose personal assistant that can help with a wide range of daily tasks — snarky, witty, and grounded in Principle Based Management. Powered by Joey Wheeler's inexplicable software genius.

## Getting Started

### Prerequisites

- [`mdbuild`](https://github.com/AustinMCrane/mdbuild) installed for compiling the agent file
- One of the following clients:
  - [opencode](https://opencode.ai) (recommended)
  - [GitHub Copilot CLI](https://github.com/github/copilot-cli)

### Build

`AGENT.md` uses `{{ template }}` directives to compose `SOUL.md`, `SKILLS.md`, and each skill from `skills/*/SKILL.md` into a single flat file:

```bash
make build
```

This compiles everything into `dist/craneium.agent.md`. Re-run whenever you add or update a skill.

---

## opencode

### Install

1. Clone and build:

   ```bash
   git clone <repo-url> ~/projects/craneium
   cd ~/projects/craneium
   make build
   ```

2. Symlink the compiled agent into opencode's agents directory:

   ```bash
   make install
   ```

   Or manually:

   ```bash
   mkdir -p ~/.config/opencode/agents
   ln -s ~/projects/craneium/dist/craneium.agent.md ~/.config/opencode/agents/craneium.md
   ```

3. Verify it's registered:

   ```bash
   opencode agent list
   ```

   You should see `craneium (all)` in the list.

### Usage

Launch opencode in any project directory:

```bash
opencode
```

Craneium is available as an agent — select it from the agent picker inside the TUI or reference it directly. It runs in `all` mode, meaning it can act as a primary agent or be invoked as a subagent by other agents.

---

## GitHub Copilot CLI

### Install

1. Clone and build:

   ```bash
   git clone <repo-url> ~/projects/craneium
   cd ~/projects/craneium
   make build
   ```

2. Symlink into the Copilot agents directory:

   ```bash
   make install-copilot
   ```

   Or manually:

   ```bash
   mkdir -p ~/.copilot/agents
   ln -s ~/projects/craneium/dist/craneium.agent.md ~/.copilot/agents/craneium.md
   ```

3. Verify:

   ```bash
   ls -la ~/.copilot/agents/
   ```

### Usage

Once linked, select Craneium via the `/agent` slash command inside the Copilot CLI. It will appear as **craneium** in the agent list.

---

## How It Works

| File | Purpose |
|------|---------|
| `AGENT.md` | Source template — composes soul + skills via `mdbuild` |
| `SOUL.md` | Personality, lore, and values |
| `SKILLS.md` | Skill index pointing to `skills/*/SKILL.md` |
| `skills/` | Individual skill directories, each with a `SKILL.md` |
| `dist/craneium.agent.md` | Compiled flat agent file consumed by opencode / Copilot CLI |
| `secret/` | Sensitive info — gitignored, never committed |
