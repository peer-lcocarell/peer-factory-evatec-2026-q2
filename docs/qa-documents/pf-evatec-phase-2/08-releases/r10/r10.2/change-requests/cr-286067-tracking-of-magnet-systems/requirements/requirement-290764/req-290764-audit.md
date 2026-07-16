# Requirement 290764 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Coverage Updated

---

## Coverage Assessment

### Existing Test Cases

- 001-magnet-systems-list-happy-path.md
	- Covers page access with `MagnetSystems_View` and list rendering.
	- Covers required column set including source type, checked out by, article #, and prototype with variant.
	- Covers lifecycle statuses and multi-value status filtering.

- 002-magnet-systems-list-inspection-and-retired-filters.md
	- Covers inspection-required filtering with one-year age rule validation.
	- Covers active and all toggle behavior with retired visibility.
	- Covers URL state preservation for filtering and sorting.
	- Covers retired view-only restriction for measure and retire actions.

- 003-magnet-systems-selected-actions-and-permissions.md
	- Covers create, details default action, print label, edit, modify, define as standard, checkout, return, and retire.
	- Covers status and permission-gated action availability including prototype-specific define as standard.

### Requirement Clause Mapping

- Clause: Page displays all magnet systems including active and retired.
	- Coverage: Full.
	- Notes: Covered in 002 with explicit active and all toggle checks.

- Clause: Magnet systems requiring inspection are flagged.
	- Coverage: Full.
	- Notes: Covered in 002 with explicit flag verification.

- Clause: Inspection required flag is raised when last inspection is older than one year.
	- Coverage: Full.
	- Notes: Covered in 002 with older-than-one-year and one-year-or-newer comparison.

- Clause: List contains magnet system #, type name, source type, location, status, checked out by, article #, serial #, and prototype flag with variant code.
	- Coverage: Full.
	- Notes: Covered in 001.

- Clause: Status can be filtered by multiple values.
	- Coverage: Full.
	- Notes: Covered in 001 with multi-value status filter scenario.

- Clause: Users with `MagnetSystems_Create` can create new magnet systems.
	- Coverage: Full.
	- Notes: Covered in 003.

- Clause: Selected magnet system actions: view details, print label, edit with `MagnetSystems_Edit`.
	- Coverage: Full.
	- Notes: Covered in 003.

- Clause: Active-only actions with permissions: modify, define as standard for prototype, checkout, return if checked out, retire.
	- Coverage: Full.
	- Notes: Covered in 003.

- Clause: Sorting and filtering are preserved in URL.
	- Coverage: Full.
	- Notes: Covered in 002.

- Clause: Toggle between active systems and all systems including retired.
	- Coverage: Full.
	- Notes: Covered in 002.

- Clause: Retired systems are view-only with no measure or retire actions.
	- Coverage: Full.
	- Notes: Covered in 002 and reinforced in 003.

- Clause: Access requires `MagnetSystems_View`.
	- Coverage: Full.
	- Notes: Covered in preconditions across 001, 002, and 003.

### Coverage Gaps

- No open design-time coverage gaps remain in this folder for Requirement 290764.

### Recommendations

- Execute updated tests in SIT and collect evidence for inspection age rule, URL persistence, and action permission matrix.

- If UI labels differ by environment, keep assertions focused on required behavior and permission outcomes.

---

## Notes

- Audit scope was limited to markdown files currently present in requirement-290764.

- Existing test files were expanded first and only one new test case was added because action and permission matrix coverage is a distinct workflow.

- This is a design-time coverage audit and does not include SIT or UAT execution evidence.
