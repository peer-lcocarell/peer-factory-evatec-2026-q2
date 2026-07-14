# R10.2 Update for CR 286067 - New Magnet System Type: Verify tester can create a new Magnet System Type with valid data

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- Tester is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` security rights.
- At least one Hardware Component (ERP article) that is not already assigned as a Target Type or Magnet System Type is available.
- The Magnet System Types page is accessible.

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Open the Magnet System Types page and select New. | The article selector dialog is displayed. Manual Magnet System Type creation is not available. Only ERP article selection is available. |
| 2 | Select a valid article number from Hardware Components. | The Article #, Name, ERP Status, and Successor fields are populated from ERP data and cannot be edited. |
| 3 | Enter valid values for Source Type, FlexiCat Type, and Applications. Optionally enter a Description. | The values are accepted without validation errors. |
| 4 | Save the new Magnet System Type. | Save completes without errors. The tester is redirected to the View Magnet System Type page for the newly created Magnet System Type. |
| 5 | Open the Magnet System Type History view. | A single creation history entry is displayed with the current user and timestamp. |

## Expected Outcome
- A new Magnet System Type is created from a valid ERP Hardware Component.
- ERP-derived fields remain read-only during creation.
- Required fields (Source Type, FlexiCat Type, and Applications) accept valid input.
- The tester is redirected to the View Magnet System Type page after saving.
- A single creation history entry is created for the new Magnet System Type.
