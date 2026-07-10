# R10.2 Update for CR 286067 - New Magnet System Type: Verify required field validation is displayed during creation

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- Tester is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` security rights.
- The Magnet System Types page is accessible.
- A valid ERP article is available for selection.

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Open the Magnet System Types page and select New. Select a valid ERP article. | The New Magnet System Type form is displayed. The Article #, Name, ERP Status, and Successor fields are populated from ERP data and cannot be edited. |
| 2 | Leave the Source Type field empty and select Save. | Save is blocked. A validation message is displayed indicating that Source Type is required. |
| 3 | Populate Source Type. Leave the FlexiCat Type field empty and select Save. | Save is blocked. A validation message is displayed indicating that FlexiCat Type is required. |
| 4 | Populate FlexiCat Type. Leave the Applications field empty and select Save. | Save is blocked. A validation message is displayed indicating that Applications is required. |
| 5 | Populate all required fields and select Save. | Validation messages are cleared. Save completes without errors. The tester is redirected to the View Magnet System Type page for the newly created Magnet System Type. |

## Expected Outcome
- Saving is blocked when any required field is empty.
- Validation messages clearly identify the missing required field.
- Source Type, FlexiCat Type, and Applications are validated as required fields.
- After all required fields are populated, the Magnet System Type is created successfully.
- The tester is redirected to the View Magnet System Type page after saving.
