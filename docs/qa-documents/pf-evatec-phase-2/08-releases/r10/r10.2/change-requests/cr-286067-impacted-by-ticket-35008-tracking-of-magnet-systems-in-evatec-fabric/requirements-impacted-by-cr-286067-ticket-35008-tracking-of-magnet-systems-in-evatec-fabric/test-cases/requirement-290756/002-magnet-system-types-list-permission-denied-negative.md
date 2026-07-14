# R10.2 Update for CR 286067 - Magnet System Types: Attempt to view the Magnet System Types page without the required permission (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- A user account exists that does NOT have `MagnetSystemType_View` permission.
- The 'Magnet System Types' page URL or navigation path is known.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Log in as a user without the `MagnetSystemType_View` permission. | Login succeeds. |
| 2 | Navigate to the 'Magnet System Types' page. | Access is denied. Either the page is not visible in the navigation menu, or an access-denied message is displayed. The list of Magnet System Types is not visible. |

## Expected Outcome
A user without `MagnetSystemType_View` permission cannot access the 'Magnet System Types' page. The page is not rendered and no Magnet System Type records are exposed.
