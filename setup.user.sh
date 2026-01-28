#!/bin/bash


# Environments
export DISABLE_TELEMETRY=1
export SKILLS_NO_TELEMETRY=1


# Prerequisites
npm install -g agent-browser
agent-browser install


# Settings
cat <<EOF > ~/.claude/settings.json
{
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
    "defaultMode": "plan"
  }
}
EOF


# Marketplaces
claude plugin marketplace add anthropics/claude-plugins-official
claude plugin marketplace update claude-plugins-official
claude plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode
claude plugin marketplace update omc
claude plugin marketplace add wshobson/agents
claude plugin marketplace update claude-code-workflows


# Essentials
claude plugin install --scope user superpowers@claude-plugins-official # Command: '/superpowers:brainstrom', '/superpowers:write-plan'
claude plugin install --scope user oh-my-claudecode@omc # Keyword: 'ralplan ulw:', 'ralph ultrapilot:', 'ralph ultraqa:'
claude plugin install --scope user context7@claude-plugins-official # MCP: 'context7'
npx skills add https://github.com/vercel-labs/skills --skill find-skills -g --agent claude-code -y # Skill: '/find-skills'
npx skills add https://github.com/softaworks/agent-toolkit --skill session-handoff -g --agent claude-code -y # Skill: '/session-handoff'
npx skills add https://github.com/softaworks/agent-toolkit --skill mermaid-diagrams -g --agent claude-code -y # Skill: '/mermaid-diagrams'
claude plugin install --scope user comprehensive-review@claude-code-workflows # Command: '/comprehensive-review:full-review'
npx skills add https://github.com/sickn33/antigravity-awesome-skills --skill clean-code -g --agent claude-code -y # Skill: '/clean-code'


# Configuration in Claude CLI
#   /oh-my-claudecode:omc-setup global
#   /oh-my-claudecode:hud focused


# Alias
#   alias cl="claude"
#   alias cld="claude --allow-dangerously-skip-permissions"
#   alias cldd="claude --dangerously-skip-permissions"
#   alias get-cl-setup="curl -fsSL https://raw.githubusercontent.com/DebVeloper/claude-code-setup/refs/heads/main/setup.local.sh -o cl-setup.sh"