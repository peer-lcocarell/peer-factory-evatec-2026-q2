<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Purpose

---
mode: ask
description: "Generate structured GitHub Copilot instruction and prompt suggestions from source guidance."
---

Generate a clean, structured recommendation document that separates long-lived Copilot custom instructions from reusable prompt-file workflows.

# Goal

Given guidance or source notes, produce a complete, scannable recommendation set that can be copied into workspace instructions and prompt libraries with minimal editing.

# Context

This prompt applies to:

- VS Code GitHub Copilot setup
- Instruction file design
- Prompt library design
- DevOps and IaC workflow enablement

The output should clearly separate durable standards from task-oriented prompts and avoid implementation noise.

## Baseline Content

Use the following baseline content when input does not override it.

### Style Snippet

```css
a {
    text-decoration: none;
    color: #464feb;
}
tr th, tr td {
    border: 1px solid #e6e6e6;
}
tr th {
    background-color: #f5f5f5;
}
```

### Custom Instruction Suggestions

- General Standards: Always prioritize security best practices.
- General Standards: Favor idempotent solutions.
- General Standards: Follow team coding standards.
- General Standards: Use consistent language and documentation style.
- General Standards: Reduce AI hallucinations by providing specific context.
- Naming Conventions: Enforce organizational naming standards.
- Naming Conventions: Use meaningful resource names.
- Naming Conventions: Apply provider-specific naming patterns.
- Naming Conventions: Use lowercase names where applicable.
- Naming Conventions: Use consistent separators such as hyphens.
- Infrastructure as Code Best Practices: Never hardcode secrets.
- Infrastructure as Code Best Practices: Store secrets in approved secret-management systems.
- Infrastructure as Code Best Practices: Prefer reusable modules and templates.
- Infrastructure as Code Best Practices: Add comments for complex configurations.
- Infrastructure as Code Best Practices: Follow organization security standards.
- Infrastructure as Code Best Practices: Favor private networking where possible.
- Infrastructure as Code Best Practices: Use loops and reusable patterns instead of duplication.
- Documentation Standards: Require README files.
- Documentation Standards: Include Usage, Inputs, Outputs, and Examples sections.
- Documentation Standards: Maintain consistent formatting.
- Documentation Standards: Follow markdown linting rules.

### Prompt File Suggestions

- Generate a Terraform Module: Ask for module name if missing.
- Generate a Terraform Module: Ask for resource type if missing.
- Generate a Terraform Module: Create `main.tf`, `variables.tf`, `outputs.tf`, and `README.md`.
- Generate a Terraform Module: Include resource placeholders, documented variables, and documented outputs.
- Generate a Terraform Module: Follow organizational design patterns.
- Terraform Security Review: Check security best practices.
- Terraform Security Review: Verify compliance with team instructions.
- Terraform Security Review: Identify configuration risks.
- Terraform Security Review: Validate inputs.
- Terraform Security Review: Suggest improvements.
- Terraform Security Review: Provide a findings summary.
- Terraform Security Review: Recommend code changes when issues are found.
- README Documentation Update: Preserve existing structure.
- README Documentation Update: Match current style and formatting.
- README Documentation Update: Add new content in the correct location.
- README Documentation Update: Validate markdown formatting.
- README Documentation Update: Improve clarity and readability.

### Recommended DevOps-Focused Prompt Templates

- Architecture Review: Check scalability, security, and maintainability.
- Architecture Review: Identify risks.
- Architecture Review: Suggest improvements.
- Architecture Review: Highlight cost optimization opportunities.
- CI/CD Pipeline Review: Identify security concerns.
- CI/CD Pipeline Review: Validate deployment flow.
- CI/CD Pipeline Review: Check rollback strategy.
- CI/CD Pipeline Review: Verify secret handling.
- CI/CD Pipeline Review: Recommend best practices.
- Runbook Generation: Include prerequisites.
- Runbook Generation: Include deployment steps.
- Runbook Generation: Include validation steps.
- Runbook Generation: Include rollback procedures.
- Runbook Generation: Include troubleshooting guidance.
- Pull Request Review: Check coding standards.
- Pull Request Review: Check security impacts.
- Pull Request Review: Check maintainability.
- Pull Request Review: Check documentation updates.
- Pull Request Review: Provide actionable feedback.

### Key Takeaway

- Use custom instructions for permanent standards, policies, naming conventions, security requirements, and coding practices.
- Use prompt files for reusable workflows such as module generation, code reviews, documentation updates, architecture reviews, and CI/CD validation.

# Input

Provide any or all of the following:

- `[TITLE]` - Document title
- `[SOURCE_LINK]` - Source article or reference URL
- `[CSS_SNIPPET]` - Optional markdown-render style snippet
- `[CUSTOM_INSTRUCTION_STANDARDS]` - Global standards and guardrails
- `[NAMING_CONVENTIONS]` - Naming rules to enforce
- `[IAC_BEST_PRACTICES]` - Terraform or IaC guidance
- `[DOCUMENTATION_STANDARDS]` - Documentation requirements
- `[PROMPT_FILE_USE_CASES]` - Reusable workflow prompts
- `[DEVOPS_TEMPLATES]` - Architecture/CI-CD/runbook/PR review templates
- `[KEY_TAKEAWAY]` - Final summary guidance

# Constraints

- Be explicit and deterministic.
- Do not assume missing facts. If required input is missing, state what is absent and request it.
- Use plain and professional language.
- Keep sections concise and scannable.
- Use consistent terminology.
- Separate "custom instructions" from "prompt files" clearly.
- Include CSS only when provided as input.

# Instructions

1. Map each provided input value to the corresponding output section.
2. Apply the structure below exactly.
3. Omit optional sections only when no input exists for them.
4. Replace all placeholders with concrete values.
5. If input is ambiguous or insufficient, ask a clarifying question before generating output.

## Required Structure

```md
# [TITLE]

Based on the examples and recommendations in the source, these are reusable GitHub Copilot instruction and prompt patterns.

## Reference

- Source: [SOURCE_LINK]

## Style Snippet (Optional)

~~~css
[CSS_SNIPPET]
~~~

## Custom Instruction Suggestions

Use custom instructions as global guardrails that define how Copilot should operate.

### General Standards

- ...

### Naming Conventions

- ...

### Infrastructure as Code Best Practices

- ...

### Documentation Standards

- ...

## Prompt File Suggestions

Use prompt files for repeatable tasks that define what Copilot should accomplish.

### [Use Case 1]

Purpose:

[Purpose]

Suggested Requirements:

- ...

### [Use Case 2]

Purpose:

[Purpose]

Suggested Requirements:

- ...

### [Use Case 3]

Purpose:

[Purpose]

Suggested Requirements:

- ...

## Recommended DevOps-Focused Prompt Templates

### Architecture Review

Requirements:

- ...

### CI/CD Pipeline Review

Requirements:

- ...

### Runbook Generation

Requirements:

- ...

### Pull Request Review

Requirements:

- ...

## Key Takeaway

- ...
- ...
```

# Expected Output

- A complete Markdown document following the required structure.
- All provided input values reflected accurately in the correct sections.
- Scannable, non-redundant wording with concise bullet lists.
- No placeholder labels left in final output.
- Ready for direct use in Copilot instruction and prompt design discussions.

# Acceptance Criteria

- Distinction between custom instructions and prompt files is explicit.
- Security and naming guidance are concrete and actionable.
- Prompt file suggestions include clear purpose and requirement bullets.
- DevOps-focused templates include practical review criteria.
- Output is understandable by technical and non-technical stakeholders.
