# R10.2 Update for CR 286067 - Learned Associations: Verify multiple learned magnet system associations are displayed correctly

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205378
Requirement: Learned Associations (Manage Hardware)

## Preconditions
- User is signed in with `ManageHardware_View` permission.
- User can perform standard magnet system exchanges.
- A single role can be exchanged with at least two different magnet system types.
- The 'Manage Hardware' > 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Perform a standard magnet system exchange for Role A with Magnet System Type X. | Exchange completes successfully and data is committed. |
| 2 | Perform a second standard magnet system exchange for Role A with Magnet System Type Y. | Exchange completes successfully and data is committed. |
| 3 | Open 'Manage Hardware' > 'Learned Associations' and select Role A. | Learned associations for Role A are displayed. |
| 4 | Review the learned associations list for Role A. | Both Magnet System Type X and Magnet System Type Y appear as learned associations for the role. |
| 5 | Verify each association entry metadata. | Each association entry maps to the correct role and exchanged magnet system type values. |
| 6 | Refresh and reopen the Learned Associations screen for Role A. | Both learned associations remain visible and unchanged. |

## Expected Outcome
Multiple standard magnet system exchanges create multiple learned associations for the same role. All expected magnet system types are displayed with correct metadata and persist after refresh and reopen.
