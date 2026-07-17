# R10.2 Update for CR 286067 - End-to-End: Verify legacy magnet system role deletion does not affect other module roles and associations are recreatable (Migration Regression)

## Metadata

- CR: 286067
- Ticket: 35008
- Requirements: 73354, 73375, 290777
- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `ManageHardware_Edit`, `HardwareConfiguration_Edit`, `MagnetSystem_Edit`.
- A module has multiple hardware component roles including a legacy Magnet Systems role and at least one other role.
- Learned associations exist for the legacy Magnet Systems role.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Record all existing roles and learned associations on the module. | Roles and associations are visible and recorded. |
| 2 | Delete the legacy Magnet Systems hardware component role. | Only the Magnet Systems role is removed. All other roles remain unchanged. |
| 3 | Verify learned associations for the deleted role are cleared. | Associations for the deleted role no longer appear. Associations for other roles are unaffected. |
| 4 | Add a new Magnet System role using the new role type. | New Magnet System role is created with Requires Serial Number locked to Yes and no pre-existing associations. |
| 5 | Add associations to the new Magnet System role. | Associations are saved and visible on the role. |
| 6 | Verify all other original roles remain intact with their original associations. | No unintended changes to other roles or associations. |
