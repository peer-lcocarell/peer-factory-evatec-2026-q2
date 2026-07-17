# R10.2 Update for CR 286067 - New Magnet System: Verify required fields are enforced before a new magnet system can be saved (Validation)

## Requirement

CR: 286067
Ticket: 35008
Requirement ID: 290765
Requirement: New Magnet System

## Metadata

- Priority: 1
- Automation Status: Not Automated

## Preconditions

- Tester is signed in with `MagnetSystem_Edit`.
- A valid Magnet System Type exists.

## Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'New Magnet System' form. | Form is displayed with required fields visible. |
| 2 | Attempt to save the form with no fields filled. | Save is blocked. Required field indicators are shown on all mandatory fields. |
| 3 | Select a Magnet System Type but leave serial number empty. | Save remains blocked. Serial number field shows a required indicator. |
| 4 | Enter a unique serial number. | All required field indicators clear. Save becomes available. |
| 5 | Save the form. | Magnet System is created with an auto-generated immutable MS number and the entered serial number in In Stock status. |

## Expected Outcome

Required fields are enforced before save. New Magnet System creation succeeds only after mandatory data is provided.
