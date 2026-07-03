# R10.2 Update for CR 286067 - Print Magnet System Label: Verify tester can generate and print a magnet system label (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290776
Requirement: Print Magnet System Label (Magnet Systems)

## Preconditions
- User is signed in with permission to print Magnet System labels.
- At least one Magnet System with valid data exists.
- Print functionality is available and configured in the environment.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open a Magnet System record. | Record details load successfully. |
| 2 | Trigger the Print Label action. | Print Label dialog is displayed. |
| 3 | Confirm the print action. | Label is generated for printing. |
| 4 | Verify the label output. | Printed label is produced without errors. |

## Expected Outcome
Tester can generate and print a Magnet System label successfully.
