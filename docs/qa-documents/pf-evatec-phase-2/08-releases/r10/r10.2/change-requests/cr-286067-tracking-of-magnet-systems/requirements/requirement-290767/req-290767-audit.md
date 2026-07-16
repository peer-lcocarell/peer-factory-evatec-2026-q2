# Requirement 290767 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Complete — 2026-07-16

---

## Coverage Assessment

### Existing Test Cases

| Test Case | Coverage Status | Covered Clauses |
|-----------|----------------|-----------------|
| 001-view-magnet-system-happy-path.md | Updated — Full | Clauses 1, 8, 9, 16 |
| 002-view-magnet-system-state-sensitive-fields.md | Updated — Full | Clauses 3, 4, 5, 6, 7 |
| 003-view-magnet-system-inspection-notification.md | New | Clause 2 |
| 004-view-magnet-system-action-button-permissions.md | New | Clauses 10, 11, 12, 13, 14, 15 |

### Coverage Gaps

| Clause | Coverage Status | Gap Description |
|--------|----------------|-----------------|
| 1 View details | Covered | 001 — verified |
| 2 Inspection notification | Covered | 003 — new test added |
| 3 Current Location | Covered | 002 — all statuses verified |
| 4 Checked Out To | Covered | 002 updated to include this field |
| 5 Checked Out At | Covered | 002 updated to include this field |
| 6 Retire Date | Covered | 002 updated to include this field |
| 7 Retirement Reason | Covered | 002 updated to include this field |
| 8 Copy URL | Covered | 001 updated to include this step |
| 9 Print Label | Covered | 001 updated to include this step |
| 10 Edit action | Covered | 004 — permission step 2 |
| 11 Modify action | Covered | 004 — permission step 3 |
| 12 Define as Standard action | Covered | 004 — permission step 4 |
| 13 Checkout action | Covered | 004 — permission step 5 |
| 14 Return action | Covered | 004 — permission step 6 |
| 15 Retire action | Covered | 004 — permission step 7 |
| 16 Back navigation | Covered | 001 updated to include this step |

### Recommendations

- All 16 clauses are now covered.
- Publish all 4 test cases to ADO suite for requirement 290767.
- 003 and 004 are new; 001 and 002 are updates.

---

## Notes

- Audit completed 2026-07-16.
- 001 updated: added Copy URL, Print Label, and Back navigation steps.
- 002 updated: extended In Use step to verify Checked Out To and Checked Out At; extended Retired step to verify Retire Date and Reason. Field absence for non-applicable statuses also added.
- 003 created: inspection notification coverage (materially different precondition — inspection-required state).
- 004 created: action button permission coverage (permission-based behavior with distinct preconditions per role).

### Summary Metrics

| Metric | Value |
|--------|-------|
| Total requirement clauses | 16 |
| Covered clauses | 16 |
| Partially covered clauses | 0 |
| Uncovered clauses | 0 |
| Existing tests updated | 2 |
| New tests created | 2 |
| Consolidation opportunities identified | 2 (Checked Out fields into 002; actions into single permission test) |

13.5.3REQUIREMENT: View Magnet System
If a user has permission to view magnet systems but not edit, they will be able to drill into the magnet system details.

If inspection is required a notification will be displayed.

In addition to the standard fields

Current Location will be displayed

If the magnet system is checked out the ‘Checked Out To’ (user) and ‘Checked Out At’ (timestamp) will be displayed

If the magnet system is retired the ‘Retire Date’ and ‘Reason’ will be displayed

Additionally the user can

Copy the url (<path>/magnet systems/view/<magnet system number>) to the clipboard

Print a Label or,

Edit the magnet system if they have the MagnetSystems_Edit security right, or

if the magnet system is active

oModify a magnet system if they have the MagnetSystems_Modify security right, or

oDefine a magnet system as standard (Define Magnet System Type as Standard) if it is a prototype and they have the MagnetSystems_Modify security right, or

oCheckout a magnet system if they have the MagnetSystems_Process security right, or

oReturn a magnet system if it is checked out and they have MagnetSystems_Process security right, or

oRetire the magnet system if they have the MagnetSystems_Remove security right

Back will return to the previous page.
