# R10.2 Update for CR 286067 - Change Magnet System: Attempt to change a magnet system when no eligible replacement exists (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A tool has an installed Magnet System in the 'Hardware Configuration' page.
- No Magnet System with status `Checked Out` exists in the system (all Magnet Systems are either `In Stock`, `In Use`, `In Inspection`, or `Retired`).

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module. | Configuration loads and displays the currently installed Magnet System. |
| 2 | Trigger the 'Change Magnet System' action. | The Change Magnet System dialog opens. |
| 3 | Review the list of available replacement Magnet Systems. | The selection list is empty. No Magnet Systems are available for replacement. An informational message is displayed indicating no eligible Magnet Systems exist. |
| 4 | Close the dialog without making a selection. | The dialog closes. The existing Magnet System remains installed and unchanged in the Hardware Configuration. |

## Expected Outcome
When no Magnet System with status `Checked Out` exists, the Change Magnet System dialog displays an empty selection list with an informational message. The existing installed Magnet System is not changed.
