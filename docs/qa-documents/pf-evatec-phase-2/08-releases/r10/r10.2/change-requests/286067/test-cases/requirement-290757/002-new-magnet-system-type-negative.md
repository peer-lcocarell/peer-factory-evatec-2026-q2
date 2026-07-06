# R10.2 Update for CR 286067 - New Magnet System Type: Verify required field validation is displayed when creating a magnet system type (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290757
Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with permission to create Magnet System Types.
- Magnet System Types page is accessible.
- Required fields and validation messages are enabled in the environment.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Magnet System Types and start New. | Select Article dialog is displayed. |
| 2 | Select a valid article and continue to the New Magnet System Type screen. | Fields sourced from Hardware Components populate. |
| 3 | Leave required user-entered fields (for example Source Type, FlexiCat Type, Application) empty and attempt to save. | Save is blocked and required-field validation is displayed. |
| 4 | Provide valid values for the required fields and save. | Validation clears and save succeeds. |

## Expected Outcome
System prevents saving a new Magnet System Type when required fields are missing and displays clear validation.
