# R10.2 Update for CR 286067 - Modify Magnet System: Verify prototype creation field rules and cancellation behavior (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View`, `MagnetSystem_Edit`, and `MagnetSystemType_Edit` permissions.
- A Magnet System in `Checked Out` status exists and is linked to a Standard Magnet System Type.
- A Magnet System in `Checked Out` status exists and is already linked to a Prototype Magnet System Type.
- The 'Magnet Systems' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Magnet System linked to a Prototype type and trigger the 'Modify' action. | The Modify workflow opens. The current Prototype Magnet System Type is selected by default in the existing prototype list. |
| 2 | On the prototype selection screen, select Cancel. | The dialog closes. The Magnet System is unchanged. No history entry is created. |
| 3 | Open the Magnet System linked to a Standard type. Trigger the 'Modify' action and navigate to the new prototype creation screen. | The prototype creation form is displayed with Article #, Description, and Applications fields. |
| 4 | Review the Name, Source Type, and FlexiCat Type fields on the creation form. | Name, Source Type, and FlexiCat Type are inherited from the current Magnet System Type and are read-only. |
| 5 | Review the Applications field. | Applications is inherited from the current Magnet System Type and is editable. |
| 6 | Enter a value that exceeds 60 characters in the Article Number field and attempt to confirm. | Input is limited to 60 characters or a validation message is displayed. Confirmation is blocked. |
| 7 | Enter a value that exceeds 500 characters in the Description field and attempt to confirm. | Input is limited to 500 characters or a validation message is displayed. Confirmation is blocked. |
| 8 | Enter a valid Article Number (max 60 characters, not a Hardware Component) and a valid Description (max 500 characters). Select Cancel from the creation screen. | The dialog closes. The Magnet System is unchanged. No history entry is created. |

## Expected Outcome
If the Magnet System is already a prototype, the existing prototype is pre-selected by default. Cancel at either the selection screen or the creation screen leaves the Magnet System unchanged with no history entry written. Name, Source Type, and FlexiCat Type are read-only on the creation form. Applications is inherited and editable. Article Number is limited to 60 characters. Description is limited to 500 characters.
