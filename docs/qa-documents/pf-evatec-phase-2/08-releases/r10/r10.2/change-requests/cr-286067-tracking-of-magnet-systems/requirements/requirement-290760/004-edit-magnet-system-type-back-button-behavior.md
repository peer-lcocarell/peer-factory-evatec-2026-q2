---
TestCaseId: 293896
PlanId: 291616
SuiteId: 292267
---

# 286067 Magnet System Types - Edit Magnet System Type Back Button Behavior (Validation)

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
| 3 | Without modifying any field, observe the buttons displayed on the Edit form. | The Back button is visible. The Cancel button is not visible. |
| 4 | Click the Back button. | The user is redirected to the Magnet System Types list. No confirmation prompt is displayed. |
| 5 | Re-open the same record in Edit mode and modify an editable field. | The field accepts the new input. The Cancel button becomes visible. The Back button is no longer visible. |

## Expected Outcome
The Back button is available only when no changes have been made. It redirects to the list without a confirmation prompt. Once changes are made the Back button is replaced by the Cancel button.
