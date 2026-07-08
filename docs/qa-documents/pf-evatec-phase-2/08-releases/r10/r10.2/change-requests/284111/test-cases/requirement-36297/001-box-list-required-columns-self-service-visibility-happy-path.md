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
- At least one known Self-Service box and one known non-self-service box are available for comparison.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the `Boxes` list page from main navigation. | List loads successfully and records are displayed without UI errors. |
| 2 | Verify visible columns in the list/grid header. | Required columns are present: Box #, Name, Owner, Work Order, Location, Shelf #, Article #, Substrate Type, Self-Service, Status, Entry Date, Reminder Date, Process Date. |
| 3 | Verify column order against requirement specification. | Columns are displayed in expected order and no required column is missing or duplicated. |
| 4 | Locate a known Self-Service record in the grid. | The `Self-Service` column value is displayed as enabled/true according to environment representation. |
| 5 | Locate a known non-self-service record in the grid. | The `Self-Service` column value is displayed as disabled/false according to environment representation. |
| 6 | Open the known Self-Service record from the list. | Record opens successfully and Self-Service value in details matches the list value. |
| 7 | Return to list and open the known non-self-service record. | Record opens successfully and Self-Service value in details matches the list value. |
| 8 | Return to list and refresh the page. | Required columns remain visible and values remain consistent after refresh. |

## Expected Outcome
Boxes list consistently shows all required columns, including `Self-Service`, and list values remain accurate when validated against box detail views.
