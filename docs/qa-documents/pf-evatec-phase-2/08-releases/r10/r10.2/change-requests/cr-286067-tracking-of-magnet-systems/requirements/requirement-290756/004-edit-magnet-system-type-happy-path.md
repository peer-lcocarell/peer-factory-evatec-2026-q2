---
TestCaseId: 293468
PlanId: 291616
SuiteId: 292263
---

# R10.2 Update for CR 286067 - Magnet System Types: Edit Existing Magnet System Type and Read-Only View

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- A user account exists with `MagnetSystemTypes_Edit` permission.
- A second user account exists with `MagnetSystemTypes_View` permission only.
- At least one existing Magnet System Type record exists.
- At least one existing Magnet System Type record is in Standard status.

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Log in as the user with `MagnetSystemTypes_Edit` permission and open the 'Magnet System Types' list page. | The page loads and displays existing records. |
| 2 | Select a Standard Magnet System Type from the list and open its detail page. | The detail view opens with an Edit action available. |
| 3 | Click Edit, modify the Description field, and change the ERP Status field to a different value. | The Description and ERP Status fields accept the updated values. |
| 4 | Save the changes. | The detail page displays the updated Description and ERP Status values entered in Step 3. |
| 5 | Log out and log in as the user with `MagnetSystemTypes_View` permission only. Navigate to the same record. | The record detail page is displayed. No Edit button or editable fields are visible on the page. |

## Expected Outcome
A user with `MagnetSystemTypes_Edit` permission can edit and save changes to an existing Magnet System Type from the list workflow. A user with `MagnetSystemTypes_View` permission only can open the detail page but cannot edit any fields.
