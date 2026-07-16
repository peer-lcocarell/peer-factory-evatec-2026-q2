# R10.2 Update for CR 286067 - Magnet System History: Verify distinct history entries are generated for every lifecycle event (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290771
Requirement: Magnet System History (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View`, `MagnetSystem_Edit`, `HardwareConfiguration_Edit`, and `HardwareConfiguration_View` permissions.
- A new Magnet System has just been created (status `In Stock`).
- A tool module with an empty Magnet System role slot is available.
- The 'Magnet System History' view is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System and navigate to the History view. | A Create history entry is present with the current user and timestamp. |
| 2 | Edit the Magnet System (for example update Last Inspection Date) and save. | Save completes. |
| 3 | Re-open History. | An Edit history entry is added. The history now contains two entries: Create and Edit. |
| 4 | Check out the Magnet System. | Checkout completes. Magnet System status is `Checked Out`. |
| 5 | Re-open History. | A Checkout history entry is added with the current user and timestamp. |
| 6 | Install the Magnet System into the tool module. | Install completes. Status changes to `In Use`. |
| 7 | Re-open History. | An Install history entry is added including the tool name and module identifier. |
| 8 | Uninstall the Magnet System from the tool module. | Uninstall completes. Status changes to `Checked Out`. |
| 9 | Re-open History. | An Uninstall history entry is added including the tool name and current user. |
| 10 | Return the Magnet System. | Return completes. Status changes to `In Stock`. |
| 11 | Re-open History. | A Return history entry is added. |
| 12 | Retire the Magnet System with a valid reason. | Retirement completes. Status changes to `Retired`. |
| 13 | Re-open History. | A Retire history entry is added including the retirement reason. The full history trail is: Create, Edit, Checkout, Install, Uninstall, Return, Retire — all in chronological order. |

## Expected Outcome
The Magnet System History view contains one distinct entry per lifecycle event. Events covered: Create, Edit, Checkout, Install (with tool name), Uninstall (with tool name), Return, and Retire (with reason). All entries include the acting user and timestamp. History entries are in chronological order and are not merged or deduplicated.
