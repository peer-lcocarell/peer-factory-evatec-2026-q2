# R10.2 Update for CR 286067 - Retire Magnet System: Attempt to retire a Magnet System that is currently In Use (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290772
Requirement: Retire Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System with status `In Use` exists (currently installed in a tool).
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and locate a Magnet System with status `In Use`. | The Magnet System is visible in the list with status `In Use`. |
| 2 | Select the `In Use` Magnet System and review the available actions. | The 'Retire' action is not available in the context actions for an `In Use` Magnet System. |
| 3 | Attempt to trigger the Retire action by any available means (context menu, action button). | The Retire action is not presented and cannot be triggered for a Magnet System in `In Use` status. |
| 4 | Attempt direct navigation to retirement functionality for the same `In Use` Magnet System. | Access is denied. No retirement change is persisted. No retirement history entry is created. |

## Expected Outcome
The Retire action is not available for Magnet Systems with status `In Use`. Only Magnet Systems in `In Stock` or `In Inspection` status can be retired. Direct access to retirement for an `In Use` Magnet System is denied. The `In Use` Magnet System remains unchanged.
