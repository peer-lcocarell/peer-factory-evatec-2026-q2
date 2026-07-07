# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify a Standard Magnet System Type can be converted to a Prototype (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- At least one Standard Magnet System Type exists.
- The 'Magnet System Types' page is accessible.
- Assumption A09 applies (see assumptions.md): a unique Article Number is required when converting to Prototype.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and select a Standard Magnet System Type. | The Magnet System Type record is displayed. The type is identified as Standard. |
| 2 | Trigger the action to create a Prototype from the Standard type. | A dialog or form is displayed requiring a unique Article Number (External ID) for the Prototype. |
| 3 | Enter a unique Article Number that does not match any existing Hardware Component Article Number and confirm. | The Prototype Magnet System Type is created with variant code `V01`. The Standard type remains unchanged. |
| 4 | Open the 'Magnet System Types' page and locate both the original Standard type and the new Prototype. | Both types are visible. The Prototype is identified with variant code `V01` and the provided Article Number. The Standard type retains its original Article Number. |
| 5 | Open the Prototype Magnet System Type record and review the History view. | A history entry is present for the Prototype creation, including the source Standard type, the current user, and the timestamp. |

## Expected Outcome
A Standard Magnet System Type can be used to create a new Prototype Magnet System Type with variant code `V01` and a user-supplied unique Article Number. The original Standard type is not modified. The Prototype history records the creation event with source type lineage.
