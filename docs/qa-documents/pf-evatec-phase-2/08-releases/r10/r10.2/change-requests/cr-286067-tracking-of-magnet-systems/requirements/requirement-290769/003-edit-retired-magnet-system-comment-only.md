# R10.2 Update for CR 286067 - Edit Magnet System: Verify access control and navigation behavior for Edit Magnet System (Negative)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290769
Requirement: Edit Magnet System (Magnet Systems)

## Preconditions
- User A is signed in with `MagnetSystem_View` and `MagnetSystems_Edit` permissions.
- User B exists with `MagnetSystem_View` permission and without `MagnetSystems_Edit` permission.
- At least one editable Magnet System exists.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | As User A, open an existing Magnet System in Edit mode and make no field changes. | The Edit screen loads and Back is available in unchanged state. |
| 2 | Select Back. | User is redirected to the Magnet Systems screen. |
| 3 | Re-open the same record in Edit mode, modify an editable field, then select Cancel. | A confirmation prompt is displayed before leaving. |
| 4 | In the prompt, choose to return to editing. | User remains on Edit and unsaved changes are preserved. |
| 5 | Select Cancel again and confirm discard. | User is redirected to the previous screen without saving changes. |
| 6 | Re-open the record. | Discarded changes are not persisted. |
| 7 | Sign out and sign in as User B. Attempt Edit from list and direct Edit URL. | Edit access is blocked for User B in both entry paths. |

## Expected Outcome
Back works when no changes exist. Cancel with unsaved changes prompts for confirmation and supports return-to-edit or discard without persistence. Edit access is restricted to users with `MagnetSystems_Edit`, including direct URL access.
