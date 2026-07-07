# R10.2 Update for CR 286067 - Change Magnet System: Verify tester can replace an installed magnet system within Tool Hardware Configuration (Happy Path)

## Requirement

- CR: 286067
- Ticket: 35008
- Requirement ID: 290777
- Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions

- User is signed in with `HardwareConfiguration_View` and `HardwareConfiguration_Edit` permissions.
- A tool has an installed Magnet System in Hardware Configuration.
- At least one replacement Magnet System with status `Checked Out` exists and is not currently installed.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Tool Hardware Configuration for the target tool/module. | Configuration displays the installed Magnet System. |
| 2 | Trigger the Change Magnet System action. | Change dialog is displayed and only eligible `Checked Out` Magnet Systems are shown. |
| 3 | Select a valid replacement Magnet System and confirm. | Replacement action completes successfully. |
| 4 | Verify the installed Magnet System is updated in the configuration. | New Magnet System is shown as installed and the previous Magnet System is uninstalled and returned to `Checked Out`. |

## Expected Outcome

Tester can replace an installed Magnet System in Tool Hardware Configuration, and state transitions are applied correctly for both old and new items.
