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
| 3 | Select a valid `Checked Out` Magnet System and proceed (Next). | A confirmation screen is displayed showing the selected Magnet System details. An optional Comment field is available with a maximum length of 250 characters. |
| 4 | Enter an optional comment and confirm the replacement. | The replacement completes without error. |
| 5 | Verify the 'Hardware Configuration' page. | The replacement Magnet System is displayed as installed in the role slot with its identifier in `MS####` format as a link to the Magnet System details. The previously installed Magnet System is no longer shown. The Hardware Configuration version increments by one. |
| 6 | Open the previously installed Magnet System record. | The status is `Checked Out`. The Location field is empty. An `uninstalled` history entry is present with the tool name, user, and timestamp. |
| 7 | Open the newly installed Magnet System record. | The status is `In Use`. The Location field reflects the tool and module name. An `installed` history entry is present with the tool name, user, and timestamp. |

## Expected Outcome
The Change Magnet System action replaces the installed Magnet System with the selected `Checked Out` replacement after a confirmation screen. An optional comment can be entered. The previously installed Magnet System status returns to `Checked Out` with its Location cleared and an `uninstalled` history entry. The newly installed Magnet System status changes to `In Use` with its Location updated and an `installed` history entry. The Hardware Configuration version increments and the role slot displays an `MS####` link to the Magnet System details.
