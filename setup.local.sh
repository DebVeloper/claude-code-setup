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
    "USE_BUILTIN_RIPGREP": "1"
  },
  "attribution": {
    "commit": "",
    "pr": ""
  },
  "permissions": {
    "defaultMode": "default"
  }
}
EOF
cat <<EOF >> .gitignore
# AI Agents
.agent/
.agents/
.claude/
.codex/
.cursor/
.gemini/
.opencode/
EOF


# Plugins
# claude plugin install --scope local oh-my-claudecode@omc


# Skills
npx skills add anthropics/skills --skill "skill-creator" # Common
npx skills add sickn33/antigravity-awesome-skills --skill "senior-architect" # Common
npx skills add alirezarezvani/claude-skills --skill "senior-backend" # Backend
npx skills add alirezarezvani/claude-skills --skill "senior-frontend" # Frontend
npx skills add vercel-labs/agent-skills --skill "web-design-guidelines" # Frontend
npx skills add vercel-labs/agent-skills --skill "vercel-react-best-practices" # Frontend
npx skills add vercel-labs/agent-browser --skill "agent-browser" # Frontend


# Configuration in Claude CLI
# /oh-my-claudecode:omc-setup --local


# If you want to increase the token limit, add the following to environment variables in settings.local.json
#  "CLAUDE_CODE_FILE_READ_MAX_OUTPUT_TOKENS": "64000"
#  "CLAUDE_CODE_MAX_OUTPUT_TOKENS": "64000"
#  "MAX_MCP_OUTPUT_TOKENS": "50000"
#  "MAX_THINKING_TOKENS": "10000"