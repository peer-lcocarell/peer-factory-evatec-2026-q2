---
TestCaseId: 293898
PlanId: 291616
SuiteId: 292267
---

# 286067 Magnet System Types - Edit Magnet System Type Prevent Access Without Edit Permission (Negative Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290760
Requirement: Edit Magnet System Type (Magnet System Types)

## Tags
- R10.2

## Preconditions
- User is signed in with `MagnetSystemTypes_View` permission only.
- User does not have `MagnetSystemTypes_Edit` permission.
- At least one Magnet System Type record exists.
- The 'Magnet System Types' page is accessible from the application menu.

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page. | The list page loads and displays existing records. |
| 2 | Select a known Magnet System Type record. | The record is selectable. |
| 3 | Attempt to open the record in Edit mode. | The Edit action is not available. No Edit button or Edit action link is displayed for the selected record. |
| 4 | Attempt to navigate directly to the Edit URL for the record. | An access-denied error page is displayed. No editable fields are rendered. |

## Expected Outcome
A user without `MagnetSystemTypes_Edit` permission cannot access Edit mode. No Edit action is rendered. Direct URL navigation to the Edit page is blocked and returns an access-denied response.
