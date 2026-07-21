---
TestCaseId: 293929
PlanId: 291616
SuiteId: 292283
---

# R10.2 Update for CR 286067 - Change Magnet System: Verify HardwareConfiguration_Edit security permissions

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

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in as a user with `HardwareConfiguration_Edit` permission and open the 'Hardware Configuration' page for the target tool module. | The Change Magnet System action is visible and enabled. |
| 2 | Sign out, sign in as a user without `HardwareConfiguration_Edit` permission, and open the same page. | The page loads and the Change Magnet System action is hidden or disabled. |
| 3 | Attempt direct access to the Change Magnet System operation by URL or API as the user without edit permission. | Access is denied with an authorization response and no Hardware Configuration change is saved. |

## Expected Outcome
Only users with `HardwareConfiguration_Edit` permission can access and execute the Change Magnet System action. Users without the permission cannot access or trigger the functionality by any means.
