# R10.2 Update for CR 286067 - Print Magnet System Label: Verify printed label contains correct Magnet System information (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290776
Requirement: Print Magnet System Label (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- A Magnet System with known field values (Magnet System Number, Serial Number, Magnet System Type Article Number) exists.
- Print or preview functionality is available and accessible in the environment.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Note the known field values for the target Magnet System: Magnet System Number and Serial Number. | Baseline values are captured. |
| 2 | Trigger the 'Print Label' action for the Magnet System. | The Print Label dialog or preview is displayed. |
| 3 | Generate the label output (print or preview). | Label output is produced. |
| 4 | Compare label content against known Magnet System values. | The label contains the correct Magnet System Number and Serial Number. |
| 5 | Validate QR code content. | The QR code encodes the Magnet System Number. |
| 6 | Verify variant code behavior. | For a Standard Magnet System: no variant code appears on the label. For a Prototype Magnet System: the variant code (V01, V02, etc.) is displayed on the label. |

## Expected Outcome
Label content matches stored Magnet System data. The Magnet System Number and Serial Number are present and correct. The QR code encodes the Magnet System Number. Prototype variant codes are shown only for Prototype types.
