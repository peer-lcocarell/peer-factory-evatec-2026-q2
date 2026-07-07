# R10.2 Update for CR 286067 - New Magnet System Type: Verify required field validation is displayed during creation (Unhappy Path)

## Requirement

- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Requirement: New Magnet System Type (Magnet System Types)

## Preconditions

- User is signed in with permission to create Magnet System Types.
- Magnet System Type creation page is accessible.
- A valid ERP article can be selected to start creation.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open Magnet System Types and start creating a new Magnet System Type from ERP article selection. | New Magnet System Type form loads with ERP-derived read-only fields. |
| 2 | Leave one required field empty (for example Source Type, FlexiCat Type, or Applications). | Form remains in an incomplete state. |
| 3 | Attempt to save the new Magnet System Type. | Save is blocked and required field validation is shown. |
| 4 | Populate all required fields and save again. | Validation clears and save succeeds. |

## Expected Outcome

Required field validation prevents incomplete Magnet System Type creation and allows save only after all required fields are provided.
