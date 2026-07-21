# R10.2 Update for CR 286067 - Modify Magnet System: Verify prototype creation validation and variant code generation

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions

- User is signed in with `MagnetSystem_View`, `MagnetSystem_Edit`, `MagnetSystemType_Edit`, and `MagnetSystems_Modify` permissions.
- A Magnet System exists with status `Checked Out`.
- The Magnet System is linked to a Standard Magnet System Type.
- At least one existing Hardware Component Article Number is available for validation testing.

## Steps & Expected Results

| Step | Action | Expected Result |
|--------|--------|--------|
| 1 | Open the 'Magnet Systems' page and select a Magnet System with status `Checked Out` linked to a Standard Magnet System Type. | The Magnet System record opens and the `Modify` action is available. |
| 2 | Open the Magnet System with status `Checked Out` and trigger the `Modify` action. | The Modify workflow opens. An option to create a new Prototype Magnet System Type is available. |
| 3 | Select the option to create a new prototype variant. Leave the Article Number field empty and attempt to confirm. | Confirmation is blocked. A validation message is displayed for the required Article Number field. |
| 4 | Enter an Article Number that already exists as a Hardware Component and attempt to confirm. | Confirmation is blocked. A validation message indicates the Article Number must not match an existing Hardware Component. |
| 5 | Enter a valid unique Article Number and leave the Description field empty. Attempt to confirm. | Confirmation is blocked. A validation message is displayed for the required Description field. |
| 6 | Enter a valid unique Article Number and valid Description. Confirm the creation. | A Prototype Magnet System Type is created. Variant code `V01` is assigned. The Magnet System is linked to the new Prototype type. A modification history entry is created. |
| 7 | Open the newly created Prototype Magnet System Type. | The predecessor field references the original Standard Magnet System Type. |
| 8 | Review the Magnet System record. | The Magnet System references the `V01` Prototype Magnet System Type. The Last Inspection Date is updated to the current date. |
| 9 | Trigger the `Modify` action again on the same Magnet System. Select to create a new Prototype variant. Enter the same Article Number used for `V01` and a valid Description. Confirm. | A second Prototype Magnet System Type is created. Variant code `V02` is assigned. The Magnet System is linked to the `V02` Prototype type. A modification history entry is created. |
| 10 | Open the Magnet System Type history for the `V02` prototype. | Type history shows prototype creation linked to the original Standard source type with variant code `V02`. |
| 11 | Open the Magnet System Types list and locate both prototype records. | Both prototype types are present. One displays variant code `V01` and the other displays variant code `V02`. |
| 12 | Open the Magnet System History view. | History entries are present for both modification events with the current user and timestamp. |

## Expected Outcome

- Tester can create Prototype Magnet System Types from a Checked Out Magnet System.
- Required field validation is enforced.
- Duplicate Hardware Component Article Numbers are rejected when creating the initial prototype from a Standard type.
- Reusing the same Article Number for subsequent prototype versions in the same lineage is allowed.
- Prototype variants are generated sequentially as `V01`, `V02`, and higher values.
- Magnet System records, predecessor relationships, inspection dates, and history entries are updated correctly.
