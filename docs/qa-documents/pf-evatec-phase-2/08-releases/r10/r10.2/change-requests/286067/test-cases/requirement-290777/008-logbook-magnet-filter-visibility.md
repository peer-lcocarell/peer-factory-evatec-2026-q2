# R10.2 Update for CR 286067 - Change Magnet System: Verify the Magnet System filter category is visible and functional in the tool Logbook (Integration)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290777
Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions
- User is signed in with `HardwareConfiguration_View`, `HardwareConfiguration_Edit`, and `Logbook_View` permissions.
- A tool with a history of Magnet System install and uninstall events exists.
- The Logbook for the target tool is accessible.
- Other Logbook entry types (non-Magnet System) also exist in the tool Logbook.
- Assumption A11 applies (see assumptions.md): a new Magnet System filter category is expected.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Navigate to the 'Logbook' for the target tool. | Logbook loads showing all categories of entries. |
| 2 | Locate and apply the Magnet System filter/category. | A filter option named 'Magnet System' (or equivalent) is visible in the Logbook filter controls. |
| 3 | Apply the Magnet System filter. | Only Logbook entries related to Magnet System events (install, uninstall, change) are displayed. Non-Magnet System entries are hidden. |
| 4 | Remove the Magnet System filter. | All Logbook entries are displayed again, including both Magnet System and non-Magnet System entries. |
| 5 | Apply a non-Magnet System filter. | Magnet System events are hidden. Other entry types appear as expected. |

## Expected Outcome
The Logbook for a tool displays a Magnet System filter category. Applying the filter shows only Magnet System-related events. Removing the filter restores the full Logbook view. Magnet System entries and non-Magnet System entries do not interfere with each other's filter behavior.
