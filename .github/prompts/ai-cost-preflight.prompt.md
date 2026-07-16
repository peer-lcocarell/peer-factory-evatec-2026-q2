---
mode: ask
description: "Reusable pre-execution AI cost preflight for model recommendation, token and credit estimate, and cost reduction guidance."
Yes — **this prompt file runs only when you explicitly invoke it**.

- It does **not** auto-run in the background by itself.

- It runs when you select/use ai-cost-preflight.prompt.md in Copilot Chat (or pass it as the active prompt).

- The `#approve-first` line is just text guidance; enforcement depends on the prompt being used.

- If you want this behavior on every request, put equivalent rules in copilot-instructions.md (global instructions), not only in a prompt file.
argument-hint: "Optional: paste task details or scope to estimate"
---

# AI Cost Preflight

Before executing any task, provide a short preflight report.

## Required Output

- Recommend the best model:
  - Local / VS Code
  - Auto
  - Mid-tier
  - Reasoning

- Include preferred model ranking:
  - Local / VS Code
  - MAI-Code-1 Flash
  - GPT-5.3-Codex
  - Claude Sonnet 5
  - Claude Opus 4.6

- Estimate:
  - Tokens (Input / Output / Total)
  - Files likely searched
  - Files likely opened
  - Credits consumed

- Classify AI credit impact:
  - Very Low (<10)
  - Low (10-100)
  - Medium (100-1000)
  - High (1000+)

- Suggest at least 3 cost reductions that can lower usage by 30 percent or more.

- If estimated credits exceed 100:
  - Show the estimate first
  - Do not execute yet
  - Ask for explicit approval to continue

## Response Style

- Be concise.
- Use bullet points.
- No unnecessary explanations.

Before doing any work:

1. Produce a plan.
2. Produce a cost estimate.
3. Produce a file impact estimate.
4. Produce a credit estimate.

Then stop.

Wait for:

APPROVE

Do not perform any actions until approval is received.
#approve-first

Plan:
...

Estimated Files Opened:
...

Estimated Credits:
...

Awaiting APPROVE.


## Task

${input:Task details}
