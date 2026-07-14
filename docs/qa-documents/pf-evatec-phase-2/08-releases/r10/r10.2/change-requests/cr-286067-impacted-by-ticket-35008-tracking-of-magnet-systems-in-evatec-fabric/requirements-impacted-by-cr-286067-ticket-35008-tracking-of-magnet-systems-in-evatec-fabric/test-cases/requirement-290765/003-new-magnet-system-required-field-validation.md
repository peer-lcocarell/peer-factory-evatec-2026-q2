# R10.2 Update for CR 286067 - New Magnet System: Verify required field validation is displayed when mandatory fields are empty during creation (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290765
Requirement: New Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- A valid Magnet System Type exists for selection.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and select the 'New' action. | The 'New Magnet System' creation screen loads. |
| 2 | Leave the Serial Number field empty. Leave the Magnet System Type unselected. Attempt to save. | Save is blocked. Required field validation is displayed for the Serial Number field and the Magnet System Type field. |
| 3 | Enter a unique Serial Number but leave Magnet System Type unselected. Attempt to save. | Save remains blocked. The Magnet System Type required field validation remains. Serial Number validation clears. |
| 4 | Select a valid Magnet System Type and leave the Serial Number empty. Attempt to save. | Save remains blocked. The Serial Number required field validation is displayed. Magnet System Type validation clears. |
| 5 | Enter a valid Serial Number and select a valid Magnet System Type. Save. | Validation clears. The new Magnet System is created with status `In Stock`. The record appears in the 'Magnet Systems' list. |

## Expected Outcome
Both Serial Number and Magnet System Type are required fields for new Magnet System creation. Attempting to save with either field empty displays a per-field required validation message. Providing valid values for all required fields allows the save to complete.
