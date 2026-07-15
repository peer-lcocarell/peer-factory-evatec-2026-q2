# NAMING-STANDARDS.md

**Scope:** `docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/`
**Owner:** QA Command Center
**Last Updated:** 2026-07-15
**Status:** Active

---

## Naming Principles

- Use lowercase kebab-case for all file and folder names.
- Use hyphens `-` exclusively as word separators. Never use underscores `_` or spaces.
- Keep names short, descriptive, and scannable.
- Every name must be unambiguous without reading the file content.
- Path depth and name length must stay within Windows MAX_PATH (260 characters).
- Names must sort meaningfully in alphabetical and numeric order.

---

## Allowed Characters

- Lowercase letters: `a-z`
- Digits: `0-9`
- Hyphen: `-`
- Dot (extension only): `.`

**Forbidden:** uppercase letters, underscores `_`, spaces, parentheses, ampersands, slashes within names.

---

## Directory Naming Rules

### CR Root Folders

Pattern: `cr-{cr-id}-{short-description}`

- Prefix with `cr-`.
- Follow immediately with the numeric CR ID.
- Append a short description (2–5 words) of the feature or change.
- No ticket ID in the folder name — ticket mapping belongs in the CR overview file.

Examples:

```
cr-284111-wbs-element-for-self-service-boxes
cr-285729-search-hw-components
cr-286067-tracking-of-magnet-systems
cr-286836-article-import
cr-290161-pdt-tool-definition-new-tool-type
```

Anti-patterns to avoid:

```
cr-284111_wbs-element-for-self-service-boxes       ← underscore
cr-286067-impacted-by-ticket-35008-tracking-of-magnet-systems-in-evatec-fabric  ← too long, ticket in name
cr-290161_error-use-pdt-to-create-the-tool-definition-for-new-tool-type         ← underscore, error prefix, too long
```

### Requirements Subfolder

Pattern: `requirements`

- Always named `requirements` (singular, lowercase).
- The CR context is provided by the parent folder — no need to repeat it.
- Never embed CR ID, ticket ID, or description in this folder name.

Example path:

```
cr-284111-wbs-element-for-self-service-boxes/
  requirements/
    requirement-36297/
    requirement-36298/
```

Anti-patterns to avoid:

```
requirements-impacted-by-cr-284111-ticket-34682-wbs-element-for-self-service-boxes  ← excessively long, causes MAX_PATH issues
```

### Requirement Subfolders

Pattern: `requirement-{req-id}`

Examples:

```
requirement-36297
requirement-36298
requirement-226372
```

No test-case intermediate folder. Test case files live directly inside the requirement folder.

Anti-patterns to avoid:

```
requirement-36297/test-cases/   ← unnecessary intermediate layer
```

---

## File Naming Rules

### CR Overview Files

Pattern: `cr-{cr-id}.md`

Examples:

```
cr-284111.md
cr-285729.md
cr-286067.md
cr-286836.md
cr-290161.md
```

### Test Case Files

Pattern: `{nnn}-{description}-{scenario-type}.md`

- `{nnn}`: Zero-padded 3-digit sequence number starting at `001`. Sequential, no gaps.
- `{description}`: Kebab-case feature and action description (2–6 words).
- `{scenario-type}`: One of the following suffixes:
  - `happy-path`
  - `negative`
  - `validation`
  - `regression`
  - `boundary`
  - `security`
  - `performance`

Examples:

```
001-box-list-required-columns-happy-path.md
002-box-list-status-filter-happy-path.md
003-new-box-wbs-autogeneration-happy-path.md
004-new-box-wbs-validation-negative.md
005-new-box-work-order-prefix-mismatch-negative.md
```

Anti-patterns to avoid:

```
003-create-magnet-system-type.md        ← missing scenario-type suffix
004-edit-magnet-system-type-and-readonly-view.md  ← too long, "and" is a connector
prompt.md                               ← not a test case, wrong name
```

### Requirement Audit Files

Pattern: `req-{req-id}-audit.md`

Examples:

```
req-36297-audit.md
req-226372-audit.md
req-290756-audit.md
```

Anti-patterns to avoid:

```
req-75372 -audit.md   ← space before hyphen (causes file system issues)
```

---

## Scenario Type Suffix Reference

| Suffix | When to Use |
|---|---|
| `happy-path` | Primary success path with valid inputs |
| `negative` | Invalid input, error condition, or rejected action |
| `validation` | Field or data validation behavior |
| `regression` | Existing functionality preservation check |
| `boundary` | Edge values (min/max, empty, limit) |
| `security` | Permission denied, unauthorized access |
| `performance` | Load, speed, or scale validation |

---

## Sequence Numbering Rules

- Start at `001` for each requirement folder.
- Numbers must be contiguous with no gaps.
- If a test case is removed, renumber the remaining files to close the gap.
- Do not reuse numbers from deleted test cases.

Anti-patterns to avoid:

```
001-view-documents.md
003-upload-multiple-documents.md    ← gap at 002
006-multi-negative-validation.md    ← gap at 004, 005
```

---

## Examples by File Type

| Type | Pattern | Example |
|---|---|---|
| CR overview | `cr-{id}.md` | `cr-284111.md` |
| Test case | `{nnn}-{description}-{type}.md` | `001-create-magnet-system-type-happy-path.md` |
| Requirement audit | `req-{id}-audit.md` | `req-36297-audit.md` |
| Working notes | `notes-{topic}.md` | `notes-coverage-gaps.md` |

---

## Path Depth Recommendation

Recommended maximum depth from workspace root:

```
docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/change-requests/
  cr-{id}-{desc}/               depth +1
    requirements/               depth +2
      requirement-{id}/         depth +3
        {nnn}-{name}.md         depth +4 (file)
        req-{id}-audit.md       depth +4 (file)
```

Never add an extra `test-cases/` folder at depth +3.

---

## Validation Checklist

Before committing new files or folders:

- [ ] All names are lowercase.
- [ ] Only hyphens used as separators — no underscores or spaces.
- [ ] CR folder uses pattern `cr-{id}-{short-description}`.
- [ ] Requirements folder is named `requirements` with no appended context.
- [ ] Test case files use 3-digit zero-padded sequence numbers.
- [ ] Test case files end with an approved scenario-type suffix.
- [ ] Sequence numbers are contiguous with no gaps.
- [ ] Audit files use pattern `req-{id}-audit.md` with no spaces.
- [ ] No intermediate `test-cases/` folder inside requirement folders.
- [ ] Full path from workspace root is under 200 characters.

---

## Exception Handling

Exceptions require sign-off from the QA Lead.

Permitted exceptions:

- Legacy folders pending migration may retain old names temporarily.
- Folders must be listed in `NAMING-AUDIT.md` under "Pending Migration".

Not permitted as exceptions:

- Spaces in file or folder names.
- Uppercase letters.
- Paths that exceed Windows MAX_PATH.
