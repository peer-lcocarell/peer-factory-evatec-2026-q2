# R10.2 Update for CR 286067 - Change Magnet System: Verify HardwareConfiguration_Edit security permissions are enforced (Security)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- A user account with `HardwareConfiguration_Edit` permission is available.
- A user account without `HardwareConfiguration_Edit` permission is available.
- A tool module has a Magnet System currently installed in its Hardware Configuration.
- At least one replacement Magnet System with status `Checked Out` exists.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in as a user with `HardwareConfiguration_Edit` permission. Open the 'Hardware Configuration' page for the target tool module. | The Change Magnet System action is available. |
| 2 | Sign out and sign in as a user without `HardwareConfiguration_Edit` permission. Open the same 'Hardware Configuration' page. | The page loads. The Change Magnet System action is not visible or is disabled. |
| 3 | Attempt to access the Change Magnet System functionality directly (e.g., via direct URL or API call). | Access is denied. The change operation cannot be performed without the required permission. |

## Expected Outcome
Only users with `HardwareConfiguration_Edit` permission can access and execute the Change Magnet System action. Users without the permission cannot access or trigger the functionality by any means.
