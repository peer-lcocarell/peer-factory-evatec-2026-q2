# R10.2 Update for CR 286836 - Import Hardware Components from File: Verify duplicate records are handled according to business rules (Validation)

## Requirement
CR: 286836
Ticket: 34948
Requirement ID: 264374
Requirement: Import hardware components from file (Hardware Components)

## Preconditions
- User is signed in with permissions to import and view Hardware Components.
- Import file includes duplicate records for known component identifiers.
- Business rules for duplicate handling are defined in requirement/specification.
- Baseline active/inactive state is recorded for affected existing components.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Start import with a file containing duplicate hardware component records. | Import starts successfully. |
| 2 | Complete import and review summary. | Summary indicates duplicate handling outcomes (for example updated, skipped, or merged) according to configured rules. |
| 3 | Open affected hardware component records for duplicate identifiers. | Records reflect expected create/update/skip behavior per business rules. |
| 4 | Verify status values for affected records. | Status values are correct and consistent with imported source and rule expectations. |
| 5 | Verify no unintended deactivations occurred. | Valid existing components remain active unless explicitly required otherwise. |
| 6 | Verify an unrelated component sample. | Unrelated component activation state is unchanged. |

## Expected Outcome
Duplicate records are processed according to defined business rules with predictable outcomes, correct status handling, and no unintended activation/deactivation side effects.
