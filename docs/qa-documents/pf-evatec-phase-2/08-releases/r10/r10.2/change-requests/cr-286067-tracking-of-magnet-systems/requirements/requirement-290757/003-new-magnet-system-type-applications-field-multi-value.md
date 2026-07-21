---
TestCaseId: 293472
PlanId: 291616
SuiteId: 292264
---

# R10.2 Update for CR 286067 - New Magnet System Type: Verify the Applications field accepts multiple predefined values

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- Tester is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` security rights.
- Predefined Application values exist in the system.
- A valid Hardware Component (ERP article) is available for Magnet System Type creation.
- The Magnet System Types page is accessible.

## Test Steps

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Open the Magnet System Types page, select New, and select a Hardware Component article number. | The New Magnet System Type form is displayed. The ERP-derived fields are populated. |
| 2 | Select two or more predefined values in the Applications field. | The Applications field displays each selected value simultaneously. |
| 3 | Type a value in the Applications field that is not in the predefined list. | The typed value is not added to the selection. Only predefined values remain available. |
| 4 | Enter values for Source Type and FlexiCat Type and select Save. | The View Magnet System Type page for the new record is displayed. |
| 5 | Review the Applications field on the View page. | All Application values selected in Step 2 are displayed. No additional or unexpected values are shown. |
| 6 | Select History. | One creation history entry is displayed with the current user name and a timestamp. |

## Expected Outcome
- The Applications field accepts multiple predefined values simultaneously.
- Custom values not in the predefined list are not accepted.
- Selected Application values persist after save and are visible on the View page.
- One creation history entry is recorded with the current user name and timestamp.
