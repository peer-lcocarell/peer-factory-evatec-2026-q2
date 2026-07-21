# R10.2 Update for CR 286067 - View Magnet System: Verify inspection notification is displayed when a Magnet System requires inspection

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290767
Requirement: View Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- A prepared Magnet System record exists where inspection is required.
- A prepared Magnet System record exists where inspection is not required.
- Baseline identifiers are available for both prepared records (Magnet System Number and Serial Number).
- The 'Magnet Systems' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' list. | Records are displayed. |
| 2 | Open the View page for the prepared record where inspection is required. | The View screen loads for the selected record. |
| 3 | Read the notification area on the View screen. | An inspection notification is visible for the selected record. |
| 4 | Return to the 'Magnet Systems' list. | The list page is displayed. |
| 5 | Open the View page for the prepared record where inspection is not required. | The View screen loads for the selected record. |
| 6 | Read the notification area on the View screen. | No inspection notification is visible for the selected record. |

## Expected Outcome
Inspection notification behavior is status-driven and consistent. A visible notification appears for records that require inspection and is absent for records that do not require inspection.
