# R10.2 Update for CR 286067 - End-to-End: Verify migration of existing legacy hardware component role to new magnet system model (Migration)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirements: 290757, 290765, 290777, 290771, 73354
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystemType_Edit`, `MagnetSystem_Edit`, `ManageHardware_Edit`, `HardwareConfiguration_Edit`, `Logbook_View`.
- A legacy hardware component role named Magnet Systems exists and is installed in a tool.
- Serial number data exists for the legacy role.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Navigate to the relevant module 'Hardware Configuration' and record the existing legacy Magnet System role name, installed hardware component, and serial number. | Existing role details are visible and recorded. |
| 2 | Delete the existing legacy Magnet System hardware component role. | Role is removed from the module configuration. No other roles are affected. |
| 3 | Create a new Magnet System role on the module using the new Magnet System role type. | New role is created with Requires Serial Number locked to Yes. |
| 4 | Create a Magnet System Type from the hardware component ERP article that matches the legacy component. | Magnet System Type is created as Standard. |
| 5 | Create a new Magnet System using the new type and enter the original serial number. | Magnet System is created in In Stock status with the entered serial number. |
| 6 | Check out the new magnet system and install it in the module via 'Hardware Configuration'. | Magnet System is installed. Module reflects the new magnet system with correct serial number. |
| 7 | Open the magnet system history. | Checkout and install entries exist with correct timestamps and actor. |
| 8 | Open the tool logbook. | A Magnet System install entry exists referencing the new magnet system number and serial number. |
