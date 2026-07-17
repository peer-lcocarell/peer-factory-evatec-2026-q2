# R10.2 Update for CR 286067 - Change Magnet System: Verify tester can cancel Change Magnet System without modifying Hardware Configuration (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A tool module has a Magnet System currently installed in its Hardware Configuration.
- At least one replacement Magnet System with status `Checked Out` exists.
- The Hardware Configuration version number is noted.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module and trigger the 'Change Magnet System' action. | The Change Magnet System selection dialog opens. |
| 2 | Select Cancel from the selection dialog without choosing a replacement. | The dialog closes. The Hardware Configuration is unchanged. The installed Magnet System remains in the role slot. |
| 3 | Verify the Hardware Configuration version and installed Magnet System. | The version number is unchanged. The original Magnet System remains installed. |
| 4 | Trigger the 'Change Magnet System' action again. Select a `Checked Out` replacement and proceed to the confirmation screen. | The confirmation screen is displayed with the optional Comment field. |
| 5 | Select Cancel from the confirmation screen. | The dialog closes. The Hardware Configuration is unchanged. |
| 6 | Verify the Hardware Configuration version, installed Magnet System, and both Magnet System records. | The version number is unchanged. The original Magnet System remains installed with status `In Use`. The replacement Magnet System status remains `Checked Out`. No history entries have been added to either Magnet System. No Logbook entries have been added. |

## Expected Outcome
Cancelling from either the selection dialog or the confirmation screen leaves the Hardware Configuration, Magnet System statuses, Magnet System histories, and tool Logbook completely unchanged.
