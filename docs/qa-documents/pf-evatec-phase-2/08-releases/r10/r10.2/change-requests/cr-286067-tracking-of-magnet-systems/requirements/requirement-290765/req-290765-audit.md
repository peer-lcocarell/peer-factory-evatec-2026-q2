# Requirement 290765 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Coverage Updated

---

## Coverage Assessment

### Existing Test Cases

- 001-new-magnet-system-happy-path.md
	- Covers create flow using standard type selection with prototype exclusion.
	- Verifies type data is read only, default inspection date, and past-date edit behavior.
	- Verifies generated `MS####` number, `In Stock` status, entry date today, blank location, redirect to view page, and created history entry.

- 002-new-magnet-system-duplicate-serial-negative.md
	- Covers serial uniqueness conflict and successful save after correction.
	- Covers serial format validation for allowed characters and boundary lengths.

- 003-new-magnet-system-required-field-validation.md
	- Covers required validation for serial number and type selection.
	- Covers create permission gate for `MagnetSystems_Create`.
	- Covers cancel confirmation behavior for Yes and No outcomes.

### Requirement Clause Mapping

- Clause: User must select Magnet System Type from defined standard types only and prototypes are excluded.
	- Coverage: Full.
	- Notes: Covered in 001.

- Clause: Magnet System Type information is displayed read only.
	- Coverage: Full.
	- Notes: Covered in 001.

- Clause: Serial number must be unique.
	- Coverage: Full.
	- Notes: Covered in 002.

- Clause: Serial number must be 1 to 50 characters using alphanumeric, slash, or dash only.
	- Coverage: Full.
	- Notes: Covered in 002.

- Clause: Last inspection date defaults to current date and can be modified to any past date.
	- Coverage: Full.
	- Notes: Covered in 001.

- Clause: Comment is optional.
	- Coverage: Full.
	- Notes: Covered in 001 by successful save without comment.

- Clause: On save PF generates unique Magnet System # formatted `MS####`.
	- Coverage: Full.
	- Notes: Covered in 001.

- Clause: On save PF sets status `In Stock`, entry date today, and current location blank.
	- Coverage: Full.
	- Notes: Covered in 001.

- Clause: Created entry is added to magnet system history.
	- Coverage: Full.
	- Notes: Covered in 001.

- Clause: Save is available only when all rules are valid.
	- Coverage: Full.
	- Notes: Covered across 002 and 003 with invalid and valid rule paths.

- Clause: Cancel prompts for confirmation, Yes redirects without create, No continues creating.
	- Coverage: Full.
	- Notes: Covered in 003.

- Clause: After save PF redirects to View magnet system page.
	- Coverage: Full.
	- Notes: Covered in 001.

- Clause: Access requires `MagnetSystems_Create`.
	- Coverage: Full.
	- Notes: Covered in 003.

### Coverage Gaps

- No open design-time coverage gaps remain in this folder for Requirement 290765.

### Recommendations

- Execute updated test cases in SIT and capture evidence for serial-format validation, cancellation confirmation outcomes, and generated-field defaults.

- If UI labels differ by environment, keep assertions focused on required behavior and field outcomes.

---

## Notes

- Audit scope was limited to markdown files currently present in requirement-290765.

- Existing test files were updated to close identified gaps without adding new test files.

- This is a design-time coverage audit and does not include SIT or UAT execution evidence.
