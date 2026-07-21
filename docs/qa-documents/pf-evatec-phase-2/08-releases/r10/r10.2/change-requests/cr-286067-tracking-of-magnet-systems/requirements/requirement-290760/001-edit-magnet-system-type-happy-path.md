---
TestCaseId: 293893
PlanId: 291616
SuiteId: 292267
---

# 286067 Magnet System Types - Edit Magnet System Type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290760
Requirement: Edit Magnet System Type (Magnet System Types)

## Tags
- R10.2

## Preconditions
- User is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` permissions.
- At least one Standard Magnet System Type exists with known field values.
- The 'Magnet System Types' page is accessible from the application menu.

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page. | The list page loads and displays existing records. |
| 2 | Select a known Standard Magnet System Type and open it in Edit mode. | The Edit page loads with current field values populated. |
| 3 | Update an editable field such as Description or Applications with a new value. | The field accepts the new input without error. |
| 4 | Click Save. | The View Magnet System Type page for the updated record is displayed. |
| 5 | Re-open the same record. | The updated field value is displayed. Article Number, Name, and ERP Status display their original values. All other user-entered fields remain unchanged. |

## Expected Outcome
A user with edit permissions can update user-entered fields on a Standard Magnet System Type and save without errors. Updated values persist on re-open. ERP-sourced read-only fields are not modified by the edit operation.
