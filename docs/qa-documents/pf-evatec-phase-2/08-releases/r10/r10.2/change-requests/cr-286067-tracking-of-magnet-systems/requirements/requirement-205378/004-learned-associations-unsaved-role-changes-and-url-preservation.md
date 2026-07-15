# R10.2 Update for CR 286067 - Learned Associations: Verify unsaved role changes do not persist and selected role is preserved in URL

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 205378
Requirement: Learned Associations (Manage Hardware)

## Preconditions
- User is signed in with `ManageHardware_View` permission.
- A role exists with at least one learned magnet system association.
- Role selection state is represented in the URL when using 'Learned Associations'.
- The 'Manage Hardware' > 'Learned Associations' screen is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' > 'Learned Associations' and select the role with learned magnet system associations. | Learned associations are displayed and the selected role is reflected in the URL. |
| 2 | Perform a role modification related to association context but do not save, then navigate away from the screen. | Unsaved role modification is discarded. |
| 3 | Return to 'Learned Associations' and reselect the same role. | Learned magnet system associations remain based on last saved state; unsaved modification is not applied. |
| 4 | Refresh the browser while keeping the selected role in context. | The same role remains selected from URL context and the same learned associations are displayed. |
| 5 | Reopen the browser/page using the preserved URL for the selected role. | The selected role is restored from URL and learned association view is consistent with saved data. |

## Expected Outcome
Unsaved role changes do not alter persisted learned magnet system associations. Selected role context is preserved via URL across refresh and reopen, and learned association display remains consistent.
