# QA Documentation Reorganization Report

**Repository:** `peer-factory-evatec-2026-q2`
**Scope:** `docs/qa-documents/pf-evatec-phase-2`
**Date:** 2026-07-06
**Executed by:** GitHub Copilot Agent Mode (approved by user)

Summary counters:

- File & folder moves: 95 (72 via `git mv` during first script pass + 23 parsed test plans moved in follow-up)
- Directories created: 27
- Empty directories removed: 18 + 2 follow-up (`resources/test-cases-parsed`, `resources`)
- Duplicates detected: 1 file
- Placeholder folders archived: 1
- Cross-reference link/path updates: 8 files

All moves used `git mv` when the source was git-tracked so history is preserved.
No file contents were deleted or altered except documented link/path updates.

---

## Current Structure

```
docs/qa-documents/pf-evatec-phase-2/
├── 00-project-overview/
│   ├── domain-reference.md
│   ├── project-kickoff-summary.md
│   └── project-overview.md
├── 01-requirements/
│   └── additional-scope-changes.md
├── 02-planning/
│   ├── change-request-plan.md
│   └── mini-stip-outline.md
├── 03-testing/
│   ├── estimates/
│   │   └── qa-test-estimates.csv
│   ├── test-plans/
│   │   ├── 01-mini-stp-template.md
│   │   ├── 02-pfevatec-r1-r6-5-test-plan.md
│   │   ├── 03-sttd-ww05-glp-mini-stp.md
│   │   ├── 04-evatec-factory-release-10-0-0-6-mini-stp.md
│   │   ├── 05-evatec-factory-release-10-0-0-8-mini-stp.md
│   │   ├── 06-evatec-factory-release-10-1-mini-stp.md
│   │   └── 07-evatec-factory-release-10-2-mini-stp-test-plan.md
│   ├── test-cases/                        (23 historical parsed test-plan files)
│   └── test-assets/                       (scaffolding)
├── 04-environment/
│   ├── infrastructure-and-links.md
│   ├── playwright-setup.md
│   └── qa-environment-setup.md
├── 05-operations/
│   ├── pto-operations.md
│   └── release-deployment.md
├── 06-automation/
│   ├── converters/
│   │   └── test-plan-converter.md
│   ├── scripts/                           (scaffolding)
│   └── tools/                             (scaffolding)
├── 07-references/
│   ├── ado-publishing-guide-r10.02.md
│   └── source-files/                      (scaffolding for future .xlsx originals)
├── 08-releases/
│   └── r10/
│       └── r10.2/
│           ├── change-requests/
│           │   ├── 284111/
│           │   │   ├── cr-284111.md       (filename typo fixed from cr-28411.md)
│           │   │   └── test-cases/        (requirement-36297, requirement-36298)
│           │   ├── 285729/
│           │   │   ├── cr-285729.md
│           │   │   └── test-cases/        (3 requirement folders)
│           │   ├── 286067/
│           │   │   ├── cr-286067.md
│           │   │   └── test-cases/        (31 requirement folders)
│           │   ├── 286836/
│           │   │   ├── cr-286836.md
│           │   │   └── test-cases/        (4 requirement folders)
│           │   └── 290161/
│           │       └── cr-290161.md
│           ├── release-documentation/
│           │   ├── magnet-system-notes.md
│           │   ├── r10.2-change-requests.md
│           │   └── r10.2-requirements.md
│           └── test-logs/
│               └── current-project-status.md
├── 09-templates/                          (scaffolding)
├── archive/
│   └── review-required/
│       ├── magnet-systems-kickoff-summary--from-r10.2-documentation.md
│       └── 286067--requirement-Requirement-ID--placeholder/
└── reorganization-report.md
```

---

## Changes Made

### High-level

