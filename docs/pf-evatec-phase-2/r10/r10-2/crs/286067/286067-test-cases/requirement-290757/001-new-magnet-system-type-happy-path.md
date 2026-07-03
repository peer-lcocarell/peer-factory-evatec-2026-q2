# R10.2 Update for CR 286067 - New Magnet System Type: Verify tester can create a new magnet system type with valid data (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290757
Requirement: New Magnet System Type (Magnet System Types)

## Preconditions
- User is signed in with permission to create Magnet System Types.
- At least one Hardware Component (Article) eligible as a Magnet System Type source is available.
- Magnet System Types page is accessible.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open Magnet System Types and select New. | Select Article dialog is displayed (manual creation is not allowed). |
| 2 | Select a valid article number from Hardware Components. | Sourced fields (Article #, Name, ERP Status, Successor) populate. |
| 3 | Enter valid values for Source Type, FlexiCat Type, Application, and optional Description. | Fields accept input without validation errors. |
| 4 | Save the new Magnet System Type. | Save succeeds and record appears in Magnet System Types list. |

## Expected Outcome
Tester can create a new Magnet System Type sourced from a valid article with correct field behavior.
