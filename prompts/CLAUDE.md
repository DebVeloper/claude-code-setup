# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Context Management

Use `context-management` plugin to manage context in this repository.

## MCP

Always use `context7` MCP when I need library/API documentation, code generation, setup or configuration steps without me having to explicitly ask.

## Plugin

If a proper LSP server is available, use it to get code completion, code navigation, code formatting, etc.

Before implementation a feature, first design a test case, then implement the feature, finally refactor the code to make it better.
For this TDD process, use `tdd-workflows` plugin for red/green/refactor steps.

## Command

Use `rg` instead of `grep`, `grep -r`.
Use `rg --files` instead of `ls -R`.
Use `rg pattern file` instead of `cat file | grep`.
