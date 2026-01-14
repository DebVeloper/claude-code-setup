#!/bin/bash

source .env


# Packages

brew install ripgrep fd jq


# Claude Code Statusline

npx ccstatusline@latest
mkdir -p ~/.config/ccstatusline
cp settings/ccstatusline/settings.json ~/.config/ccstatusline/settings.json


# Claude Code Marketplaces

claude plugin marketplace add wshobson/agents
claude plugin marketplace update claude-code-workflows
claude plugin marketplace update claude-plugins-official


# Claude Code Plugins

## For user : `claude plugin install --scope user <plugin-name>@<marketplace>`
claude plugin install --scope user commit-commands@claude-plugins-official
claude plugin install --scope user ralph-loop@claude-plugins-official
claude plugin install --scope user context-management@claude-code-workflows
claude plugin install --scope user agent-orchestration@claude-code-workflows
claude plugin install --scope user comprehensive-review@claude-code-workflows
claude plugin install --scope user tdd-workflows@claude-code-workflows
claude plugin install --scope user python-development@claude-code-workflows
claude plugin install --scope user javascript-typescript@claude-code-workflows
claude plugin install --scope user jvm-languages@claude-code-workflows

## For project : `claude plugin install --scope project <plugin-name>@<marketplace>`

## For local : `claude plugin install --scope local <plugin-name>@<marketplace>`

### Development & Documentation
claude plugin install --scope local backend-development@claude-code-workflows
claude plugin install --scope local frontend-mobile-development@claude-code-workflows
claude plugin install --scope local code-refactoring@claude-code-workflows
claude plugin install --scope local code-documentation@claude-code-workflows
claude plugin install --scope local c4-architecture@claude-code-workflows

### Workflow
claude plugin install --scope local full-stack-orchestration@claude-code-workflows

### Modernization
claude plugin install --scope local framework-migration@claude-code-workflows
claude plugin install --scope local codebase-cleanup@claude-code-workflows


# Claude Code MCPs

## For user : `claude mcp add --scope user --transport <transport-type> <mcp-name> <mcp-command-or-url> ...`
claude mcp add --scope user context7 -- npx -y @upstash/context7-mcp --api-key ${CONTEXT7_API_KEY}

## For project : `claude mcp add --scope project --transport <transport-type> <mcp-name> <mcp-command-or-url> ...`

## For local : `claude mcp add --scope local --transport <transport-type> <mcp-name> <mcp-command-or-url> ...`