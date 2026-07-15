# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify only one standard Magnet System Type exists after update (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- One Magnet System Type is currently marked as Standard.
- At least one additional non-Standard Magnet System Type exists.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' list and identify the current Standard record. | The current Standard Magnet System Type is identified. |
| 2 | Select a different Magnet System Type and trigger the 'Define as Standard' action. Confirm. | The action completes. |
| 3 | Refresh the 'Magnet System Types' list. | The newly selected record is marked as Standard. The previously Standard record is no longer marked as Standard. |
| 4 | Count the number of Standard Magnet System Types in the list. | Exactly one Magnet System Type is marked as Standard. |

## Expected Outcome
After defining a new Magnet System Type as Standard, exactly one record is marked as Standard. The previous Standard record loses the Standard flag. The uniqueness of the Standard designation is enforced.
