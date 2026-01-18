---
argument-hint: Feature to implement
description: Design code top-down using wishful thinking
---

## Context

- Project structure: !`find . -type f -name "*.go" -o -name "go.mod" -o -name "Makefile" | head -20 2>/dev/null || echo "Scanning project..."`
- Current branch: !`git branch --show-current 2>/dev/null || echo "Not a git repository"`
- Recent changes: !`git diff --stat 2>/dev/null || echo "No changes"`
- Existing packages: !`go list ./... 2>/dev/null || find . -type d -name "internal" -o -name "pkg" -o -name "cmd" 2>/dev/null | head -10`
- Feature to implement: $ARGUMENTS

## Your task

Implement the requested feature using **wishful thinking** (top-down design):

### Design Phase

1. **Write code as if perfect helpers already exist**
   - Call functions that don't exist yet
   - Import packages that aren't written
   - Design the ideal API for clarity and maintainability

2. **Express business logic clearly**
   - Number logical steps (// 1., // 2., etc.)
   - Use descriptive names that reveal intent
   - Add comments explaining what each section accomplishes
   - Handle errors at each step (even for non-existent functions)

3. **Think about architecture**
   - Separation of concerns
   - Clean boundaries between components
   - Consistent patterns with existing codebase

### DO:
- Focus on clarity at the current abstraction level
- Design interfaces before implementation
- Consider the complete execution flow
- Match existing project conventions and style

### DON'T:
- Implement everything inline
- Get bogged down in low-level details initially
- Skip error handling
- Create overly complex abstractions

## Output Format

Provide the skeleton code, then:

1. **Execution flow summary** - What the code does at a high level
2. **Components needed** - Organized list of packages/functions/types to build
3. **Key design decisions** - Why the API is structured this way
4. **Implementation roadmap** - Suggested order for building components (what depends on what)

## Example Structure

```go
func ProcessUserData(userID string) error {
    // 1. Fetch and validate user
    user, err := users.FetchByID(userID)
    if err != nil {
        return fmt.Errorf("failed to fetch user: %w", err)
    }

    // 2. Process user data
    processed := processor.Transform(user, processor.WithValidation())

    // 3. Store results
    return storage.SaveProcessed(processed)
}
```

**Remember**: Design the ideal API first, then work backward to implement it. The skeleton becomes your implementation roadmap.
