# R10.2 Update for CR 286067 - New Magnet System Type: Verify required field validation is displayed during creation (Unhappy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290757
Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- The 'Magnet System Types' creation page is accessible.
- A valid ERP article can be selected to start creation.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and start creating a new type by selecting an ERP article. | The 'New Magnet System Type' form loads with ERP-derived read-only fields. |
| 2 | Leave a required field empty (for example Source Type, FlexiCat Type, or Applications). Attempt to save. | Save is blocked. A required field validation message is displayed for the empty required field. |
| 3 | Populate all required fields and save. | Validation clears. Save completes. The new record appears in the 'Magnet System Types' list. |

## Expected Outcome
Saving a new Magnet System Type with one or more required fields empty is blocked. A per-field validation message is displayed identifying the missing required input. Populating all required fields allows the save to complete.
