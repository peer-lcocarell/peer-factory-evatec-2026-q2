# R10.2 Update for CR 286067 - Retire Magnet System: Verify retirement security permissions are enforced (Security)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290772
Requirement: Retire Magnet System (Magnet Systems)

## Preconditions
- A user account with `MagnetSystems_Remove` permission is available.
- A user account without `MagnetSystems_Remove` permission is available.
- At least one Magnet System with status `In Stock` exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in as a user with `MagnetSystems_Remove` permission. Open the 'Magnet Systems' page and select a Magnet System with status `In Stock`. | The Retire action is available for eligible Magnet Systems. |
| 2 | Sign out and sign in as a user without `MagnetSystems_Remove` permission. Open the 'Magnet Systems' page. | The Retire action is not visible or is disabled for all Magnet Systems. |
| 3 | Attempt to access retirement functionality directly (e.g., via direct URL or API call). | Access is denied. Retirement cannot be performed without the required permission. |

## Expected Outcome
Only users with `MagnetSystems_Remove` permission can access and execute the Retire action. Users without the permission cannot access or trigger retirement functionality by any means.
