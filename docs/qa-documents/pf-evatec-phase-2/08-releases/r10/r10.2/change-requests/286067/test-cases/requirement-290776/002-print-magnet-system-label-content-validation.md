# R10.2 Update for CR 286067 - Print Magnet System Label: Verify printed label contains correct magnet system information (Validation)

## Requirement

- CR: 286067
- Ticket: 35008
- Requirement ID: 290776
- Requirement: Print Magnet System Label (Magnet Systems)

## Preconditions

- User is signed in with permission to print Magnet System labels.
- A Magnet System with known field values (Serial Number, Magnet System Type, Status, etc.) exists.
- Print functionality is available and configured in the environment.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Note known field values for the target Magnet System, including Magnet System Number and Serial Number. | Baseline values are captured. |
| 2 | Trigger the Print Label action for the Magnet System. | Print Label dialog is displayed. |
| 3 | Generate the label output (print or preview). | Label output is produced successfully. |
| 4 | Compare label content with the known Magnet System values. | Label contains correct Magnet System Number, Serial Number, and expected identifying fields. |
| 5 | Validate QR code and prototype variant behavior. | QR code encodes Magnet System Number. Variant code is shown only when the Magnet System is a prototype. |

## Expected Outcome

Printed label content matches stored Magnet System data, including correct QR encoding and prototype variant display rules.
