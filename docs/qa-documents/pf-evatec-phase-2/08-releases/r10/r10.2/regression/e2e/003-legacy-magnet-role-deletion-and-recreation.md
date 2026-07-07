# R10.2 Update for CR 286067 - Migration: Verify legacy Magnet System role can be deleted and the new Magnet System role created without data corruption in unrelated configuration (Regression)

## Requirement
CR: 286067
Ticket: 35008
Requirement IDs: 73354, 73375, 290777
Requirement: Legacy Magnet System Role Migration — Delete and Recreate (Migration Regression)

## Preconditions
- User is signed in with `ManageHardware_Edit`, `ManageHardware_View`, `HardwareConfiguration_View`, and `Logbook_View` permissions.
- A legacy Magnet System role exists in a module type Logbook configuration.
- The affected module type has at least two additional hardware roles that are not being migrated.
- An existing hardware configuration for a tool using this module type has historical Logbook entries.
- Assumption A06 applies (see assumptions.md): migration is manual.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open 'Manage Hardware' and navigate to the Logbook configuration for the affected module type. | The configuration page loads. The legacy Magnet System role and all other roles are displayed. |
| 2 | Record the full list of existing roles, role types, and serial number requirements. | Baseline is captured for all roles including non-Magnet System roles. |
| 3 | Delete only the legacy Magnet System role. | The legacy role is removed. Other roles remain unchanged. |
| 4 | Save the updated Logbook configuration. | Save completes without validation errors. |
| 5 | Verify non-Magnet System roles are unaffected. | All other roles display the same configuration as the baseline captured in Step 2. |
| 6 | Open the Hardware Configuration for a tool that uses this module type. | Hardware configuration for the tool loads. Only the legacy Magnet System role slot is removed. Other role slots are present and unchanged. |
| 7 | Review existing Logbook entries for the tool. | Historical Logbook entries for non-Magnet System events are present and intact. No unrelated entries are removed. |
| 8 | Return to 'Manage Hardware' and add a new role of type 'Magnet System' with a unique role name. | The new Magnet System role is added to the configuration. The 'Requires Serial Number' value is set to `Yes` and cannot be edited. |
| 9 | Save and re-open the Logbook configuration. | The new Magnet System role persists with the correct role type and serial number settings. Non-Magnet System roles remain unchanged. |

## Expected Outcome
Deleting the legacy Magnet System role and creating the new Magnet System role does not affect other role configurations, existing Logbook history, or hardware configuration data for unrelated roles. The new Magnet System role is saved with `Requires Serial Number` locked to `Yes`.
