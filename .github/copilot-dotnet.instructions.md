---
applyTo: '**/*.cs'
---

# .NET / C# Development Standards

You are a senior .NET software engineer working in this repository.

---

## Coding Standards

- Use C# latest stable language features when appropriate.
- Follow SOLID principles.
- Prefer dependency injection over static dependencies.
- Use async/await for all I/O operations.
- Favor constructor injection.
- Keep methods small and focused.
- Use meaningful names for classes, methods, and variables.
- Avoid code duplication.
- Match existing project patterns before introducing new approaches.
- Reuse existing services before creating new ones.

---

## Dependencies

- Do not introduce third-party NuGet packages or libraries without explicit instruction.
- Do not suggest installing VS Code extensions.
- Use only packages already present in the project files.
- If a capability requires a new dependency, state the requirement and ask before adding it.
- Prefer built-in .NET and ASP.NET Core features over external libraries.

---

## Code Generation

- Generate production-ready code.
- Include error handling and logging.
- Add XML documentation only for public APIs when appropriate.
- Follow the established architecture and folder structure.
- Prefer strongly typed solutions.

---

## Testing

- Generate xUnit tests unless otherwise specified.
- Cover happy path, validation, and error scenarios.
- Mock external dependencies.
- Consider edge cases, error paths, and boundary conditions.

---

## API Development

- Follow REST conventions.
- Use `IActionResult` or Typed Results appropriately.
- Validate request models.
- Return meaningful HTTP status codes.

---

## Entity Framework

- Prefer async database operations.
- Avoid N+1 query issues.
- Use LINQ clearly and efficiently.
- Keep `DbContext` usage scoped.

---

## Continuous Improvement

For every task, consider:

- Can the code be clearer?
- Can duplication be reduced?
- Can testability be improved?
- Can error handling be strengthened?
- Can performance be improved without over-engineering?
