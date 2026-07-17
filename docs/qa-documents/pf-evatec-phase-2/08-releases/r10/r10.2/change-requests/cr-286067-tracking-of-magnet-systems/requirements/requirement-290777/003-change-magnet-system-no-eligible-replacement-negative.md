# R10.2 Update for CR 286067 - Change Magnet System: Verify only Checked Out Magnet Systems are eligible for installation and replacement (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- Tool A has a Magnet System currently installed in its Hardware Configuration.
- Tool B has an empty Magnet System role slot in its Hardware Configuration.
- No Magnet System with status `Checked Out` exists. At least one Magnet System with status `In Stock` exists.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for Tool A and trigger the 'Change Magnet System' action. | The Change Magnet System dialog opens. |
| 2 | Review the list of available replacement Magnet Systems. | The selection list is empty. No Magnet Systems are available for replacement. An informational message is displayed indicating no eligible Magnet Systems exist. |
| 3 | Close the dialog without making a selection. | The dialog closes. The installed Magnet System in Tool A remains unchanged. |
| 4 | Open the 'Hardware Configuration' page for Tool B and trigger the 'Install Magnet System' action on the empty role slot. | The Magnet System selection dialog opens. |
| 5 | Attempt to locate a Magnet System with status `In Stock` in the selection list. | Magnet Systems with `In Stock` status are not listed. The selection list contains only `Checked Out` Magnet Systems. Since none exist, the list is empty. |
| 6 | Attempt to confirm install with no candidate selected. | Install is blocked. A validation or informational message indicates no eligible `Checked Out` Magnet System is available. |
| 7 | Close the dialog without making a selection. | The dialog closes. The role slot in Tool B remains empty and the Hardware Configuration is unchanged. |
| 8 | Open Magnet System History and the tool Logbook for Tool B. | No new install or change entries were added. |

## Expected Outcome
When no Magnet System with status `Checked Out` exists, both the Change and Install selection dialogs display an empty list. Magnet Systems in `In Stock`, `In Use`, `In Inspection`, and `Retired` status are not presented as eligible options in either dialog.
