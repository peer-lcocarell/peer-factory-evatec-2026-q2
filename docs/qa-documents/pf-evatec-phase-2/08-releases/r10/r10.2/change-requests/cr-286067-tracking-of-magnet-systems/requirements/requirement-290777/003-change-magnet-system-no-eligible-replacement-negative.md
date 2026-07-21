---
TestCaseId: 293926
PlanId: 291616
SuiteId: 292283
---

# R10.2 Update for CR 286067 - Change Magnet System: Verify only Checked Out Magnet Systems are eligible for installation and replacement (Unhappy Path)

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

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Hardware Configuration' page for Tool A and trigger the 'Change Magnet System' action. | The Change Magnet System dialog opens. |
| 2 | Review the replacement list, then close the dialog with no selection. | The list is empty, an informational message indicates no eligible Magnet System exists, and Tool A remains unchanged. |
| 3 | Open the 'Hardware Configuration' page for Tool B and select 'Install Magnet System' on the empty role slot. | The selection dialog opens and shows no eligible candidate. |
| 4 | Review the list for `In Stock` and other non-`Checked Out` statuses, then attempt to confirm install with no selection. | Magnet Systems with `In Stock`, `In Use`, `In Inspection`, and `Retired` status are not listed. Install is blocked and a validation or informational message is shown. |
| 5 | Close the dialog and refresh the page for Tool B. | The role slot remains empty and the Hardware Configuration remains unchanged after refresh. |
| 6 | Open Magnet System History and Logbook for Tool B. | No new install or change entries are present. |

## Expected Outcome
When no Magnet System with status `Checked Out` exists, both the Change and Install selection dialogs display an empty list. Magnet Systems in `In Stock`, `In Use`, `In Inspection`, and `Retired` status are not presented as eligible options in either dialog.
