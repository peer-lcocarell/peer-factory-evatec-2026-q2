# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify the Prototype Article Number must be unique and cannot match an existing Hardware Component Article Number (Validation)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A Standard Magnet System Type exists from which a Prototype can be created.
- A Hardware Component exists in the system with a known Article Number.
- Another Prototype Magnet System Type exists with a known Article Number.
- The 'Magnet System Types' page is accessible.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and select a Standard Magnet System Type. Trigger the action to create a Prototype. | The Prototype creation dialog opens with an Article Number entry field. |
| 2 | Enter an Article Number that matches an existing Hardware Component Article Number. Confirm. | The system rejects the entry. A validation error is displayed stating the Article Number already exists as a Hardware Component. |
| 3 | Clear the field and enter an Article Number that matches an existing Prototype Magnet System Type Article Number. Confirm. | The system rejects the entry. A validation error is displayed stating the Article Number is already in use by another Magnet System Type. |
| 4 | Clear the field and enter a unique Article Number that does not match any Hardware Component or Magnet System Type. Confirm. | Validation passes. The Prototype Magnet System Type is created with variant code `V01` and the provided Article Number. |

## Expected Outcome
The Prototype Article Number field enforces two uniqueness rules: it cannot match an existing Hardware Component Article Number, and it cannot match an Article Number already assigned to another Magnet System Type. A specific validation message is displayed for each violation. A valid unique Article Number allows the Prototype to be created.
