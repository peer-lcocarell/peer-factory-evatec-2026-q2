# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify access requires MagnetSystems_Modify security right (Authorization)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User A exists with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions but without `MagnetSystems_Modify`.
- User B exists with `MagnetSystemType_View`, `MagnetSystemType_Edit`, and `MagnetSystems_Modify` permissions.
- A Prototype Magnet System Type exists for test execution.
- The 'Magnet System Types' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in as User A and open a Prototype Magnet System Type. | The record is visible but 'Define as Standard' is not present or is disabled in the UI. |
| 2 | Attempt to trigger redefine as standard through available UI entry points. | No redefine action is initiated and the Magnet System Type record remains unchanged. |
| 3 | Sign out and sign in as User B. Open the same Prototype Magnet System Type. | 'Define as Standard' is available for User B. |
| 4 | Trigger 'Define as Standard' and cancel the dialog. | The 'Define as Standard' dialog or ERP article selection prompt opens. The dialog closes and the Magnet System Type record is displayed unchanged. |

## Expected Outcome
Access to define as standard is restricted to users with `MagnetSystems_Modify`. Users without this right cannot execute the workflow. Users with the right can access the workflow successfully.
