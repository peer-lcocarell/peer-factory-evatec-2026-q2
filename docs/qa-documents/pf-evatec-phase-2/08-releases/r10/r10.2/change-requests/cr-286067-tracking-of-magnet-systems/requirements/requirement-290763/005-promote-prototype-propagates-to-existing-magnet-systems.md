# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify existing Magnet Systems remain linked when a Prototype is promoted to Standard (Integration)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View`, `MagnetSystemType_Edit`, `MagnetSystem_View`, and `MagnetSystems_Modify` permissions.
- A Prototype Magnet System Type (V01 or later) exists.
- At least two Magnet Systems are linked to the Prototype Magnet System Type.
- The 'Magnet System Types' page and 'Magnet Systems' page are accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and identify the Prototype Magnet System Type. | The Prototype type is visible with its variant code and current Article Number. |
| 2 | Trigger the 'Define as Standard' action on the Prototype Magnet System Type and confirm using a valid ERP article number. | The ERP article selection dialog is shown. After confirmation, the dialog closes and the Magnet System Type record is displayed. |
| 3 | Reopen the promoted type and verify core field updates. | The type is now Standard, variant code is cleared, predecessor is removed, and no new type record is created. |
| 4 | Navigate to the 'Magnet Systems' page and open each previously linked Magnet System. | All previously linked Magnet Systems still reference the same type record now marked Standard. No reassignment to a different type occurred. |
| 5 | Review history on each previously linked Magnet System. | Each linked Magnet System contains a new defined as standard history entry for this operation. |
| 6 | Open the Magnet System Type History view and inspect the redefine entry details. | A define as standard entry is present with timestamp, user, selected article number, and assigned magnet systems count. Entry details list all Magnet Systems that were linked to the Prototype type at the time of the operation. |

## Expected Outcome
Promoting a Prototype Magnet System Type to Standard does not create a new type record. Variant code is cleared, predecessor is removed, and all assigned Magnet Systems remain linked to the same type. The type history includes the required define as standard summary and details, and each assigned Magnet System receives its own defined as standard history entry.
