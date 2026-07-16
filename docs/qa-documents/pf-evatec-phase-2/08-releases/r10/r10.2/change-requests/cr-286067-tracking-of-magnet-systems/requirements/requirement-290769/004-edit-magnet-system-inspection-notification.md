# R10.2 Update for CR 286067 - Edit Magnet System: Verify retired-state restrictions and edit validation behavior (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290769
Requirement: Edit Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- A non-retired Magnet System exists in a state where inspection is required.
- A Retired Magnet System exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the non-retired inspection-required Magnet System in Edit mode. | The Edit screen loads and inspection-required notification is visible. |
| 2 | Without making changes, review Save state. | Save is not available in unchanged state. |
| 3 | Enter data that violates one Create Magnet System validation rule. | Rule-specific validation is shown and save is blocked for invalid data. |
| 4 | Correct the invalid value and verify Save state. | Validation clears and Save becomes available after valid change. |
| 5 | Save the changes. | Save completes and user is redirected to the View Magnet System page. |
| 6 | Open a Retired Magnet System in Edit mode. | Only Comment is editable and other fields are read-only. |
| 7 | Update Comment and save. | Save completes and redirects to the View Magnet System page. |
| 8 | Re-open the Retired record. | Updated Comment is persisted and non-comment fields remain unchanged. |

## Expected Outcome
Inspection-required notification is displayed when applicable. Edit mode enforces Create Magnet System validation rules and Save availability rules. For Retired Magnet Systems, only Comment is editable and can be saved.
