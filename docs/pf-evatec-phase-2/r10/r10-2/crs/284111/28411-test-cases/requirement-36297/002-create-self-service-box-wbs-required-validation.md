# 'R10.2 Update for CR 284111' - 'Boxes': Self-Service Box - Edit Flow Work Order Change and WBS Persistence
## Requirement
CR: 284111
Ticket: 34682
Requirement: In edit flow, Self-Service behavior remains enforced and changing linked work order updates default WBS value.
## Preconditions
- User is signed in with `Boxes_Edit` and `Boxes_View` permissions.
- A non-self-service box exists and is editable.
- At least two active work orders/projects exist with different project numbers.
- User can open the target record in `Boxes > Edit Box` and navigate to `View Box`.
| Step | Action | Expected Result |
|------|----------|----------------|
| 1 | Open an existing non-self-service box in Edit mode and enable Self-Service. | WBS field appears and is required. |
| 2 | Verify initial default WBS value. | Default WBS corresponds to the currently linked work order project number. |
| 3 | Change linked work order to one with a different project number. | Default WBS updates to reflect the new work order project number pattern. |
| 4 | Save changes, open View page, then return to Edit page. | Self-Service and WBS values persist consistently across pages. |
## Expected Outcome
Edit flow correctly updates WBS defaults on work order change and persists consistent values across Edit and View.
