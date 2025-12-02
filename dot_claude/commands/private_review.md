---
argument-hint: Files or scope to review (optional)
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git diff:*)
description: Review code changes before committing
---

## Context

- Current git status: !`git status`
- Staged changes: !`git diff --cached`
- Unstaged changes: !`git diff`
- Files to review: $ARGUMENTS

## Your task

Review the code changes thoroughly:

1. **Read the modified files** to understand the full context
2. **Check for common issues:**
   - Bugs or logic errors
   - Security vulnerabilities (SQL injection, XSS, hardcoded secrets, etc.)
   - Performance issues
   - Error handling gaps
   - Edge cases not handled
3. **Code quality:**
   - Consistency with existing codebase patterns
   - Clear and maintainable code
   - Appropriate naming and comments
   - Unnecessary complexity
4. **Run linters/formatters** if available (eslint, prettier, pylint, rustfmt, etc.)

If $ARGUMENTS specifies specific files or scope, focus the review on those areas.

Provide constructive feedback with:
- Issues found (severity: critical/important/minor)
- Suggested improvements with code examples
- Positive observations about good practices
- Whether the changes are ready to commit
