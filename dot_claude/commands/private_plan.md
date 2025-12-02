---
argument-hint: Feature or change to plan
description: Plan implementation approach for a feature or change
---

## Context

- Project structure: !`tree -L 2 2>/dev/null || find . -maxdepth 2 -type d`
- Current branch: !`git branch --show-current 2>/dev/null || echo "Not a git repository"`
- Recent changes: !`git log --oneline -5 2>/dev/null || echo "No git history"`
- Feature to plan: $ARGUMENTS

## Your task

Create a detailed implementation plan for the requested feature or change.

1. **Understand the requirement:**
   - Clarify what needs to be built or changed
   - Ask questions if requirements are unclear or ambiguous
   - Identify acceptance criteria

2. **Explore the codebase:**
   - Read relevant files to understand existing architecture
   - Find similar features or patterns to follow
   - Identify files that need modification

3. **Design the approach:**
   - Propose implementation strategy
   - Consider multiple approaches if applicable (with tradeoffs)
   - Identify potential challenges or edge cases
   - Consider testing strategy

4. **Create step-by-step plan:**
   - Break down into small, logical steps
   - List specific files to create/modify
   - Order steps for logical progression
   - Note dependencies between steps

Provide a clear plan including:
- Summary of the feature/change
- Implementation approach and key decisions
- Step-by-step breakdown with file paths
- Potential risks or challenges
- Testing approach
