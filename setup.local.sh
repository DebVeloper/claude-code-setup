#!/bin/bash


# Environments
export DISABLE_TELEMETRY=1
export SKILLS_NO_TELEMETRY=1


# Settings
mkdir -p './.claude/'

cat <<EOF > ./.claude/settings.local.json
{
  "env": {
    "DISABLE_TELEMETRY": "1",
    "DISABLE_COST_WARNINGS": "1",
    "CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR": "1",
    "USE_BUILTIN_RIPGREP": "1",
    "CLAUDE_CODE_TASK_LIST_ID": "my-project claude"
  },
  "attribution": {
    "commit": "",
    "pr": ""
  },
  "permissions": {
    "allow": [
      "Skill(superpowers)",
      "Skill(superpowers:*)",
      "Skill(session-handoff)",
      "Skill(session-handoff:*)",
      "Bash(pnpm:*)",
      "Bash(npm:*)",
      "Bash(yarn:*)",
      "Bash(node:*)",
      "Bash(git:*)",
      "Bash(docker:*)",
      "Bash(uv sync:*)",
      "Bash(uv run python:*)",
      "Bash(uv run pytest:*)",
      "Bash(uv run ruff:*)",
      "Bash(python:*)",
      "Bash(pip:*)",
      "Read(**/*.json)",
      "Read(**/*.js)",
      "Read(**/*.ts)",
      "Read(**/*.py)",
      "Edit(**/*.js)",
      "Edit(**/*.ts)",
      "Edit(**/*.py)",
      "Edit(**/*.json)",
      "Write(**/*.js)",
      "Write(**/*.ts)",
      "Write(**/*.py)"
    ],
    "deny": [
      "Read(./.env*)",
      "Read(./secrets/**)",
      "Bash(rm -rf:*)",
      "Bash(sudo:*)"
    ],
    "defaultMode": "default"
  }
}
EOF

cat <<EOF >> ./.gitignore
# AI Agents
.agent/
.agents/
.claude/
.codex/
.cursor/
.gemini/
.opencode/
.windsurf/
.omc/
EOF

cat <<EOF >> ./CLAUDE.md
# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Mandatory

- Always check and invoke **using-superpowers** skill from `superpowers@claude-plugins-official` before starting any task. If there's even a 1% chance a skill applies, invoke it first.
EOF


# Plugins
# claude plugin install --scope local oh-my-claudecode@omc


# Skills
npx skills add https://github.com/softaworks/agent-toolkit --skill session-handoff
npx skills add https://github.com/softaworks/agent-toolkit --skill mermaid-diagrams
# npx skills add https://github.com/softaworks/agent-toolkit --skill gemini
# npx skills add https://github.com/softaworks/agent-toolkit --skill codex

npx skills add https://github.com/wshobson/agents --skill fastapi-templates
npx skills add https://github.com/supabase/agent-skills --skill supabase-postgres-best-practices

npx skills add https://github.com/anthropics/skills --skill frontend-design
npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices
npx skills add https://github.com/vercel-labs/agent-skills --skill web-design-guidelines
npx skills add https://github.com/vercel-labs/agent-browser --skill agent-browser


# Configuration in Claude CLI
#   /oh-my-claudecode:omc-setup --local


# If you want to increase the token limit, add the following to environment variables in settings.local.json
#   "CLAUDE_CODE_FILE_READ_MAX_OUTPUT_TOKENS": "64000"
#   "CLAUDE_CODE_MAX_OUTPUT_TOKENS": "64000"
#   "MAX_MCP_OUTPUT_TOKENS": "50000"
#   "MAX_THINKING_TOKENS": "10000"