# Requirement 290773 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Complete — All updates applied. Suite expanded to 6 test cases.

---

## Coverage Assessment

### Existing Test Cases

- 001 — Modify Magnet System: Happy Path — **precondition status wrong (In Stock, must be Checked Out); missing post-save validations**
- 002 — Modify Magnet System: Invalid Status Negative — **missing In Stock blocked; missing Checked Out allowed boundary confirmation**
- 003 — Modify Magnet System: Variant Code Increment — **missing Article # / Description field validation; missing predecessor check**

### Coverage Gaps

**Critical:**
- 001 uses `In Stock` as precondition — requirement requires `Checked Out`.
- 002 does not confirm `In Stock` is also blocked, or that `Checked Out` is the only permitted status.

**Missing workflow branches:**
- Select existing prototype (entire branch untested).
- Confirmation prompt when selecting a differing existing prototype.
- Prototype list filtered by predecessor.
- Cancel from prototype selection screen.
- Cancel from prototype creation screen.

**Missing field validations:**
- Article # required.
- Article # max 60 characters.
- Article # must not exist as a Hardware Component.
- Description required.
- Description max 500 characters.
- Name, Source Type, FlexiCat Type are read-only.
- Applications inherited but editable.

**Missing post-save validations:**
- Last Inspection Date updated to current date.
- Magnet System Type history entry created.
- Predecessor relationship established on new type.
- History entry format includes prototype variant number (V##), user, and timestamp.

**Security:**
- `MagnetSystems_Modify` permission not tested.

### Recommendations

- **Update 001** — Fix precondition to `Checked Out`. Add post-save validations: last inspection date, prototype history entry (V##, user, timestamp), Magnet System Type history, predecessor relationship.
- **Update 002** — Add step verifying `In Stock` does not show Modify. Add step confirming `Checked Out` does show Modify.
- **Update 003** — Add Article # required, Article # not a Hardware Component, Description required, predecessor relationship verification.
- **Create 004** — Use Existing Prototype: select from filtered list, confirm prompt on differing type, verify Magnet System updated, verify history entry.
- **Create 005** — Prototype Creation Rules and Cancellation: field length limits, read-only fields, inherited applications, cancel behavior, default prototype selection.
- **Create 006** — Security: `MagnetSystems_Modify` enforced for user with and without permission.

---

## Coverage Matrix

| Requirement Clause | Test Case | Status |
|---|---|---|
| Modify permitted when Checked Out | 001, 002 | Needs fix |
| Modify blocked when In Use | 002 | Covered |
| Modify blocked when Retired | 002 | Covered |
| Modify blocked when In Stock | 002 | Gap — update needed |
| Select existing prototype | 004 | Not yet created |
| Prototype list filtered by predecessor | 004 | Not yet created |
| Confirmation prompt on differing prototype | 004 | Not yet created |
| Create new prototype | 001, 003 | Partial |
| Article # required | 005 | Not yet created |
| Article # max 60 characters | 005 | Not yet created |
| Article # not a Hardware Component | 003, 005 | Gap — needs update |
| Description required | 005 | Not yet created |
| Description max 500 characters | 005 | Not yet created |
| Name/Source Type/FlexiCat Type read-only | 005 | Not yet created |
| Applications inherited and editable | 005 | Not yet created |
| Cancel leaves Magnet System unchanged | 005 | Not yet created |
| Variant code increments (V01, V02…) | 003 | Covered |
| Predecessor relationship on new type | 003, 004 | Gap — update needed |
| Magnet System Type history entry | 001 | Gap — update needed |
| Last Inspection Date updated | 001 | Gap — update needed |
| Prototype history entry (V## + user + timestamp) | 001 | Gap — update needed |
| Security: MagnetSystems_Modify | 006 | Not yet created |

---

## Notes

Audit date: 2026-07-16.

13.5.7REQUIREMENT: Modify Magnet System
When a modification is made to a magnet system it must be converted to a prototype. Modifications can only be made when

it is not retired

the status is ‘Checked Out’ (it is not installed in a tool)

The user will first choose whether to use an existing prototype from a list of prototype magnet system types or create a new one. The list of prototype magnet systems can be prefiltered by its predecessor (i.e. all those that originate from the same article # as the current magnet system type). If the magnet system is already a prototype its current prototype magnet system type will be selected by default.
‎The user can continue (Next) or cancel, if cancelling no changes are made to the magnet system.

If the user selects an existing prototype that does not match the current magnet system type they will be prompted to confirm their selection (all information below will be read only), otherwise the user will be prompted to enter the following prototype magnet system type information

Article # (required, defaults to existing prototype magnet system types’ article # if available, maximum 60 characters, should NOT exist in the list of hardware components)

Description (required, maximum of 500 characters)

Applications is inherited from the current magnet system type but can be modified

Name, Source Type, FlexiCat Type are inherited from the current magnet system type and are read only

The user can save if all rules are valid or cancel, if cancelling no changes are made to the magnet system.

Upon saving PF will

1.Determine a new magnet system type is required. If so create a new magnet system type with the appropriate information including predecessor, incrementing the variant code (i.e. for the first prototype magnet system type variant code will be 1 and displayed as V01); an appropriate entry will be added to the magnet system type history

2.The magnet system is updated to use the new or existing type

3.The last inspection date of the magnet system is set to the current date

4.Add a ‘magnet system prototype V##’ entry to the history

Users must have the MagnetSystems_Modify security right to access this functionality.


## Recommended Updates

### Current Assessment

Coverage is weaker than it initially appears because the requirement contains a large amount of workflow and validation logic that is not currently tested.

Current Test Cases: 3

1. Modify Magnet System (Happy Path)
2. Modify Magnet System Invalid Status (Negative)
3. Variant Code Increment Validation

Recommended New Test Cases: 2

Most gaps cannot be reasonably absorbed into the existing tests because they validate separate branches of the Modify workflow.

---

## Update Existing Test: Happy Path

File:

```text
R10.2 Update for CR 286067 - Modify Magnet System: Verify tester can submit a modification request for a Magnet System (Happy Path)

Fix Preconditions

Requirement states:

Modification can only be made when status = Checked Out


Current test uses:

In Stock


Update to:

A Magnet System with status Checked Out exists.

Add Validations

After modification succeeds, verify:

Last Inspection Date is updated to the current date.
Prototype history entry contains the prototype variant number.
Prototype history entry contains user and timestamp.
Magnet System Type predecessor relationship is created.
Magnet System Type history entry is created.

This closes:

Last inspection date update.
Prototype history entry.
Magnet System Type history.
Update Existing Test: Invalid Status

File:

R10.2 Update for CR 286067 - Modify Magnet System: Attempt to modify a Magnet System that is in a status that does not permit modification (Negative)

Add Missing Status Coverage

Requirement allows modification only when:

Checked Out


Add validation that:

In Stock cannot be modified.
In Use cannot be modified.
Retired cannot be modified.

Expected Result:

Modify action is available only when status is Checked Out.


This closes the status rule.

Update Existing Test: Variant Code Validation

File:

R10.2 Update for CR 286067 - Modify Magnet System: Verify variant code increments correctly when creating successive prototype versions (Validation)

Add Additional Validations

Verify:

Article Number is required.
Article Number does not already exist as a Hardware Component.
Description is required.
Variant predecessor relationship is maintained.
Variant codes increment sequentially.

This improves coverage without creating another validation-only test.

Create New Test 1
Title
R10.2 Update for CR 286067 - Modify Magnet System: Verify tester can use an existing prototype Magnet System Type (Happy Path)

Why Needed

The current happy-path test only covers:

Create new prototype


Requirement also requires:

Use existing prototype

Cover
Existing prototype list displayed.
Prototype list filtered by predecessor.
Select existing prototype.
Confirmation prompt shown when prototype differs from current type.
Continue modification.
Magnet System updated to existing prototype.
Prototype history entry generated.
Create New Test 2
Title
R10.2 Update for CR 286067 - Modify Magnet System: Verify prototype creation rules and cancellation behavior (Validation)

Why Needed

Several major requirement clauses remain untested:

Cover

Prototype Creation Screen

Verify:

Article Number required.
Article Number max 60 characters.
Article Number cannot exist as Hardware Component.
Description required.
Description max 500 characters.

Read Only Fields

Verify:

Name is read only.
Source Type is read only.
FlexiCat Type is read only.

Inherited Fields

Verify:

Applications inherited from current type.
Applications can be modified.

Cancellation

Verify:

Cancel from prototype selection screen.
Cancel from prototype creation screen.
No Magnet System changes occur.

Default Prototype

If current type is already a prototype:

Existing prototype selected by default.
Create New Security Test

Only if permissions are not covered elsewhere.

Title
R10.2 Update for CR 286067 - Modify Magnet System: Verify Modify security permissions are enforced (Security)

Cover

Requirement:

Users must have the MagnetSystems_Modify security right to access this functionality.


Validate:

User with permission can modify.
User without permission cannot modify.
Modify action hidden or blocked.
Final Recommended Suite
Update Existing
Modify Magnet System Happy Path
Modify Magnet System Invalid Status
Variant Code Increment Validation
Add
Use Existing Prototype Magnet System Type
Prototype Creation Rules and Cancellation
Security Permissions (if not already covered globally)
Coverage Closed
Checked Out status requirement
Existing prototype selection
New prototype creation
Prototype filtering
Confirmation workflow
Cancel workflow
Required fields
Field length limits
Read-only fields
Inherited fields
Variant code generation
Predecessor relationship
Magnet System Type history
Prototype history
Last Inspection Date update
Security permissions
Result

Current Test Cases: 3

Recommended New Test Cases:

Minimum: 2
With Security Coverage: 3

Coverage Health After Updates:

Good

Release Recommendation:

Additional Coverage Recommended
