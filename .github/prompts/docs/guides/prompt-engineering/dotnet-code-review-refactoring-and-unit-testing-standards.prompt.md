---
mode: ask
description: "Prompt for dotnet-code-review-refactoring-and-unit-testing-standards."
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# .NET Code Review, Refactoring, and Unit Testing Standards

## Objective

Review, refactor, and improve .NET code while preserving existing behavior.

Goals:

- Follow modern .NET conventions
- Improve readability and maintainability
- Reduce unnecessary complexity
- Improve test coverage
- Align with Microsoft, xUnit, and FluentAssertions best practices
- Preserve existing functionality unless explicitly instructed otherwise

---

## Refactoring Requirements

When performing a refactor:

1. Move functionality to the class where it logically belongs.
2. Preserve existing behavior.
3. Do not introduce functional changes unless explicitly requested.
4. Eliminate duplicate implementations after migration.
5. Maintain backward compatibility where applicable.
6. Add or update unit tests to validate refactored behavior.
7. Verify all existing tests continue to pass.

For each refactor:

- Identify the current implementation.
- Identify the target location.
- Explain why the change improves design.
- Describe any potential risks.
- Ensure logic remains functionally equivalent.

---

## General Review Guidelines

Evaluate:

- Readability
- Maintainability
- Testability
- Naming conventions
- SOLID principles
- Separation of concerns
- Dependency injection opportunities
- Exception handling
- Performance
- Architectural consistency
- Directory and file organization

For each recommendation provide:

- Current implementation
- Recommended implementation
- Reason
- Expected benefit
- Risk level

Classification:

- Safe Refactor
- Requires Validation
- Leave As-Is

---

## .NET Coding Standards

### Use Clear Naming

Prefer:

```csharp
var customer = GetCustomer();
var validationResult = ValidateCustomer(customer);
```

Avoid:

```csharp
var x = GetCustomer();
var temp = ValidateCustomer(x);
```

---

### Use var When Type Is Obvious

Prefer:

```csharp
var customer = new Customer();
var users = new List<User>();
```

Avoid:

```csharp
Customer customer = new Customer();
List<User> users = new List<User>();
```

Unless the type is not obvious.

---

### Keep Methods Focused

Methods should:

- Have one responsibility
- Be easy to understand
- Avoid excessive branching
- Avoid excessive nesting

Look for extraction opportunities when methods become difficult to follow.

---

### Remove Dead Code

Identify:

- Unused methods
- Unused classes
- Unused variables
- Unused dependencies
- Commented-out code

Recommend removal when safe.

---

## Delegate and Lambda Review

### Prefer Method Groups

Refactor:

```csharp
return () => SomeMethod();
```

To:

```csharp
return SomeMethod;
```

---

Refactor:

```csharp
Task.Run(() => ProcessData());
```

To:

```csharp
Task.Run(ProcessData);
```

---

Refactor:

```csharp
button.Click += (s, e) => OnClick();
```

To:

```csharp
button.Click += OnClick;
```

---

### Keep Required Closures

Leave these unchanged:

```csharp
return () => action(subject);
```

because variables are being captured.

Only remove lambdas when behavior remains identical.

---

## Unit Test Standards

### All New or Refactored Code Must Have Unit Tests

Every new method or refactored method should have accompanying tests.

Tests should verify:

- Expected results
- Edge cases
- Error conditions
- Boundary conditions
- Exception handling

---

### Use Arrange Act Assert

All tests should follow:

```csharp
[Fact]
public void MethodName_State_ExpectedResult()
{
    // Arrange

    // Act

    // Assert
}
```

Example:

```csharp
[Fact]
public void CalculatePriority_HighSeverity_ReturnsCriticalPriority()
{
    // Arrange
    var sut = new TicketService();

    // Act
    var result = sut.CalculatePriority("Critical");

    // Assert
    result.Should().Be(Priority.Critical);
}
```

---

### Use SUT (System Under Test)

Prefer:

```csharp
var sut = new TicketService();
```

instead of:

```csharp
var service = new TicketService();
```

for clarity in tests.

---

## Unit Test Naming Convention

Use:

```text
[MethodBeingTested]_[StateBeingTested]_[ExpectedBehavior]
```

Examples:

```csharp
CalculatePriority_HighSeverity_ReturnsCriticalPriority()

CalculatePriority_InvalidSeverity_ThrowsArgumentException()

BuildTicket_MissingOrganizationId_ThrowsArgumentException()

CreateNotification_ValidRequest_NotificationCreated()

SendEmail_SmtpFailure_LogsError()
```