- Introduced a purpose-based `00–09` numbered structure so folders are self-sorting and self-documenting.
- Consolidated all release content under `08-releases/r10/r10.2/` (`r10-2 → r10.2`, `crs → change-requests`, `log → test-logs`, `documentation → release-documentation`).
- Collapsed per-CR `<CR>-test-cases` folders into a single canonical `test-cases` folder inside each CR.
- Fixed the `cr-28411.md` typo to `cr-284111.md`.
- Moved the ADO Publishing Guide out of `planning/` (it is a reference, not a plan) into `07-references/`.
- Split reusable QA content (`test-plan-converter.md`) into `06-automation/converters/`.
- Retired the ambiguous `resources/` folder.
- Preserved every duplicate/placeholder in `archive/review-required/` — nothing deleted.

---

## Folder Moves

| Old | New |
|-----|-----|
| `resources/mini-software-test-plans/` | `03-testing/test-plans/` |
| `resources/test-cases-parsed/`        | `03-testing/test-cases/` |
| `planning/`                           | (retired; contents redistributed) |
| `resources/`                          | (retired) |
| `overview/`                           | (retired; was empty) |
| `r10/`                                | `08-releases/r10/` |
| `r10/r10-2/`                          | `08-releases/r10/r10.2/` |
| `r10/r10-2/crs/`                      | `08-releases/r10/r10.2/change-requests/` |
| `r10/r10-2/documentation/`            | `08-releases/r10/r10.2/release-documentation/` |
| `r10/r10-2/log/`                      | `08-releases/r10/r10.2/test-logs/` |
| `r10/r10-2/crs/<CR>/<CR>-test-cases/` | `08-releases/r10/r10.2/change-requests/<CR>/test-cases/` |

---

## File Moves

### Overview (`00-project-overview/`)

| Source | Destination |
|--------|-------------|
| `overview.md` | `00-project-overview/project-overview.md` |
| `domain-reference.md` | `00-project-overview/domain-reference.md` |
| `magnet-systems-kickoff-summary.md` | `00-project-overview/project-kickoff-summary.md` |

### Requirements (`01-requirements/`)

| Source | Destination |
|--------|-------------|
| `additional-requirements-scope-changes-identified.md` | `01-requirements/additional-scope-changes.md` |

### Planning (`02-planning/`)

| Source | Destination |
|--------|-------------|
| `CR PLAN SO FAR.md` | `02-planning/change-request-plan.md` |
| `mini-stip-outline.md` | `02-planning/mini-stip-outline.md` |

### Testing (`03-testing/`)

| Source | Destination |
|--------|-------------|
| `planning/qa-test-estimates.csv` | `03-testing/estimates/qa-test-estimates.csv` |
| `resources/mini-software-test-plans/*.md` (7 files) | `03-testing/test-plans/` |
| `resources/test-cases-parsed/*.md` (23 files) | `03-testing/test-cases/` |

### Environment (`04-environment/`)

| Source | Destination |
|--------|-------------|
| `infrastructure-and-links.md` | `04-environment/infrastructure-and-links.md` |
| `qa-environment-setup.md` | `04-environment/qa-environment-setup.md` |
| `playwright-setup.md` | `04-environment/playwright-setup.md` |

### Operations (`05-operations/`)

| Source | Destination |
|--------|-------------|
| `pto-operations.md` | `05-operations/pto-operations.md` |
| `release-deployment.md` | `05-operations/release-deployment.md` |

### Automation (`06-automation/`)

| Source | Destination |
|--------|-------------|
| `test-plan-converter.md` | `06-automation/converters/test-plan-converter.md` |

### References (`07-references/`)

| Source | Destination |
|--------|-------------|
| `planning/PF-Evatec-R10.02-ADO-Publishing-Guide.md` | `07-references/ado-publishing-guide-r10.02.md` |

### Release R10.2 (`08-releases/r10/r10.2/`)

