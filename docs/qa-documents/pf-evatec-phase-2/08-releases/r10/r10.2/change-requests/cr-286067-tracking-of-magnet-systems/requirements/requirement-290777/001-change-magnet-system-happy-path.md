# R10.2 Update for CR 286067 - Change Magnet System: Verify tester can replace an installed Magnet System within Tool Hardware Configuration (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A tool module has a Magnet System currently installed in its Hardware Configuration.
- At least one replacement Magnet System with status `Checked Out` exists and is not currently installed in any tool.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module. | Configuration loads and displays the currently installed Magnet System. |
| 2 | Trigger the 'Change Magnet System' action. | The Change Magnet System dialog opens. Only Magnet Systems with status `Checked Out` are displayed as eligible replacements. |
| 3 | Select a valid `Checked Out` Magnet System and confirm the replacement. | The replacement completes. |
| 4 | Verify the 'Hardware Configuration' page. | The replacement Magnet System is displayed as installed. The previously installed Magnet System is no longer shown in the role slot. The Hardware Configuration version increments by one. |
| 5 | Verify the status of both Magnet Systems. | The newly installed Magnet System status is `In Use`. The previously installed Magnet System status returns to `Checked Out`. |

## Expected Outcome
The Change Magnet System action replaces the installed Magnet System with the selected `Checked Out` replacement. The newly installed Magnet System status changes to `In Use`. The previously installed Magnet System status returns to `Checked Out`. The Hardware Configuration version increments.
