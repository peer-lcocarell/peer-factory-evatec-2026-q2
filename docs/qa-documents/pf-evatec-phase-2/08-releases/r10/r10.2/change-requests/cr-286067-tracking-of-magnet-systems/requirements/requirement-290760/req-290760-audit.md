# Requirement 290760 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

In Progress - Partially Covered

---

## Coverage Assessment

### Existing Test Cases

- 001-edit-magnet-system-type-happy-path.md
	- Covers successful edit and persistence for Standard Magnet System Type records.
- 002-edit-magnet-system-type-prototype-readonly-fields.md
	- Covers prototype edit behavior and read-only constraints for Variant Code, Predecessor, Source Type, and FlexiCat Type.
- 003-edit-magnet-system-type-cancel-with-unsaved-changes.md
	- Covers unsaved-change confirmation flow and discard behavior for Cancel.
- 004-edit-magnet-system-type-back-button-behavior.md
	- Covers Back availability with no changes and Back-to-Cancel transition after edits.
- 005-edit-magnet-system-type-save-button-availability.md
	- Covers Save availability only when changes exist and form state is valid/original.
- 006-edit-magnet-system-type-prevent-access-without-edit-permission.md
	- Covers missing MagnetSystemTypes_Edit security right for UI action and direct URL access.

Requirement rule-to-coverage mapping:
- Edit page allows view and edit of magnet system type information: Covered by 001.
- Prototype exclusions and read-only fields: Covered by 002.
- Save availability only when changes are made and rules are valid: Covered by 005 and partially by 001.
- Back available only while no changes are made and redirects to list: Covered by 004.
- Cancel available when changes are made, redirects without saving, prompts confirmation, allows return to editing: Covered by 003 and partially by 004.
- MagnetSystemTypes_Edit required for access: Covered by 006.

### Coverage Gaps

- Missing negative validation coverage for invalid edits on fields governed by "same rules as create".
	- No explicit test for required-field violations, format violations, or invalid combinations on edit.
- Missing explicit proof that Save is blocked when rules are invalid after a change.
	- Current tests verify Save enablement for changed and restored states, but not changed-invalid states.
- Missing permission boundary scenario for user with neither view nor edit rights.
	- Current security test validates no-edit only.
- Missing concurrency/update conflict behavior.
	- No test for stale record edits, overlapping edits, or backend reject handling.
- Missing audit/history side-effect validation for edit operations.
	- Requirement set for CR 286067 emphasizes history and traceability risk areas.

### Recommendations

- Add 3 focused test cases to close requirement risk:
	- Edit Magnet System Type - Invalid Required Field Prevents Save.
	- Edit Magnet System Type - Invalid Format/Business Rule Prevents Save.
	- Edit Magnet System Type - Concurrent Update Conflict Handling.
- Add 1 security hardening case:
	- Edit Magnet System Type - Prevent Access Without View and Edit Permissions.
- Add 1 traceability case:
	- Edit Magnet System Type - Verify History/Audit Entry After Successful Edit.
- Keep existing six cases as baseline regression set.

---

## Notes

- Audit scope: Requirement 290760 only.
- Result: Core requirement behavior is well covered by the six authored test cases.
- Residual risk: Validation and conflict-handling gaps remain for production-grade release confidence.
- Proposed coverage status: 85% functional requirement coverage, pending negative validation and conflict tests.

13.4.4 REQUIREMENT: Edit Magnet System Type
The Edit magnet system type page will allow users to view & edit the magnet system type information.

Editing a magnet system type contains all the same rules as creating a new magnet system type with some additions and exclusions if the magnet system type is a prototype

- Variant Code displayed (read only, formatted as V##)

- Predecessor displayed (read only, contains the original article #)

- Source Type is read only

- FlexiCat Type is read only

Save is available if changes are made and all rules are valid.

Back will be available while there are no changes and will redirect to the magnet system types screen.

Cancel will be available if changes are made and will redirect to the magnet system types screen without saving changes to the magnet system type. If changes have been made to the magnet system type then the user will be prompted for confirmation before redirecting allowing them to return to editing the magnet system type.

Users must have the MagnetSystemTypes_Edit security right to access this functionality.
