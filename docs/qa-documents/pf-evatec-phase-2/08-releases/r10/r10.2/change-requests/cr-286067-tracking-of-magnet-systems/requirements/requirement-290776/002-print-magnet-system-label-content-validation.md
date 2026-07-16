# R10.2 Update for CR 286067 - Print Magnet System Label: Verify printed label contains correct Magnet System information (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290776
Requirement: Print Magnet System Label (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- A Magnet System with known field values (Magnet System Number, Serial Number, Article Number, Article Name, Source Type, FlexiCat Type, Applications) exists.
- Print or preview functionality is available and accessible in the environment.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Note the known field values for the target Magnet System: Magnet System Number, Serial Number, Article Number, Article Name, Source Type, FlexiCat Type, and Applications. | Baseline values are captured. |
| 2 | Trigger the 'Print Label' action for the Magnet System. | The Print Label dialog or preview is displayed. |
| 3 | Generate the label output (print or preview). | Label output is produced. |
| 4 | Compare label content against known Magnet System values: Magnet System Number and Serial Number. | The label contains the correct Magnet System Number and Serial Number. |
| 5 | Verify additional label fields: Article Number, Article Name, Source Type, FlexiCat Type, and Applications. | Each field on the label matches the stored Magnet System data. |
| 6 | Validate QR code content. | The QR code encodes the Magnet System Number. |
| 7 | Verify variant code behavior. | For a Standard Magnet System: no variant code appears on the label. For a Prototype Magnet System: the variant code (V01, V02, etc.) is displayed on the label. |

## Expected Outcome
All label fields match stored Magnet System data. Magnet System Number, Serial Number, Article Number, Article Name, Source Type, FlexiCat Type, and Applications are present and correct. The QR code encodes the Magnet System Number. Prototype variant codes are shown only for Prototype types.
