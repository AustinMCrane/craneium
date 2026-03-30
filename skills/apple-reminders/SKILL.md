# Apple Reminders via `remindctl`

Use this skill when the user wants to manage **Apple Reminders** from the terminal, especially as part of their personal task/deep-work system.

## When to Use

- User mentions tasks, reminders, todos, or their daily task system
- Tasks that should appear and sync across iPhone/iPad/Mac Reminders app
- Marking reminders complete, adding, editing, or deleting them

## When NOT to Use

- For Apple Notes, use the **apple-notes** / `memo notes` skill instead.
- For calendar events, use Apple Calendar / `gog calendar`.

## Key Principle: Always Use `--no-input --json`

`remindctl` supports non-interactive automation. **Always** pass `--no-input` and `--json` so the agent can run commands without human interaction and parse structured output.

## Available Lists

Always run `remindctl list --json` first if unsure which lists exist. Current lists:

- **Today** -- 3-7 tasks actually intended for today (set `--due today`)
- **This Week** -- important, not necessarily today
- **Deep Work** -- focus blocks (coding, writing, thinking)
- **Someday** -- ideas / non-urgent
- **Reminders** -- default Apple list (avoid using; prefer named lists above)

## Commands

### Show all due/incomplete reminders
```bash
remindctl show --json
```

### List all reminder lists
```bash
remindctl list --json
```

### Show contents of a specific list
```bash
remindctl list "Today" --json
```

### Add a reminder
```bash
remindctl add "Task title" --list Today --due today --no-input --json
remindctl add "Weekly review" --list "This Week" --no-input --json
remindctl add "Explore new framework" --list Someday --no-input --json
```

Options: `--list <name>`, `--due <date>`, `--notes <text>`, `--priority none|low|medium|high`

### Complete a reminder
```bash
remindctl complete --no-input --json
```

### Edit a reminder
```bash
remindctl edit --no-input --json
```

### Delete a reminder
```bash
remindctl delete --no-input --json
```

### Check authorization
```bash
remindctl status
```

## Deep Work / Task System

We use Apple Reminders as a task manager:

1. **Today** -- the short list of what gets done today. Keep it to 3-7 items.
2. **Deep Work** -- extended focus blocks (coding, writing, thinking). Pull from here into Today.
3. **This Week** -- important but not necessarily today.
4. **Someday** -- ideas, non-urgent explorations.

Workflow:
- When user says "add to today" -> `--list Today --due today`
- When user says "someday" or "maybe" -> `--list Someday` (no due date)
- When user says "this week" -> `--list "This Week"`
- When user says "deep work" or "focus" -> `--list "Deep Work"`
- Default to **Today** if user doesn't specify a list and the task is actionable.

## Gotchas

- First use requires granting Terminal/app access to Reminders under **System Settings > Privacy & Security > Automation**.
- Always check `remindctl list --json` before assuming a list name exists.
- Use `--no-input` to prevent interactive prompts that block the agent.
