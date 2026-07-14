# R10.2 Update for CR 286067 - Learned Associations: Verify standard magnet system exchange creates learned association (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205378
Requirement: Learned Associations (Manage Hardware)

## Preconditions
- User is signed in with `ManageHardware_View` permission.
- User can perform a standard magnet system exchange in the target logbook category.
- A role and magnet system type pair exists for exchange validation.
- The 'Manage Hardware' > 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Perform a standard magnet system exchange for the target role and confirm completion. | Exchange completes successfully for the selected role and magnet system type. |
| 2 | Open 'Manage Hardware' and navigate to 'Learned Associations'. | The 'Learned Associations' screen loads. |
| 3 | Select the role used in the exchange. | The role is selected and learned association details are displayed. |
| 4 | Review learned association entries. | The exchanged magnet system type is shown as a learned association for the selected role. |
| 5 | Verify association data fields. | Role, magnet system type, and association metadata match the completed exchange event. |
| 6 | Refresh the page and reopen 'Learned Associations' for the same role. | The learned magnet system association remains present and unchanged after refresh/reopen. |

## Expected Outcome
A standard magnet system exchange creates a persisted learned association between the role and exchanged magnet system type. The association is visible and stable after refresh and reopen.
