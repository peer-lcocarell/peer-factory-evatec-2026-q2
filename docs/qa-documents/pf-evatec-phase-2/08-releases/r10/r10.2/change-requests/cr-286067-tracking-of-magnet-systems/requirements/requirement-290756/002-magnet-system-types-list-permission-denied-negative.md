---
TestCaseId: 293888
PlanId: 291616
SuiteId: 292263
---

# R10.2 Update for CR 286067 - Magnet System Types: Attempt to view the Magnet System Types page without the required permission (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- A user account exists that does NOT have `MagnetSystemTypes_View` permission.
- The 'Magnet System Types' page URL or navigation path is known.

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Log in as a user without the `MagnetSystemTypes_View` permission. | Login succeeds. |
| 2 | Check the Configuration navigation group. | The 'Magnet System Types' entry is hidden or disabled. |
| 3 | Attempt to navigate to the 'Magnet System Types' list page using a saved bookmark or browser history entry. | The list page does not load. An access denied message or error page is displayed. |
| 4 | Attempt direct URL navigation to the Magnet System Types list page. | An access denied message or error page is displayed. No list data is visible. |
| 5 | Attempt direct URL navigation to a Magnet System Type detail page. | An access denied message or error page is displayed. No record data is visible. |

## Expected Outcome
A user without `MagnetSystemTypes_View` permission cannot access Magnet System Types through navigation or direct URLs. No list data or detail data is exposed.
