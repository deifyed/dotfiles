---
argument-hint: Focus area (optional)
description: Explore project structure and codebase
---

## Context

- Directory structure: !`tree -L 2 2>/dev/null || find . -maxdepth 2 -type d`
- Current branch: !`git branch --show-current 2>/dev/null || echo "Not a git repository"`
- Recent commits: !`git log --oneline -10 2>/dev/null || echo "No git history"`
- Recent changes: !`git diff --stat 2>/dev/null || echo "No changes"`
- Recently modified files: !`git log --name-only --oneline -5 2>/dev/null || echo "No git history"`
- Focus area: $ARGUMENTS

## Your task

Explore this project to understand its structure, history, and purpose.

Read key project files to understand the codebase:
- README files (README.md, README.txt, etc.)
- Package/dependency files (package.json, requirements.txt, Cargo.toml, go.mod, pom.xml, build.gradle, etc.)
- Documentation (docs/, CONTRIBUTING.md, ARCHITECTURE.md, etc.)
- Configuration files (.env.example, tsconfig.json, etc.)
- Main entry points (main.py, index.js, src/main.*, cmd/main.go, etc.)
- Test files to understand usage patterns

If a focus area was specified in $ARGUMENTS, prioritize exploring files and directories related to that area.

Provide a brief overview of the project including its purpose, tech stack, structure, and how to get started.
