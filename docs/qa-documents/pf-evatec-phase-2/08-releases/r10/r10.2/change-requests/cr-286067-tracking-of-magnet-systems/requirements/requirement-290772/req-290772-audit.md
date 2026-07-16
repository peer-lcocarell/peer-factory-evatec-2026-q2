# Requirement 290772 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Complete

---

## Coverage Assessment

### Existing Test Cases

- 001 - Retire Magnet System: Happy Path (expanded)
- 002 - Retire Magnet System: Retired system not selectable for new assignments (Validation)
- 003 - Retire Magnet System: Attempt to retire a system currently In Use (Negative)
- 004 - Retire Magnet System: Retirement blocked when no reason is provided (Validation)
- 005 - Retire Magnet System: Security permissions enforced (Security)

### Coverage Gaps

None. All requirement clauses are covered.

### Recommendations

- 001 was expanded with cancel workflow, retirement metadata validation (reason, user, timestamp), and Inspection Required flag clearing.
- 005 was added to cover the `MagnetSystems_Remove` security right requirement.

---

## Coverage Matrix

- Retirement workflow (happy path) — 001
- Cancel retirement without committing — 001
- State restriction: In Use cannot be retired — 003
- Required reason validation — 004
- Retirement metadata: reason, user, timestamp — 001
- Inspection Required flag cleared — 001
- History entry on retirement — 001
- Retired system excluded from assignment dialogs — 002
- Security: MagnetSystems_Remove required — 005

---

## Notes

_To be completed._
13.5.6REQUIREMENT: Retire Magnet System
A magnet system can be retired from active use in PF if its status is ‘In Stock’.

The user will be prompted to confirm before PF retires the magnet system and enter a reason for the retirement, allowing them to cancel the retirement.

When retiring PF will

1.Update the state Retired

2.Store the retirement reason, user performing the retirement and retirement timestamp

3.Clear the location and inspection required flag

4.Add a ‘retired’ entry to history

Users must have the MagnetSystems_Remove security right to access this functionality.
