# R10.2 Update for CR 286067 - End-to-End: Verify full lifecycle from existing hardware component to magnet system install and logbook entry (Happy Path)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirements: 290757, 290765, 290777, 217766, 290771, 73375
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`, `MagnetSystem_Edit`, `HardwareConfiguration_Edit`, `ManageHardware_Edit`, `Logbook_View`.
- A hardware component exists in ERP that is not yet used as a Target Type or Magnet System Type.
- A module exists with a Magnet System role configured.
- A valid user and tool are available for checkout.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and create a new type using the available hardware component ERP article. | Magnet System Type is created with status Standard and the hardware component article is no longer available for Target Type or Magnet System Type creation. |
| 2 | Open the 'Magnet Systems' page and create a new magnet system using the type created in step 1. Enter a unique serial number. | Magnet System is created with an immutable MS number, the entered serial number, and status In Stock. |
| 3 | Open the new magnet system detail page and click 'Check Out'. Select a user and a tool. Confirm the checkout. | Status remains and a checkout history entry is recorded with timestamp, actor, selected user, and selected tool. |
| 4 | Open the module 'Hardware Configuration' page and start the install action for the Magnet System role slot. Select the checked-out magnet system. | Magnet System is installed. Module hardware configuration reflects the installed magnet system with serial number and type name. |
| 5 | Open the magnet system history. | A distinct install entry exists with timestamp, actor, module name, and tool name. |
| 6 | Open the tool logbook. | A Magnet System install entry exists in the logbook with timestamp, actor, magnet system number, and serial number. |
| 7 | Export the hardware configuration for the module. | Exported file contains the magnet system article number, serial number, and type name. |
