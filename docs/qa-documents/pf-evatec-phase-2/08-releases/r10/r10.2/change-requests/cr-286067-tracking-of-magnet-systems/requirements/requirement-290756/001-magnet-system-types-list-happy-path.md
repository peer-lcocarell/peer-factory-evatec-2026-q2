---
TestCaseId: 293115
PlanId: 291616
SuiteId: 292263
---

# R10.2 Update for CR 286067 - Magnet System Types: Verify tester can view the list of Magnet System Types (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemTypes_View` permission.
- At least one Magnet System Type record exists.
- The 'Magnet System Types' page is accessible.

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page. | The page loads. Existing Magnet System Type records are displayed in the list. |
| 2 | Observe the data displayed for each record in the list. | Each record displays the following fields: Article Number, Name, and ERP Status. |
| 3 | Review the column headers in the list. | The column headers Article Number, Name, and ERP Status are visible in the list header row. |
| 4 | Apply a filter on the Name column using a partial value from an existing record. | The list updates to display only records where the Name field contains the entered value. Records that do not match the filter value are not displayed. |

## Expected Outcome
The 'Magnet System Types' page loads and displays existing records. Applied filters reduce the displayed records to matching items only. The page is accessible to users with `MagnetSystemTypes_View` permission.
