# R10.2 Update for CR 286067 - Change Magnet System: Verify hardware configuration history reflects the magnet system change (Regression)

## Requirement

- CR: 286067
- Ticket: 35008
- Requirement ID: 290777
- Requirement: Change Magnet System (Tool Hardware Configuration)

## Preconditions

- User is signed in with permissions to view/edit Hardware Configuration, view Logbook, and view Magnet System History.
- A tool has an installed Magnet System that can be replaced.
- Hardware Configuration History and Logbook views are accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Note current Hardware Configuration History, Logbook, and Magnet System History entries. | Baseline is captured. |
| 2 | Perform a Change Magnet System action within Tool Hardware Configuration. | Change is completed successfully. |
| 3 | Open Hardware Configuration History for the tool. | New history entry reflects the Magnet System change with correct before/after. |
| 4 | Open Logbook and Magnet System History views. | Corresponding install/uninstall entries exist for both Magnet Systems and remain synchronized with the configuration change. |

## Expected Outcome

Hardware Configuration History, Logbook, and Magnet System History remain synchronized and accurately represent the before/after magnet replacement.
