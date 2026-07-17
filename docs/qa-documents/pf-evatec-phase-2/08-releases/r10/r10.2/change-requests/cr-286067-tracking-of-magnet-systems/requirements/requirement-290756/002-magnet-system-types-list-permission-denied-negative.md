# R10.2 Update for CR 286067 - Magnet System Types: Attempt to view the Magnet System Types page without the required permission (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- A user account exists that does NOT have `MagnetSystemTypes_View` permission.
- The 'Magnet System Types' page URL or navigation path is known.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Log in as a user without the `MagnetSystemTypes_View` permission. | Login succeeds. |
| 2 | Check the Configuration navigation group. | The 'Magnet System Types' entry is hidden or disabled. |
| 3 | Attempt to navigate to the 'Magnet System Types' list page using the normal navigation path. | Access is denied. The list is not displayed. |
| 4 | Attempt direct URL navigation to the Magnet System Types list page. | Access is denied. The list page does not load. |
| 5 | Attempt direct URL navigation to a Magnet System Type detail page. | Access is denied. The detail page does not load. |

## Expected Outcome
A user without `MagnetSystemTypes_View` permission cannot access Magnet System Types through navigation or direct URLs. No list data or detail data is exposed.
