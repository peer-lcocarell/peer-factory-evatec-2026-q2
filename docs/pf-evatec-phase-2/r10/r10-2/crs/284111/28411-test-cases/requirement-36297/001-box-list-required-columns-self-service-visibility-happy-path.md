# R10.2 Update for CR 284111 - Boxes List: Verify required columns include Self-Service visibility (Happy Path)

## Requirement
CR: 284111
Ticket: 34682
Requirement ID: 36297
Requirement: Boxes list displays required columns, including Self-Service, for operational visibility.

## Preconditions
- User is signed in with `Boxes_View` permission.
- Box data exists with both Self-Service and non-self-service records.
- User is on the `Boxes` list page.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the `Boxes` list page. | List loads successfully with records displayed. |
| 2 | Verify visible columns in the list/grid header. | Required columns are present: Box #, Name, Owner, Work Order, Location, Shelf #, Article #, Substrate Type, Self-Service, Status, Entry Date, Reminder Date, Process Date. |
| 3 | Review multiple rows with known test data. | Self-Service values are visible and correctly reflect record configuration. |
| 4 | Open one Self-Service and one non-self-service box from the list. | Detail pages are accessible and Self-Service values match list display. |

## Expected Outcome
Boxes list shows all required columns, and Self-Service values are visible and consistent with box details.
