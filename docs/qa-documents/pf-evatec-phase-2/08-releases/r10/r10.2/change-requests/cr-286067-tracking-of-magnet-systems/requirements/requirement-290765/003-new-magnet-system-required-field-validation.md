# R10.2 Update for CR 286067 - New Magnet System: Verify required field validation is displayed when mandatory fields are empty during creation (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290765
Requirement: New Magnet System (Magnet Systems)

## Preconditions
- User A is signed in with `MagnetSystems_View` but without `MagnetSystems_Create`.
- User B is signed in with `MagnetSystems_View` and `MagnetSystems_Create`.
- A valid Magnet System Type exists for selection.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Sign in as User A and open the 'Magnet Systems' page. Attempt to access the 'New' action. | Access is blocked or action is hidden because `MagnetSystems_Create` is required. |
| 2 | Sign out and sign in as User B. Open 'New Magnet System'. | The creation screen loads for User B. |
| 3 | Leave Serial Number empty and Magnet System Type unselected. Attempt to save. | Save is blocked. Required validation appears for Serial Number and Magnet System Type. |
| 4 | Enter a unique Serial Number but leave Magnet System Type unselected. Attempt to save. | Save remains blocked. Magnet System Type required validation remains. Serial Number validation clears. |
| 5 | Select a valid Magnet System Type and clear Serial Number. Attempt to save. | Save remains blocked. Serial Number required validation appears. |
| 6 | Enter values in fields and select Cancel. In confirmation dialog choose No. | Creation form remains open and entered values are preserved so user can continue creating. |
| 7 | Select Cancel again and choose Yes in confirmation dialog. | User is redirected to Magnet Systems screen and no new Magnet System is created. |

## Expected Outcome
Access to New Magnet System requires `MagnetSystems_Create`. Required field validation blocks save when mandatory fields are empty. Cancel confirmation behaves correctly where No continues creation and Yes exits without creating a record.