Test names should clearly communicate:

- What method is being tested
- Under what condition
- What outcome is expected

---

### Avoid Generic Test Names

Avoid:

```csharp
TestMethod()

CheckValues()

MyTest()

ValidationTest()
```

Prefer explicit intent.

---

## Exception Test Standards

### Preferred xUnit Style

Use local functions.

```csharp
[Fact]
public void BuildTicket_MissingContractId_ThrowsArgumentException()
{
    // Arrange
    var sut = new TicketBuilder();

    void Act()
    {
        sut.BuildTicket("");
    }

    // Assert
    Assert.Throws<ArgumentException>(Act);
}
```

---

### Preferred FluentAssertions Style

```csharp
[Fact]
public void BuildTicket_MissingContractId_ThrowsArgumentException()
{
    // Arrange
    var sut = new TicketBuilder();

    void Act()
    {
        sut.BuildTicket("");
    }

    // Assert
    FluentActions.Invoking(Act)
        .Should()
        .Throw<ArgumentException>();
}
```

---

### Avoid Temporary Delegate Variables

Avoid:

```csharp
var act = () =>
{
    sut.BuildTicket("");
};

act.Should().Throw<ArgumentException>();
```

Reason:

- Less readable
- Adds unnecessary delegate variables
- Method groups and local functions are more idiomatic .NET

---

## FluentAssertions Standards

Prefer expressive assertions.

```csharp
result.Should().Be(expectedValue);

collection.Should().Contain(item);

response.Should().NotBeNull();
```

---

Collections:

```csharp
users.Should().HaveCount(5);

users.Should().ContainSingle();

users.Should().Contain(x => x.Id == 123);
```

---

Exceptions:

```csharp
FluentActions.Invoking(Act)
    .Should()
    .Throw<ArgumentException>();
```

---

## xUnit Guidelines

### Fact

Use:

```csharp
[Fact]
```

for a single scenario.

---

### Theory

Use:

```csharp
[Theory]
[InlineData(...)]
```

for multiple input combinations.

Example:

```csharp
[Theory]
[InlineData(1, 1, 2)]
[InlineData(2, 2, 4)]
public void Add_ValidNumbers_ReturnsExpectedSum(
    int a,
    int b,
    int expected)
{
    // Arrange
    var sut = new Calculator();

    // Act
    var result = sut.Add(a, b);

    // Assert
    result.Should().Be(expected);
}
```

---

## Directory and Project Structure Review

Review:

- Folder organization
- File organization
- Naming consistency
- Project boundaries
- Test project organization

Identify:

- Duplicate folders
- Misplaced files
- Unnecessary nesting
- Separation of concerns violations

Recommend improvements when appropriate.

---

## Code Review Checklist

### Naming

- Classes use meaningful names
- Methods use meaningful names
- Variables use meaningful names
- Avoid unnecessary abbreviations

### Readability

- Methods are short and focused
- Logic is easy to follow
- Formatting is consistent

### Maintainability

- No duplicate code
- No dead code
- Minimal complexity

### Architecture

- Follows SOLID principles
- Appropriate separation of concerns
- Proper dependency management

### Testing

- New code includes tests
- Refactored code includes tests
- Arrange/Act/Assert pattern is used
- Test names follow conventions
- Tests verify behavior

### Delegates

- Prefer method groups
- Prefer local Act() functions
- Keep required closures when necessary

---

## Refactoring Priorities

### High Priority

- Functional defects
- Dead code
- Duplicate code
- Tight coupling
- Missing test coverage

### Medium Priority

- Naming improvements
- Method extraction
- Readability improvements
- Delegate simplification

### Low Priority

- Formatting issues
- Minor stylistic inconsistencies

---

## Pull Request Standards

Each Pull Request should include:

- Summary of changes
- Refactoring details
- Test coverage details
- Validation performed
- Risks and considerations

Keep Pull Requests focused on a single logical change whenever possible.

---

## Expected Review Output Format

For each finding provide:

### Finding

Description of issue.

### Current Code

Current implementation.

### Recommended Code

Improved implementation.

### Reason

Why the change improves the code.

### Classification

- Safe Refactor
- Requires Validation
- Leave As-Is

### Priority

- High
- Medium
- Low

Always preserve existing behavior unless explicitly instructed otherwise.

## Goal

- Define the primary objective clearly.

## Input

- [SOURCE_TEXT]
- [TARGET_FILE]
- [CONTEXT]

## Constraints

- Be explicit and deterministic.
- Do not assume missing facts.

## Expected Output

- Format: bullet list
- Include actionable results
