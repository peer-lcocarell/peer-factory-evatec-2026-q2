# R10.2 Update for CR 286067 - View Magnet System Type: Verify tester can view details of a magnet system type (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290759
Requirement: View Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with permission to view Magnet System Types.
- At least one Magnet System Type exists.
- Magnet System Types list is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open the Magnet System Types list. | Records are displayed. |
| 2 | Select an existing Magnet System Type. | View action is available. |
| 3 | Open the View page. | View screen loads with detailed information. |
| 4 | Verify displayed fields. | Fields (Article #, Name, ERP Status, Source Type, FlexiCat Type, Application, etc.) reflect saved values. |

## Expected Outcome
Tester can view a Magnet System Type's details and displayed data matches stored values.
