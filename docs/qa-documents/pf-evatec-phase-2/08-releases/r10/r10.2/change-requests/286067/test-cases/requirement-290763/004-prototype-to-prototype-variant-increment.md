# R10.2 Update for CR 286067 - Define Magnet System Type as Standard: Verify a Prototype Magnet System Type can be used to create a further Prototype variant with an incremented variant code (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290763
Requirement: Define Magnet System Type as Standard (Magnet System Types)

## Preconditions
- User is signed in with `MagnetSystemType_View` and `MagnetSystemType_Edit` permissions.
- A Prototype Magnet System Type with variant code `V01` exists.
- The 'Magnet System Types' page is accessible.
- Assumption A09 applies (see assumptions.md): a new unique Article Number is required for each Prototype variant.
- Assumption A10 applies (see assumptions.md): variant codes increment sequentially.

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' page and select the V01 Prototype Magnet System Type. | The Prototype record is displayed showing variant code `V01`. |
| 2 | Trigger the action to create a new Prototype from this V01 type. | A dialog or form is displayed requiring a new unique Article Number for the next variant. |
| 3 | Enter a unique Article Number that is different from V01's Article Number and does not match any Hardware Component Article Number. Confirm. | A new Prototype Magnet System Type is created with variant code `V02`. The V01 type remains unchanged. |
| 4 | Open the 'Magnet System Types' page and review all prototype variants. | Both V01 and V02 Prototype Magnet System Types are visible. Each displays the correct variant code and Article Number. |
| 5 | Open the V02 Prototype History view. | A history entry is present showing the source type as V01, the current user, and the creation timestamp. |

## Expected Outcome
A new Prototype Magnet System Type can be created from an existing Prototype. The new Prototype receives the next sequential variant code (V02 from V01, V03 from V02). The source Prototype remains unchanged. The new Prototype's history records the lineage from the V01 source.
