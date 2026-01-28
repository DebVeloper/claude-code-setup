#!/bin/bash


# Environments
export DISABLE_TELEMETRY=1
export SKILLS_NO_TELEMETRY=1


# Settings
mkdir -p './.claude/'

cat <<EOF > ./.claude/settings.local.json
{
  "respectGitignore": false,
  "env": {
    "DISABLE_TELEMETRY": "1",
    "DISABLE_COST_WARNINGS": "1",
    "CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR": "1",
    "ENABLE_TOOL_SEARCH": "true",
    "USE_BUILTIN_RIPGREP": "1"
  },
  "attribution": {
    "commit": "",
    "pr": ""
  },
  "permissions": {
    "allow": [
      "Bash(uv:*)",
      "Bash(pip:*)",
      "Bash(python:*)",
      "Read(**/*.py)",
      "Edit(**/*.py)",
      "Write(**/*.py)",
      "Bash(pnpm:*)",
      "Bash(npm:*)",
      "Read(**/*.js)",
      "Read(**/*.ts)",
      "Edit(**/*.js)",
      "Edit(**/*.ts)",
      "Write(**/*.js)",
      "Write(**/*.ts)",
      "Bash(./gradlew clean:*)",
      "Bash(./gradlew compileJava:*)",
      "Bash(./gradlew test:*)",
      "Bash(./gradlew build:*)",
      "Read(**/*.java)",
      "Edit(**/*.java)",
      "Write(**/*.java)"
    ],
    "deny": [
      "Bash(sudo:*)",
      "Bash(rm -rf:*)"
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
.sisyphus/
EOF


# LSP
claude plugin install --scope local jdtls-lsp@claude-plugins-official
claude plugin install --scope local pyright-lsp@claude-plugins-official
claude plugin install --scope local typescript-lsp@claude-plugins-official


# Backend
claude plugin install --scope local backend-development@claude-code-workflows # Agent: 'backend-architect'
claude plugin install --scope local python-development@claude-code-workflows # Agent: 'fastapi-pro'
npx skills add https://github.com/sickn33/antigravity-awesome-skills --skill python-patterns --agent claude-code -y # Skill: '/python-patterns'
npx skills add https://github.com/supabase/agent-skills --skill supabase-postgres-best-practices --agent claude-code -y # Skill: '/supabase-postgres-best-practices'


# Frontend
claude plugin install --scope local frontend-mobile-development@claude-code-workflows # Agent: 'frontend-developer'
npx skills add https://github.com/anthropics/skills --skill frontend-design --agent claude-code -y # Skill: '/frontend-design'
npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices --agent claude-code -y # Skill: '/vercel-react-best-practices'
npx skills add https://github.com/vercel-labs/next-skills --skill next-best-practices --agent claude-code -y # Skill: '/next-best-practices'
npx skills add https://github.com/vercel-labs/agent-skills --skill web-design-guidelines --agent claude-code -y # Skill: '/web-design-guidelines'
npx skills add https://github.com/vercel-labs/agent-browser --skill agent-browser --agent claude-code -y # Skill: '/agent-browser'


# Extra
# npx skills add https://github.com/softaworks/agent-toolkit --skill gemini --agent claude-code -y
# npx skills add https://github.com/softaworks/agent-toolkit --skill codex --agent claude-code -y


# If you want to increase the token limit, add the following to environment variables in settings.local.json
#   "CLAUDE_CODE_FILE_READ_MAX_OUTPUT_TOKENS": "64000"
#   "CLAUDE_CODE_MAX_OUTPUT_TOKENS": "64000"
#   "MAX_MCP_OUTPUT_TOKENS": "50000"
#   "MAX_THINKING_TOKENS": "10000"