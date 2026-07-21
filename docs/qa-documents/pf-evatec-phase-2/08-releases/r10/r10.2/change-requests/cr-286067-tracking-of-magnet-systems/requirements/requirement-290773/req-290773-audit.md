# Requirement 290773 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Consolidation completed on 2026-07-17.

Clarification updates applied on 2026-07-20.

## NOTES
adding clarification note per Teams update discussion today (7/20/2026):

Clarification (per Nicola):
- A unique Article Number is required when creating the first prototype version from a standard Magnet System.
- Example: Standard MST to Prototype V01 requires a new Article Number.
- When creating a new version of an existing prototype, the Article Number can remain the same.
- Example: Prototype V01 to Prototype V02 can use the same Article Number.
- Article Number uniqueness validation applies when creating the initial prototype, not for subsequent prototype versions.

Applied in test suite:
- 003 now explicitly validates reuse of the same Article Number for V02 after V01 creation.
- 001, 002, 003, 004, and 005 preconditions now consistently include `MagnetSystems_Modify` where modify actions are executed.
- 002 now validates direct-access denial for all disallowed statuses used in the scenario (`In Use`, `In Stock`, and `Retired`).

---

## Authoritative Test Cases

- 001-modify-magnet-system-happy-path.md
- 002-modify-magnet-system-status-restriction-negative.md
- 003-modify-magnet-system-variant-code-increment.md
- 004-modify-magnet-system-use-existing-prototype.md
- 005-modify-magnet-system-prototype-creation-rules-and-cancellation.md
- 006-modify-magnet-system-security-permissions.md

## Merged and Retired Files

- Merged into 002: 003-modify-blocked-when-in-use.md
- Merged into 003: 004-variant-code-increments-on-second-prototype.md
- Merged into 004: 005-assign-to-existing-prototype-type-during-modify.md
- Merged into 005: 006-cancel-modify-does-not-create-prototype.md
- Merged into 006: 007-modify-action-not-available-without-permission.md

## Coverage Audit Table

| Test Case ID | Requirement ID(s) | Coverage (Yes/Partial/No) | Key Gap(s) | Recommended Action |
| --- | --- | --- | --- | --- |
| 001-modify-magnet-system-happy-path | 290773 | Yes | None. | None. |
| 002-modify-magnet-system-status-restriction-negative | 290773 | Yes | None. | None. |
| 003-modify-magnet-system-variant-code-increment | 290773 | Yes | None. | None. |
| 004-modify-magnet-system-use-existing-prototype | 290773 | Yes | None. | None. |
| 005-modify-magnet-system-prototype-creation-rules-and-cancellation | 290773 | Yes | None. | None. |
| 006-modify-magnet-system-security-permissions | 290773 | Yes | None. | None. |

## Uncovered Requirements

- None.

## Orphaned Test Cases

- None.

## Consolidation Opportunities

- None.

## High-Risk Gaps

- None.

## Summary Metrics

- Total Requirements: 1

- Total Requirement Clauses: 20

- Total Test Cases: 6

- Covered Clauses: 20

- Partial Clauses: 0

- Uncovered Clauses: 0

- Orphaned Test Cases: 0

- Consolidation Opportunities: 0

Final Audit Verdict

Coverage Health:
- Good

Reason:
- Checked Out-only status rule, disallowed-status blocking, and direct-access denial are covered.

- Existing-prototype and new-prototype branches are covered including confirmation, sequential variant generation, and predecessor linkage.

- Field rules, cancellation behavior, history outcomes, and security permission boundary are covered.
