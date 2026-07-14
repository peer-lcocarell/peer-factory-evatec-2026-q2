# 290758 REQUIREMENT

## 13.4.2.1 Requirement: View and Upload Documents for New Magnet System Type

A user can upload one or more documents while creating a new Magnet System Type.

A user can also view and remove uploaded documents. No confirmation dialog is displayed before document removal.

## QA Audit Notes (2026-07-13)

### Coverage Status

Full coverage achieved by the current authored suite. Execution is pending.

### Active Test Cases

- 001-view-and-upload-documents-for-new-magnet-system-type-happy-path.md
- 003-upload-multiple-documents-for-new-magnet-system-type-happy-path.md
- 006-multi-negative-document-upload-and-removal-validation-during-create.md

### Coverage Summary

The active test suite validates:

- Upload of a single valid document during Magnet System Type creation.
- Upload of multiple valid documents during Magnet System Type creation.
- Support for the requirement statement "one or more documents."
- Rejection of unsupported document types.
- Removal of uploaded documents.
- Removal behavior without a confirmation dialog.
- Persistence of retained documents after save and reopen.
- Non-persistence of removed documents after save and reopen.
- End-to-end negative validation through a consolidated negative scenario.

### Coverage Decision

- Test case `006` serves as the primary negative coverage scenario.
- Test cases `001` and `003` provide positive-path coverage.
- No additional test cases are required at this time.

### Audit Results

| Test Case | Coverage Contribution |
|------------|----------------------|
| 001 | Single-document upload happy path |
| 003 | Multi-document upload happy path |
| 006 | Negative upload validation, document removal, no-confirmation behavior, and persistence validation |

### Traceability

| Requirement ID | Coverage Status | Covered By |
|----------------|-----------------|------------|
| 290758 | Yes | 001, 003, 006 |

### Orphaned Test Cases

- None

### Uncovered Requirements

- None

### Redundancy Assessment

- No duplicate test cases identified.
- Minor overlap exists between positive-path upload scenarios.
- Overlap is intentional and provides distinct validation objectives.

### Risks

- Document persistence relies on correct save and reload behavior.
- Removal without confirmation increases the risk of accidental deletion and should be included in regression testing following UI changes.

### Clarifications

- Original requirement wording: "view remove uploaded documents"
- Interpreted and normalized as: "view and remove uploaded documents"
