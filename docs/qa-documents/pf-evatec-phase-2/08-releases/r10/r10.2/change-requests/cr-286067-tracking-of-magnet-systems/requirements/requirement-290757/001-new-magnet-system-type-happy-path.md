---
TestCaseId: 293470
PlanId: 291616
SuiteId: 292264
---

# R10.2 Update for CR 286067 - New Magnet System Type: Verify tester can create a new Magnet System Type with valid data

## Requirement
- CR: 286067
- Ticket: 35008
- Requirement ID: 290757
- Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- Tester is signed in with `MagnetSystemTypes_View` and `MagnetSystemTypes_Edit` security rights.
- At least one Hardware Component (ERP article) that is not already assigned as a Target Type or Magnet System Type is available.
- The Magnet System Types page is accessible.

## Test Steps

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Open the Magnet System Types page and select New. | The article selector dialog is displayed. Only ERP article selection is available. Manual creation is not available. |
| 2 | Select an available Hardware Component article number from the selector. | The Article #, Name, ERP Status, and Successor fields are populated. Clicking any of these fields does not activate an input control. |
| 3 | Select a value for Source Type, select a value for FlexiCat Type, select one or more values for Applications, and enter a value in the Description field. | The Source Type, FlexiCat Type, and Applications fields display the selected values. The Description field displays the entered text. No validation errors are shown. |
| 4 | Select Save. | The View Magnet System Type page for the new record is displayed. The Source Type, FlexiCat Type, Applications, and Description values match those entered in Step 3. |
| 5 | Select History on the record. | One creation history entry is displayed with the current user name and a timestamp. |

## Expected Outcome
- A new Magnet System Type is created from an available ERP Hardware Component.
- ERP-derived fields (Article #, Name, ERP Status, Successor) are read-only and do not accept input during creation.
- Source Type, FlexiCat Type, and Applications accept input without validation errors.
- The tester is redirected to the View Magnet System Type page after saving.
- One creation history entry is recorded with the current user name and timestamp.
