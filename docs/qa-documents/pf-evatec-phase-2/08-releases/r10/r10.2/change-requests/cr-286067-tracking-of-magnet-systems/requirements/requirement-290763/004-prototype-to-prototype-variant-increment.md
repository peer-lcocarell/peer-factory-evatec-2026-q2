# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify user can cancel redefine flow without changes (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View`, `MagnetSystemType_Edit`, `MagnetSystem_View`, and `MagnetSystems_Modify` permissions.
- A Prototype Magnet System Type exists with known baseline values for article number, predecessor, and variant code.
- At least one Magnet System is assigned to the Prototype Magnet System Type.
- The 'Magnet System Types' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and select a Prototype Magnet System Type. Record baseline values for article number, predecessor, and variant code. | The article number, predecessor, and variant code values are displayed on the record. |
| 2 | Trigger the 'Define as Standard' action. | ERP article selection prompt opens. |
| 3 | Choose an ERP article value but select Cancel instead of Confirm. | The dialog closes and the Magnet System Type record or list is displayed. |
| 4 | Reopen and refresh the same Magnet System Type. | Article number, predecessor, and variant code remain unchanged from baseline values. |
| 5 | Open Magnet System Type history and assigned Magnet System records. | No new define as standard history entry exists on the type and no new defined as standard history entries are added to assigned Magnet Systems. |

## Expected Outcome
Users can cancel redefine as standard at any point without committing changes. The Magnet System Type and all assigned Magnet Systems remain unchanged when cancel is used.
