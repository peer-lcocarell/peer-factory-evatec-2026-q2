# R10.2 Update for CR 286067 - Print Magnet System Label: Verify tester can generate and print a Magnet System label (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290776
Requirement: Print Magnet System Label (Magnet Systems)

## Preconditions
- User is signed in with `MagnetSystem_View` permission.
- At least one Magnet System with valid data exists.
- At least one Magnet System with status `In Use` exists.
- At least one Magnet System with status `Retired` exists.
- Print or preview functionality is available and accessible in the environment.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open a Magnet System record. | Record details load. |
| 2 | Trigger the 'Print Label' action. | The Print Label dialog or preview is displayed. |
| 3 | Confirm or trigger the label generation. | The label is generated without errors. A print preview or print dialog is displayed. |
| 4 | Verify the label output is produced. | The label is generated and available for printing. No error messages are displayed. |
| 5 | Open a Magnet System with status `In Use` and trigger the 'Print Label' action. | The Print Label action is available. The label is generated without errors. |
| 6 | Open a Magnet System with status `Retired` and trigger the 'Print Label' action. | The Print Label action is available. The label is generated without errors. |

## Expected Outcome
The Print Label action on a Magnet System record generates a label for printing regardless of the Magnet System status. The label generation completes without errors and the label is presented for printing or preview.
