# R10.2 Update for CR 286067 - Retire Magnet System: Verify retirement is blocked when no reason is provided (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290772
Requirement: Retire Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- At least one Magnet System with status `In Stock` exists.
- The 'Magnet Systems' page is accessible.
- Assumption A03 applies (see assumptions.md): Retire requires a mandatory reason.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet Systems' page and select a Magnet System with status `In Stock`. | The Magnet System record is accessible. |
| 2 | Trigger the 'Retire' action. | The Retire confirmation dialog opens. A mandatory reason field is displayed. Confirm action is disabled until a reason is entered. |
| 3 | Leave the reason field empty and attempt to confirm the retirement. | Retirement is blocked. A required-field validation message is displayed on the reason field. Confirm action remains disabled. The Magnet System status remains `In Stock`. |
| 4 | Enter a valid reason in the reason field. | Validation clears and confirm action becomes enabled. |
| 5 | Confirm the retirement. | Retirement completes. The Magnet System status changes to `Retired`. |
| 6 | Open the Magnet System History view. | A retirement history entry is present containing the reason provided, the current user, and the timestamp. |

## Expected Outcome
The Retire action requires a non-empty reason before confirmation is accepted. Submitting without a reason displays a validation error and leaves the Magnet System in `In Stock` status. Providing a valid reason completes the retirement, sets the status to `Retired`, and writes a history entry that includes the reason.
