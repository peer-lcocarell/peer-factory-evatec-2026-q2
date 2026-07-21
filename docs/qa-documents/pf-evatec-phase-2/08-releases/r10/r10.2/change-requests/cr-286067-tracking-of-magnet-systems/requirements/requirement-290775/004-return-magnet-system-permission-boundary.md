# R10.2 Update for CR 286067 - Return Magnet System: User without process permission cannot return Magnet System (Authorization)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290775
Requirement: Return Magnet System (Magnet Systems)

## Preconditions
- Test user A is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions but without `MagnetSystems_Process` permission.
- Test user B is signed in with `MagnetSystem_View`, `MagnetSystem_Edit`, and `MagnetSystems_Process` permissions.
- At least one Magnet System with status `Checked Out` exists.
- The 'Magnet Systems' list is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in as test user A and open the 'Magnet Systems' list. | The list loads and records are visible. |
| 2 | Select a Magnet System with status `Checked Out` and review available actions. | The Return action is not available to test user A. |
| 3 | Attempt direct navigation to return functionality for the same `Checked Out` Magnet System as test user A. | Access is denied. No return change is persisted. No Return history entry is created. |
| 4 | Sign out and sign in as test user B. Select the same `Checked Out` Magnet System and review actions. | The Return action is available to test user B. |
| 5 | Trigger and confirm Return as test user B. Re-open the Magnet System record. | The return completes. Status is `In Stock`. Location is empty. `Checked Out By` is empty. `Checked Out Timestamp` is empty. A Return history entry is present with test user B and timestamp. |

## Expected Outcome
Users without `MagnetSystems_Process` cannot perform Return through UI or direct navigation. Authorized users can perform Return and the expected data cleanup and history logging occur.
