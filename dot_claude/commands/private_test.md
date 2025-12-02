---
argument-hint: Test command or scope (optional)
description: Run tests and help fix failures
---

## Context

- Project structure: !`tree -L 2 2>/dev/null || find . -maxdepth 2 -type d`
- Package files: !`ls package.json requirements.txt Cargo.toml go.mod pom.xml 2>/dev/null || echo "No package files found"`
- Test arguments: $ARGUMENTS

## Your task

Run the project tests and help resolve any failures:

1. **Detect test framework** by reading package/config files (Jest, pytest, cargo test, go test, JUnit, etc.)
2. **Run appropriate test command:**
   - Use $ARGUMENTS if provided (e.g., `/test npm test` or `/test tests/api/`)
   - Otherwise infer from project type:
     - Node.js: `npm test` or `yarn test`
     - Python: `pytest` or `python -m pytest`
     - Rust: `cargo test`
     - Go: `go test ./...`
     - Java: `mvn test` or `gradle test`
3. **Analyze failures:**
   - Read failing test files to understand intent
   - Read implementation code being tested
   - Identify root cause of failures
4. **Propose fixes:**
   - Show specific code changes needed
   - Explain why tests are failing
   - Fix implementation or update tests if requirements changed

Provide clear output showing:
- Test results summary (passed/failed counts)
- Details of any failures with root cause analysis
- Specific fixes needed with file paths and line numbers
