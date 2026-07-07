# R10.2 Update for CR 286067 - Retire Magnet System: Verify retired Magnet Systems cannot be selected for new assignments (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290772
Requirement: Retire Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `HardwareConfiguration_Edit` permissions.
- At least one Magnet System with status `Retired` exists.
- A tool with a Magnet System role slot available for assignment exists.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module and trigger the Install or Change Magnet System action. | The Magnet System selection dialog opens. |
| 2 | Attempt to locate a `Retired` Magnet System in the selection list. | Retired Magnet Systems are not listed in the selection dialog. Only eligible `Checked Out` Magnet Systems are displayed. |
| 3 | Cancel the dialog. | The dialog closes. The Hardware Configuration is unchanged. |

## Expected Outcome
Retired Magnet Systems are excluded from the selection list in the Install and Change Magnet System dialogs. Only Magnet Systems with `Checked Out` status are available for installation or replacement. The Hardware Configuration is unaffected.