| Source | Destination |
|--------|-------------|
| `r10/r10-2/log/current-project-status.md` | `08-releases/r10/r10.2/test-logs/current-project-status.md` |
| `r10/r10-2/documentation/magnet-system-notes.md` | `08-releases/r10/r10.2/release-documentation/magnet-system-notes.md` |
| `r10/r10-2/documentation/r102-crs.md` | `08-releases/r10/r10.2/release-documentation/r10.2-change-requests.md` |
| `r10/r10-2/documentation/r102-requirements.md` | `08-releases/r10/r10.2/release-documentation/r10.2-requirements.md` |
| `r10/r10-2/crs/284111/cr-28411.md` | `08-releases/r10/r10.2/change-requests/284111/cr-284111.md` |
| `r10/r10-2/crs/284111/28411-test-cases/*` (2 folders) | `08-releases/r10/r10.2/change-requests/284111/test-cases/*` |
| `r10/r10-2/crs/285729/cr-285729.md` | `08-releases/r10/r10.2/change-requests/285729/cr-285729.md` |
| `r10/r10-2/crs/285729/285729-test-cases/*` (3 folders) | `08-releases/r10/r10.2/change-requests/285729/test-cases/*` |
| `r10/r10-2/crs/286067/cr-286067.md` | `08-releases/r10/r10.2/change-requests/286067/cr-286067.md` |
| `r10/r10-2/crs/286067/286067-test-cases/*` (31 folders) | `08-releases/r10/r10.2/change-requests/286067/test-cases/*` |
| `r10/r10-2/crs/286836/cr-286836.md` | `08-releases/r10/r10.2/change-requests/286836/cr-286836.md` |
| `r10/r10-2/crs/286836/286836-test-cases/*` (4 folders) | `08-releases/r10/r10.2/change-requests/286836/test-cases/*` |
| `r10/r10-2/crs/290161/cr-290161.md` | `08-releases/r10/r10.2/change-requests/290161/cr-290161.md` |

---

## Renames

### Files

| Old name | New name | Reason |
|----------|----------|--------|
| `overview.md` | `project-overview.md` | Disambiguates from top-level context |
| `magnet-systems-kickoff-summary.md` | `project-kickoff-summary.md` | Broader canonical name; original preserved in archive |
| `additional-requirements-scope-changes-identified.md` | `additional-scope-changes.md` | Concise kebab-case |
| `CR PLAN SO FAR.md` | `change-request-plan.md` | kebab-case, no spaces, descriptive |
| `PF-Evatec-R10.02-ADO-Publishing-Guide.md` | `ado-publishing-guide-r10.02.md` | Lowercase kebab-case |
| `r102-crs.md` | `r10.2-change-requests.md` | Standard release token + descriptive |
| `r102-requirements.md` | `r10.2-requirements.md` | Standard release token |
| `cr-28411.md` | `cr-284111.md` | **Typo fix** (missing digit) |

### Folders

| Old name | New name |
|----------|----------|
| `r10-2` | `r10.2` |
| `crs` | `change-requests` |
| `documentation` | `release-documentation` |
| `log` | `test-logs` |
| `28411-test-cases` | `test-cases` |
| `285729-test-cases` | `test-cases` |
| `286067-test-cases` | `test-cases` |
| `286836-test-cases` | `test-cases` |
| `resources/mini-software-test-plans` | `03-testing/test-plans` |
| `resources/test-cases-parsed` | `03-testing/test-cases` |

---

## Link Updates

Only actual markdown links (`[text](path)`) and code-block example paths that reference the moved files were updated. Free-text mentions inside historical notes (e.g. inside `mini-stip-outline.md`) were left untouched to preserve historical content.

| File | Change |
|------|--------|
| `README.md` | Rewrote the Documentation Index with 15 links pointing at the new locations. |
| `scripts/ado/README.md` | Updated 2 example paths from `docs/pf-evatec-phase-2/r10/r10-2/test-cases/...` to `docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/.../test-cases/...`. |
| `scripts/ado/invoke-ado-suite-publish-from-folder.ps1` | Updated `.EXAMPLE` block path to new release/test-cases layout. |
| `scripts/ado/invoke-ado-test-case-publish-from-markdown.ps1` | Updated `.EXAMPLE` block path to new release/test-cases layout. |
| `.github/copilot-instructions.md` | Updated `Key release area` path and rewrote the full `Repository Structure` tree to match the new layout. |
| `.github/agents/pf-qa-test-case-writer-agent-profile.agent.md` | Updated the test-case write-target path. |
| `.github/prompts/code-review/qa-test-case-writer-agent-profile.prompt.md` | Updated the base pattern and folder name from `<CR>-test-cases` to `test-cases`. |
| `.github/skills/ado-markdown-generation/SKILL.md` | Updated 3 example command paths and 1 base-path pattern. |
| `docs/qa-documents/pf-evatec-phase-2/07-references/ado-publishing-guide-r10.02.md` | Updated 5 in-doc example paths plus the recommended project-structure tree diagram. |

