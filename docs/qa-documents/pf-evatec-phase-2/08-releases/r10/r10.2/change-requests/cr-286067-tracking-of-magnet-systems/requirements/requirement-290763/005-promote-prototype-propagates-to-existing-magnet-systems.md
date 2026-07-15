# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify existing Magnet Systems remain linked when a Prototype is promoted to Standard (Integration)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View`, `MagnetSystemType_Edit`, and `MagnetSystem_View` permissions.
- A Prototype Magnet System Type (V01 or later) exists.
- At least two Magnet Systems are linked to the Prototype Magnet System Type.
- The 'Magnet System Types' page and 'Magnet Systems' page are accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and identify the Prototype Magnet System Type. | The Prototype type is visible with its variant code and current Article Number. |
| 2 | Note the Magnet Systems linked to this Prototype type. | At least two Magnet Systems reference this Prototype type. |
| 3 | Trigger the 'Define as Standard' action on the Prototype Magnet System Type. | The promotion dialog or confirmation is displayed. |
| 4 | Confirm the promotion. | The Prototype type is promoted to Standard. The variant code is removed. The type is no longer displayed as a Prototype. No new type record is created. |
| 5 | Navigate to the 'Magnet Systems' page and open each of the previously linked Magnet Systems. | All previously linked Magnet Systems still reference the same Magnet System Type (now Standard). No Magnet System has been reassigned to a different type. |
| 6 | Open the Magnet System Type History view. | A history entry is present for the promotion event with the current user and timestamp. A propagation or update history note is visible. |

## Expected Outcome
Promoting a Prototype Magnet System Type to Standard does not create a new type record. All Magnet Systems that referenced the Prototype remain linked to the same type after promotion. The type's history records the promotion event.
