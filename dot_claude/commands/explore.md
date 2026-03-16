---
argument-hint: Focus area (optional)
description: Explore project structure and codebase
---

## Context

- Directory structure: !`tree -L 2 2>/dev/null`
- Current branch: !`git branch --show-current 2>/dev/null || echo "Not a git repository"`
- Recent commits: !`git log --oneline -10 2>/dev/null || echo "No git history"`
- Recent changes: !`git diff --stat 2>/dev/null || echo "No changes"`
- Recently modified files: !`git log --name-only --oneline -5 2>/dev/null || echo "No git history"`
- Focus area: $ARGUMENTS

## Your task

Give a high-level overview of this project based on its structure, history, and purpose. Keep exploration shallow — do NOT deep dive into implementation details or read through source code extensively.

Skim these surface-level files to build a rough picture:
- README files (README.md, README.txt, etc.)
- Package/dependency files (package.json, requirements.txt, Cargo.toml, go.mod, pom.xml, build.gradle, etc.)
- Documentation (docs/, CONTRIBUTING.md, ARCHITECTURE.md, etc.)
- Filenames and maybe routing/glue files for an overview

Do NOT read source code, test files, configuration files, or entry points unless they are directly relevant to a specified focus area.

If a focus area was specified in $ARGUMENTS, point to the most relevant files and directories for that area rather than reading through them in detail.

Provide a brief overview of the project including its purpose, tech stack, and structure. When applicable, mention where in the codebase the user should look for more context on specific topics.
