---
name: acquire-codebase-knowledge
description: 'Use this skill when the user explicitly asks to map, document, or onboard into an existing codebase. Trigger for prompts like "map this codebase", "document this architecture", "onboard me to this repo", or "create codebase docs". Do not trigger for routine feature implementation, bug fixes, or narrow code edits unless the user asks for repository-level discovery.'
license: MIT
compatibility: 'Cross-platform. Requires Python 3.8+ and git. Run scripts/scan.py from the target project root.'
metadata:
  version: "1.3"
  enhancements:
    - Multi-language manifest detection (25+ languages supported)
    - CI/CD pipeline detection (10+ platforms)
    - Container and orchestration detection
    - Code metrics by language
    - Security and compliance config detection
    - Performance testing markers
argument-hint: 'Optional: specific area to focus on, e.g. "architecture only", "testing and concerns"'
---

<!-- #
 * Copyright(C) The PEER Group Inc., 2026.
 * This software contains confidential and trade secret information
 * belonging to The PEER Group Inc. All Rights Reserved.
 * No part of this software may be reproduced or transmitted in any form
 * or by any means, electronic, mechanical, photocopying, recording or
 * otherwise, without the prior written consent of The PEER Group Inc.
# -->

# Acquire Codebase Knowledge

Produces seven populated documents in `docs/codebase/` covering everything needed to work effectively on the project. Only document what is verifiable from files or terminal output and never infer or assume.

## Output Contract (Required)

Before finishing, all of the following must be true:

1. Exactly these files exist in `docs/codebase/`: `STACK.md`, `STRUCTURE.md`, `ARCHITECTURE.md`, `CONVENTIONS.md`, `INTEGRATIONS.md`, `TESTING.md`, `CONCERNS.md`.
2. Every claim is traceable to source files, config, or terminal output.
3. Unknowns are marked as `[TODO]`; intent-dependent decisions are marked `[ASK USER]`.
4. Every document includes a short evidence list with concrete file paths.
5. Final response includes numbered `[ASK USER]` questions and intent-vs-reality divergences.

## Workflow

Copy and track this checklist:

```text
- [ ] Phase 1: Run scan, read intent documents
- [ ] Phase 2: Investigate each documentation area
- [ ] Phase 3: Populate all seven docs in docs/codebase/
- [ ] Phase 4: Validate docs, present findings, resolve all [ASK USER] items
```

## Focus Area Mode

If the user supplies a focus area (for example: architecture only or testing and concerns):

1. Always run Phase 1 in full.
2. Fully complete focus-area documents first.
3. For non-focus documents not yet analyzed, keep required sections present and mark unknowns as `[TODO]`.
4. Still run the Phase 4 validation loop on all seven documents before final output.

## Phase 1: Scan and Read Intent

1. Run the scan script from the target project root:

```bash
python3 "$SKILL_ROOT/scripts/scan.py" --output docs/codebase/.codebase-scan.txt
```

Where `$SKILL_ROOT` is the absolute path to the skill folder.

Quick start if you have the path inline:

```bash
python3 /absolute/path/to/skills/acquire-codebase-knowledge/scripts/scan.py --output docs/codebase/.codebase-scan.txt
```

2. Search for `PRD`, `TRD`, `README`, `ROADMAP`, `SPEC`, and `DESIGN` files and read them.
3. Summarize the stated project intent before reading source code.

## Phase 2: Investigate

Use the scan output to answer questions for each of the seven templates.

- Load `references/inquiry-checkpoints.md` for full per-template questions.
- If stack detection is ambiguous, load `references/stack-detection.md`.

## Phase 3: Populate Templates

Copy each template from `assets/templates/` into `docs/codebase/` and fill in this order:

1. `STACK.md` - language, runtime, frameworks, all dependencies
2. `STRUCTURE.md` - directory layout, entry points, key files
3. `ARCHITECTURE.md` - layers, patterns, data flow
4. `CONVENTIONS.md` - naming, formatting, error handling, imports
5. `INTEGRATIONS.md` - external APIs, databases, auth, monitoring
6. `TESTING.md` - frameworks, file organization, mocking strategy
7. `CONCERNS.md` - tech debt, bugs, security risks, perf bottlenecks

Use `[TODO]` for anything not determinable from code. Use `[ASK USER]` where team intent is required.

## Phase 4: Validate, Repair, Verify

Run this validation loop before final output:

1. Validate each doc against `references/inquiry-checkpoints.md`.
2. For each non-trivial claim, confirm at least one evidence reference exists.
3. If any required section is missing or unsupported:
   - Fix the document.
   - Re-run validation.
4. Repeat until all seven docs pass.

Then present:

- Summary of all seven documents
- Every `[ASK USER]` item as a numbered question
- Intent-vs-reality divergences from Phase 1

Validation pass criteria:

- No unsupported claims
- No empty required sections
- Unknowns use `[TODO]` instead of assumptions
- Team-intent gaps are explicitly marked `[ASK USER]`

## Gotchas

- Monorepos: root manifests may not represent all workspaces. Map packages/apps separately.
- Outdated README: treat as intent only until cross-checked with real files.
- TypeScript aliases: resolve `tsconfig.json` `paths` before mapping structure.
- Generated output: do not document patterns from `dist/`, `build/`, `generated/`, `.next/`, `out/`, `__pycache__/`.
- Environment templates: read `.env.example`, `.env.template`, `.env.sample` for required config.
- Dependency scopes: separate runtime deps from dev tooling.
- Test TODOs: treat as coverage gaps, not production debt.
- High-churn files: call out fragile areas using recent git history.

## Anti-Patterns

| Do not | Do instead |
|---|---|
| Claim architectural patterns without evidence | State only what directory and code structure confirms |
| Claim framework without manifest validation | Check dependencies first |
| Guess database from variable names | Verify via manifests and config |
| Treat build output as source conventions | Document source conventions only |

## Enhanced Scan Output Sections

The scan output includes:

- Code metrics
- CI/CD pipelines
- Containers and orchestration
- Security and compliance
- Performance and testing markers

Use these sections during investigation to identify stack-specific patterns and gaps.

## Bundled Assets

| Asset | When to load |
|---|---|
| `scripts/scan.py` | Phase 1, first step |
| `references/inquiry-checkpoints.md` | Phase 2 |
| `references/stack-detection.md` | Phase 2 when stack is ambiguous |
| `assets/templates/STACK.md` | Phase 3 step 1 |
| `assets/templates/STRUCTURE.md` | Phase 3 step 2 |
| `assets/templates/ARCHITECTURE.md` | Phase 3 step 3 |
| `assets/templates/CONVENTIONS.md` | Phase 3 step 4 |
| `assets/templates/INTEGRATIONS.md` | Phase 3 step 5 |
| `assets/templates/TESTING.md` | Phase 3 step 6 |
| `assets/templates/CONCERNS.md` | Phase 3 step 7 |

Template usage mode:

- Default mode: complete only core required sections.
- Extended mode: add optional sections only when repository complexity justifies them.