# R10.2 Update for CR 286067 - Modify Magnet System: Verify tester can submit a modification request for a magnet system (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290773
Requirement: Modify Magnet System (Magnet Systems)

## Preconditions
- User is signed in with permission to modify Magnet Systems.
- A Magnet System exists in a state that supports modification.
- At least one existing prototype Magnet System Type is available, or the user can create a new prototype variant.

| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open a Magnet System and start the Modify action. | Modify workflow is displayed. |
| 2 | Choose to use an existing prototype or create a new prototype variant. | Selection is accepted. |
| 3 | Provide required modification details and confirm. | Modification is submitted successfully. |
| 4 | Verify the Magnet System reflects the new Magnet System Type. | Type change is persisted and history entry is created. |

## Expected Outcome
Tester can submit a modification request that updates the Magnet System's type according to prototype rules.
