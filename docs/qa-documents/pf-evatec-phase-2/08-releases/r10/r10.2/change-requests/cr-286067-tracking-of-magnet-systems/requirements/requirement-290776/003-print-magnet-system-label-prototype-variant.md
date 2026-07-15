# R10.2 Update for CR 286067 - Print Magnet System Label: Verify the printed label includes the Prototype variant code for a Prototype Magnet System (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290776
Requirement: Print Magnet System Label (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` and `MagnetSystem_Edit` permissions.
- A Magnet System exists that is linked to a Prototype Magnet System Type with a known variant code (for example V01).
- A second Magnet System exists linked to a Standard Magnet System Type (no variant code).
- Print functionality is available in the environment.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the Standard Magnet System record and trigger the 'Print Label' action. Generate the label output. | The label is generated. The variant code section of the label is empty or absent (Standard types have no variant code). |
| 2 | Open the Prototype Magnet System record and trigger the 'Print Label' action. Generate the label output. | The label is generated. The variant code (for example `V01`) is visible on the label. |
| 3 | Compare the QR code on the Prototype label. | The QR code encodes the Magnet System Number (not the Article Number, not the variant code). |

## Expected Outcome
Labels printed for Standard Magnet Systems do not display a variant code. Labels printed for Prototype Magnet Systems display the correct variant code (V01, V02, etc.). In both cases, the QR code encodes the Magnet System Number.
