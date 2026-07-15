# R10.2 Update for CR 285729 - Search Hardware: Verify installed date range default behavior and invalid range handling (Validation)

## Requirement
CR: 285729
Ticket: 34951
Requirement ID: 287451
Requirement: Search for Installed Hardware Components (Common Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` permission.
- Installed hardware history exists for at least one component across more than one date.
- Search dialog contains 'Installed From' and 'Installed To' date fields.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Search Hardware' and inspect date fields before searching. | Date range is prefilled with default values for the current date context. |
| 2 | Search using the default date range and known criteria for a current installation. | Search executes and returns results consistent with current-date installations. |
| 3 | Set an invalid date range where 'Installed From' is later than 'Installed To'. Run search. | Search does not execute with invalid range. A clear validation message is shown. |
| 4 | Correct the date range and run search again. | Validation clears and search executes successfully. |

## Expected Outcome
The installed date range defaults correctly on dialog open, invalid date ranges are blocked with clear validation, and corrected ranges execute successfully.
