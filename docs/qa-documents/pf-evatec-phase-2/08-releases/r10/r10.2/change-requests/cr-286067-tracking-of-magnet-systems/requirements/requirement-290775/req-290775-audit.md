# Requirement 290775 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Pending

---

## Coverage Assessment

### Existing Test Cases

_To be completed._

### Coverage Gaps

_To be completed._

### Recommendations

_To be completed._

---

## Notes

_To be completed._
13.5.9REQUIREMENT: Return Magnet System
When a magnet system is checked out it can be returned if the status is ‘Checked Out’ or ‘In Inspection’.

The user will be prompted for confirmation allowing them to cancel the ‘return’ without any changes to the magnet system.

Upon confirmation PF will

1.Update the status to ‘In Stock’

2.Clear the location

3.Clear the checked out by and timestamp

4.Add a ‘returned by [user]’ entry to the history

Users must have the MagnetSystems_Process security right to access this functionality.


## Recommended Actions for Requirement 290775

### 1. Delete This Test Case

Remove:

```text
R10.2 Update for CR 286067 - Return Magnet System: Verify Location is cleared and status returns to In Stock after return from Checked Out (Validation)


Reason:

It does not test a separate workflow.
It only validates requirement outcomes that belong to the core Return workflow.
Maintaining a separate test adds duplication without increasing coverage.
2. Update the Existing Happy Path Test

File:

R10.2 Update for CR 286067 - Return Magnet System: Verify tester can return a Magnet System to available inventory (Happy Path)


Add the following validation steps:

Step	Action	Expected Result5	Review the checkout information on the returned Magnet System.	The Checked Out By field is empty. The Checked Out Timestamp field is empty.
6	Verify the Location field.	The Location field is empty.
7	Open the Magnet System History view.	A "Returned By" history entry is present containing the acting user and timestamp.

Update the Expected Outcome to include:

A Checked Out Magnet System can be returned to inventory. After return, the status changes to In Stock, the Location field is cleared, the Checked Out By field is cleared, and the Checked Out Timestamp field is cleared. A Return history entry is written containing the acting user and timestamp.

3. Add a Return Cancellation Test

Create:

R10.2 Update for CR 286067 - Return Magnet System: Verify tester can cancel a return operation (Validation)


Purpose:

Cover the confirmation dialog cancellation path.
Verify no changes are made when Cancel is selected.

This covers a requirement clause that is currently untested.

4. Add a Security Test

Create:

R10.2 Update for CR 286067 - Return Magnet System: Verify return security permissions are enforced (Security)


Purpose:

Validate the MagnetSystems_Process security requirement.
Verify users without permission cannot perform Return.
5. Expand the Existing Negative Test

File:

R10.2 Update for CR 286067 - Return Magnet System: Attempt to return a Magnet System that is already In Stock (Negative)


Add validation that:

Return is available for Checked Out.
Return is available for In Inspection.
Return is unavailable for In Stock.

This fully validates the status rule.

Final Suite

Keep:

Return Magnet System Happy Path (expanded)
Return Magnet System Invalid Status (expanded)
Return Cancellation (new)
Return Security Permissions (new)

Remove:

Return Location Cleared Validation
Net Result

Current Tests: 3

Recommended Tests: 4

New Tests Added: 2

Tests Removed: 1

Net Growth: +1

This achieves full requirement coverage with minimal suite growth.
