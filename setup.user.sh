#!/bin/bash


# Environments
export DISABLE_TELEMETRY=1
export SKILLS_NO_TELEMETRY=1


# Prerequisites
npm install -g agent-browser
agent-browser install


# Marketplaces
claude plugin marketplace add anthropics/claude-plugins-official
claude plugin marketplace update claude-plugins-official
claude plugin marketplace add https://github.com/Yeachan-Heo/oh-my-claudecode
claude plugin marketplace update omc
# claude plugin marketplace add wshobson/agents
# claude plugin marketplace update claude-code-workflows
# claude plugin marketplace add jarrodwatts/claude-hud
# claude plugin marketplace update claude-hud


# Plugins
claude plugin install --scope user superpowers@claude-plugins-official
claude plugin install --scope user oh-my-claudecode@omc
# claude plugin install --scope user claude-hud


# Skills
npx skills add https://github.com/vercel-labs/skills --skill find-skills -g --agent claude-code -y


# Configuration in Claude CLI
#   /oh-my-claudecode:omc-setup global
#   /oh-my-claudecode:hud focused
#   /claude-hud:setup

# Alias
#   alias cl-analytics="npx claude-code-templates@latest --analytics"
#   alias cl-health-check="npx claude-code-templates@latest --health-check"
#   alias cl="claude --permission-mode default"
#   alias cld="claude --permission-mode default --allow-dangerously-skip-permissions"
#   alias cldd="claude --dangerously-skip-permissions"
#   alias get-cl-setup="curl -fsSL https://raw.githubusercontent.com/DebVeloper/claude-code-setup/refs/heads/main/setup.local.sh -o cl-setup.sh"