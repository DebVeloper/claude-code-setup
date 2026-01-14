# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a Claude Code configuration and setup toolkit. It provides setup scripts, plugin configurations, and MCP integrations to enhance the Claude Code development environment.

## Setup

1. Copy `.env.example` to `.env` and add your `CONTEXT7_API_KEY`
2. Run the setup script:
   ```bash
   ./setup.sh
   ```

This installs:
- System tools: ripgrep, fd, jq (via Homebrew)
- ccstatusline for status bar integration
- Claude Code plugins and MCPs

## Plugin Scopes

Install plugins with different scopes:
```bash
# User scope (available in all projects)
claude plugin install --scope user <plugin-name>@<marketplace>

# Project scope (committed to repo)
claude plugin install --scope project <plugin-name>@<marketplace>

# Local scope (machine-specific)
claude plugin install --scope local <plugin-name>@<marketplace>
```

## MCP Configuration

Add MCPs with:
```bash
claude mcp add --scope user <mcp-name> -- <command>
```

## Development Guidance

- Use `context-management` plugin for repository context management
- Use `context7` MCP for library/API documentation without explicit requests
- Follow TDD workflow (red/green/refactor) using `tdd-workflows` plugin
- Prefer `rg` over `grep` for searching
