# R10.2 Update for CR 286067 - Change Magnet System: Attempt to install a magnet system that is not in Checked Out status (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A tool module has an empty Magnet System role slot in its Hardware Configuration.
- At least one Magnet System exists with status `In Stock` (not `Checked Out`).
- No Magnet Systems with status `Checked Out` exist.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for the target tool module. | Configuration loads with the Magnet System role slot empty. |
| 2 | Trigger the 'Install Magnet System' action on the empty role slot. | The Magnet System selection dialog opens. |
| 3 | Attempt to find and select a Magnet System with status `In Stock`. | Magnet Systems with `In Stock` status are not listed in the selection dialog. Only `Checked Out` Magnet Systems are eligible. |
| 4 | Close the dialog without making a selection. | The dialog closes. The role slot remains empty and the Hardware Configuration is unchanged. |

## Expected Outcome
Magnet Systems that are not in `Checked Out` status cannot be selected for installation in Hardware Configuration. The install dialog filters to only `Checked Out` Magnet Systems. `In Stock`, `In Use`, `In Inspection`, and `Retired` Magnet Systems are not presented as options.
