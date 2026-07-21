---
TestCaseId: 293889
PlanId: 291616
SuiteId: 292263
---

# R10.2 Update for CR 286067 - Magnet System Types: Create New Magnet System Type

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemTypes_Edit` permission.
- The 'Magnet System Types' page is accessible from the Configuration navigation group.
- A valid ERP article is available that is not already used as a Target Type or Magnet System Type.

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Navigate to the 'Magnet System Types' list page via the Configuration navigation group. | The page loads and displays existing Magnet System Types. A 'New' or 'Create' action is visible. |
| 2 | Click the 'New' or 'Create' action from the list page. | A form is displayed for entering a new Magnet System Type. |
| 3 | Select a valid ERP article and enter valid values for all required fields: Name, Article #, Variant Code, Source Type, Flexicat Type, Applications, ERP Status, Successor, and Description. | All fields accept input without validation errors. |
| 4 | Save the new Magnet System Type. | The form closes. The new record detail page or the Magnet System Types list page is displayed. |
| 5 | Navigate to the Magnet System Types list page. | The new Magnet System Type appears in the list. The Name and Article Number match the values entered in Step 3. |

## Expected Outcome
A user with `MagnetSystemTypes_Edit` permission can create a new Magnet System Type from the list page. The record is persisted and visible in the list with the Name and Article Number values entered during creation.
