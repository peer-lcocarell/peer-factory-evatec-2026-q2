# R10.2 Update for CR 286067 - New Magnet System Type: Verify tester can create a new Magnet System Type with valid data (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290757
Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- At least one Hardware Component (ERP article) not yet assigned as a Target Type or Magnet System Type is available.
- The 'Magnet System Types' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and select 'New'. | The article selector dialog is displayed. Manual type entry is not available. Only ERP article selection is offered. |
| 2 | Select a valid article number from Hardware Components. | The sourced fields (Article Number, Name, ERP Status, Successor) populate from ERP data and are read-only. |
| 3 | Enter valid values for Source Type, FlexiCat Type, and Applications. Optionally enter a Description. | Fields accept input without validation errors. |
| 4 | Save the new Magnet System Type. | Save completes without errors. The new record appears in the 'Magnet System Types' list. |
| 5 | Open the Magnet System Type History view for the new record. | A creation history entry is present with the current user and timestamp. |

## Expected Outcome
A new Magnet System Type is created from a valid ERP article. ERP-sourced fields are read-only. Required fields (Source Type, FlexiCat Type, Applications) accept valid input. After save, the record appears in the list and a creation history entry is written.
