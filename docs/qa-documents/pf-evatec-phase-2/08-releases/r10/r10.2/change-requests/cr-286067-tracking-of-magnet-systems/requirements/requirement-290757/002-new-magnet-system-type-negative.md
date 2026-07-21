---
TestCaseId: 293471
PlanId: 291616
SuiteId: 292264
---

# R10.2 Update for CR 286067 - New Magnet System Type: Verify required field validation is displayed during creation

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- Tester is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` security rights.
- The Magnet System Types page is accessible.
- A valid ERP article is available for selection.

## Test Steps

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Open the Magnet System Types page, select New, and select a Hardware Component article number. | The New Magnet System Type form is displayed. The Article #, Name, ERP Status, and Successor fields are populated and read-only. |
| 2 | Leave Source Type empty and select Save. | Save is blocked. A validation message indicating Source Type is required is displayed. |
| 3 | Enter a value in Source Type. Leave FlexiCat Type empty and select Save. | Save is blocked. A validation message indicating FlexiCat Type is required is displayed. |
| 4 | Enter a value in FlexiCat Type. Leave Applications empty and select Save. | Save is blocked. A validation message indicating Applications is required is displayed. |
| 5 | Select one or more values for Applications and select Save. | The validation messages are no longer displayed. The View Magnet System Type page for the new record is displayed. |

## Expected Outcome
- Save is blocked when Source Type, FlexiCat Type, or Applications is empty.
- A validation message identifying the missing required field is displayed on each blocked save attempt.
- After all required fields are populated, the tester is redirected to the View Magnet System Type page.
