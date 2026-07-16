# R10.2 Update for CR 286067 - View Magnet System: Verify action button visibility on View screen matches user permissions

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290767
Requirement: View Magnet System (Magnet Systems)

## Preconditions
- An active Magnet System exists with status `In Stock`.
- A checked-out active Magnet System exists with status `In Use`.
- A prototype active Magnet System exists.
- Test users are available for each permission scenario below.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in with `MagnetSystem_View` only. Open the View page for an active Magnet System. | The Edit, Modify, Checkout, and Retire action buttons are not displayed. Copy URL and Print Label are available. |
| 2 | Sign in with `MagnetSystem_View` and `MagnetSystem_Edit`. Open the View page for an active Magnet System. | The Edit action button is displayed. |
| 3 | Sign in with `MagnetSystem_View` and `MagnetSystem_Modify`. Open the View page for an active Magnet System. | The Modify action button is displayed. |
| 4 | Sign in with `MagnetSystem_View` and `MagnetSystem_Modify`. Open the View page for an active prototype Magnet System. | The Define as Standard action button is displayed in addition to the Modify button. |
| 5 | Sign in with `MagnetSystem_View` and `MagnetSystem_Process`. Open the View page for an active Magnet System with status `In Stock`. | The Checkout action button is displayed. The Return action is not displayed. |
| 6 | Sign in with `MagnetSystem_View` and `MagnetSystem_Process`. Open the View page for an active Magnet System with status `In Use` (checked out). | The Return action button is displayed. The Checkout action is not displayed. |
| 7 | Sign in with `MagnetSystem_View` and `MagnetSystem_Remove`. Open the View page for an active Magnet System. | The Retire action button is displayed. |

## Expected Outcome
Action buttons on the View screen are shown only to users with the corresponding permission. Users with View-only permission see no action buttons other than Copy URL and Print Label. Each permission grants visibility of its associated action only. Checkout and Return are mutually exclusive based on checked-out status.
