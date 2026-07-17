# R10.2 Update for CR 286067 - Modify Magnet System: Verify Modify security permissions are enforced (Security)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions
- A user account with `MagnetSystems_Modify` permission is available.
- A user account without `MagnetSystems_Modify` permission is available.
- At least one Magnet System with status `Checked Out` exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in as a user with `MagnetSystems_Modify` permission. Open the 'Magnet Systems' page and select a Magnet System with status `Checked Out`. | The 'Modify' action is available. |
| 2 | Sign out and sign in as a user without `MagnetSystems_Modify` permission. Open the 'Magnet Systems' page and select a Magnet System with status `Checked Out`. | The 'Modify' action is not visible or is disabled. |
| 3 | Attempt to access the Modify functionality directly (e.g., via direct URL or API call). | Access is denied. Modification cannot be performed without the required permission. No modification is persisted. |

## Expected Outcome
Only users with `MagnetSystems_Modify` permission can access and execute the Modify action. Users without the permission cannot access or trigger modification functionality by any means.
