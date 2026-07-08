# R10.2 Update for CR 284111 - New Box: Verify Self-Service WBS auto-generation and successful save (Happy Path)

## Requirement
CR: 284111
Ticket: 34682
Requirement ID: 36298
Requirement: In New Box flow, enabling Self-Service displays required WBS Element and auto-generates a valid default from selected Work Order.

## Preconditions
- User is signed in with `Boxes_Create` and `Boxes_View` permissions.
- At least one active Work Order with a valid work order number is available.
- User is on `Boxes > Create New Box` page.
- Required base fields (for example Owner, Location, Shelf, and Work Order) are available and selectable.
- No duplicate blocking data exists for the planned new box identifier inputs.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Start New Box and complete mandatory base fields including Work Order. | Base fields are accepted without validation errors. |
| 2 | Set `From Self-Serve Station` to `Yes`. | WBS Element field is displayed and marked as required. |
| 3 | Verify default WBS value immediately after Work Order selection. | WBS is auto-generated in valid format `[WorkOrderNumber].##.##` (for example `WO12345.00.00`) and prefix matches selected Work Order. |
| 4 | Keep generated WBS value and complete any remaining required fields. | Form is valid for save with no blocking validation messages. |
| 5 | Save the New Box with valid generated WBS value. | Save succeeds and record is created. |
| 6 | Open created record in View mode. | Self-Service flag is enabled and WBS value matches saved generated value. |
| 7 | Open created record in Edit mode and verify fields. | Self-Service and WBS values remain unchanged and valid after transition to Edit page. |
| 8 | Return to `Boxes` list and locate the created record. | Record appears in list and Self-Service indicator reflects enabled state. |

## Expected Outcome
New Box flow supports Self-Service creation with valid Work Order-based WBS auto-generation, successful save, and consistent persistence across Create, View, Edit, and list screens.