---

## Possible Duplicates

| File(s) | Determination | Action |
|---------|---------------|--------|
| `magnet-systems-kickoff-summary.md` at repo top level AND under `r10/r10-2/documentation/` | Content is identical | Top-level copy promoted to `00-project-overview/project-kickoff-summary.md`. Nested copy archived to `archive/review-required/magnet-systems-kickoff-summary--from-r10.2-documentation.md`. **Confirm archived copy can be deleted.** |

No other duplicates were detected (title-based heuristics on `pf-evatec-phase-2` tree, cross-checked byte-for-byte where suspicious).

---

## Archive Candidates

Moved to `docs/qa-documents/pf-evatec-phase-2/archive/review-required/`:

| Item | Reason |
|------|--------|
| `magnet-systems-kickoff-summary--from-r10.2-documentation.md` | Duplicate of the promoted overview file. |
| `286067--requirement-Requirement-ID--placeholder/` | Empty template placeholder folder (`requirement-Requirement ID/` — literal template text, not a real requirement ID). |

No files were deleted. Both items are preserved verbatim so QA can confirm they are safe to remove.

---

## Manual Review Items

- **Filename typo `cr-28411.md → cr-284111.md`** — restored the missing digit to match sibling naming (`cr-285729.md`, `cr-286067.md`, `cr-286836.md`, `cr-290161.md`). Content preserved. Please confirm no external tickets or scripts referenced the misspelled name.

- **Folder rename `28411-test-cases → test-cases`** — brought CR 284111 into line with the new canonical `test-cases` folder used by every CR.

- **Empty scaffolding folders** — the following are intentionally empty and reserved for future use: `03-testing/test-assets/`, `06-automation/scripts/`, `06-automation/tools/`, `07-references/source-files/`, `09-templates/`. Add `.gitkeep` files if you want them tracked in git.

- **`mini-stip-outline.md`** — contains historical text-only path listings under an "Original → renamed" block. These are historical notes, not active links, so they were **not** modified. If you want them rewritten to reflect the new tree, request a follow-up pass.

- **`planning/excel-files/`** — folder was empty on disk (no source `.xlsx` originals present). `07-references/source-files/` was created as the future home for any recovered originals.

- **Historical parsed test plans** (`03-testing/test-cases/pfevatec-*-test-plan.md`, 23 files) — these are converter output from earlier releases (R6–R10). They are **release-scoped historical artifacts** rather than Phase 2 R10.2 test cases. Consider whether they belong under `08-releases/<older-release>/` in a future pass. Left in `03-testing/test-cases/` per the original directive `resources/test-cases-parsed/* → 03-testing/test-cases/`.

- **`overview.md` free-text index** (now `00-project-overview/project-overview.md`) — mentions sibling filenames (`test-plan-converter.md`, `qa-environment-setup.md`, etc.) as plain text. These are not markdown links, so they were preserved. Update them manually if the file is intended as a navigation hub.

- **`.github/*` and `scripts/ado/*` are not under `pf-evatec-phase-2`** but were updated because they reference the reorganized paths. Review the diffs before pushing.

---

## Verification

Run these checks before pushing:

```powershell
# 1. Confirm no lingering references to the old paths inside the QA folder
git grep -n "r10-2\|crs/\|planning/PF-Evatec-R10.02" docs/qa-documents/pf-evatec-phase-2

# 2. Confirm no broken markdown links inside the QA folder
git grep -n "\](.*\.md)" docs/qa-documents/pf-evatec-phase-2

# 3. Confirm git tracked all moves as renames (not deletes + adds)
git status --short | Select-String "^R"
```

Reorg script and JSON log are preserved at:

- `scripts/_reorg/Invoke-QaDocsReorg.ps1`
- `scripts/_reorg/last-run.json`

Delete `scripts/_reorg/` after review if you do not want to keep the tooling.
