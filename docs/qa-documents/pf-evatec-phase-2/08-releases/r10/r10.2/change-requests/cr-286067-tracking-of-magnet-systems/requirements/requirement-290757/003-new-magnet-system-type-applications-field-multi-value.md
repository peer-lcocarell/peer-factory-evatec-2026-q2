# R10.2 Update for CR 286067 - New Magnet System Type: Verify the Applications field accepts multiple predefined values

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- Tester is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` security rights.
- A valid Hardware Component (ERP article) is available for Magnet System Type creation.
- The Magnet System Types page is accessible.

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Open the Magnet System Types page and select New. Select a valid ERP article. | The New Magnet System Type form is displayed. The ERP-derived fields are populated. |
| 2 | Navigate to the Applications field. | The Applications field is displayed and contains predefined Application values. |
| 3 | Select two or more Application values. | Multiple Application values can be selected simultaneously. |
| 4 | Complete all required fields and save the Magnet System Type. | Save completes without validation errors. The tester is redirected to the View Magnet System Type page. |
| 5 | Reopen the Magnet System Type record. | All selected Application values are displayed. |
| 6 | Open the Magnet System Type History view. | A single creation history entry is displayed for the newly created Magnet System Type. |

## Expected Outcome
- The Applications field supports selecting multiple predefined Application values.
- Multiple selected Application values are saved successfully.
- Selected Application values persist after save.
- The tester is redirected to the View Magnet System Type page after saving.
- A single creation history entry is created for the new Magnet System Type.
