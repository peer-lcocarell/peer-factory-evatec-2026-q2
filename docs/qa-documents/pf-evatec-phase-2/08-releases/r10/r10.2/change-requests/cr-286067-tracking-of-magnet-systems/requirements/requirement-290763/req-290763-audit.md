# Requirement 290763 - Test Case Audit
## CR 286067 - Tracking of Magnet Systems in Evatec Fabric

## Status

Consolidation completed on 2026-07-17.

---

## Coverage Assessment

### Authoritative Test Cases

- 001-define-magnet-system-type-as-standard-happy-path.md
	- Covers core prototype to standard happy path with ERP article selection.
	- Verifies article update, predecessor removal, variant code clearing, and formatted type history.
	- Verifies history details include assigned magnet systems list.

- 002-define-magnet-system-type-as-standard-uniqueness-validation.md
	- Covers rule that redefine as standard is only executable for Prototype types.
	- Verifies resulting single Standard designation after valid redefine operation.

- 003-standard-to-prototype-happy-path.md
	- Repurposed to ERP selection behavior validation for define as standard.
	- Verifies dummy article default selection when present in ERP.
	- Verifies selected ERP article value is persisted and reflected in history.

- 004-prototype-to-prototype-variant-increment.md
	- Repurposed to cancel without change validation.
	- Verifies no data changes and no history writes when user cancels.

- 005-promote-prototype-propagates-to-existing-magnet-systems.md
	- Covers integration impact across all assigned magnet systems.
	- Verifies predecessor clearing, variant clearing, type history summary, and detailed list content.
	- Verifies each assigned magnet system receives its own defined as standard history entry.

- 006-article-number-uniqueness-validation.md
	- Repurposed to authorization validation.
	- Verifies access requires MagnetSystems_Modify right.

### Merged and Retired Files

- Merged into 003: 003-create-prototype-from-standard-type.md
- Merged into 004: 004-variant-code-increments-to-v02.md
- Merged into 005: 005-magnet-systems-remain-linked-after-prototype-promotion.md
- Merged into 006: 006-prototype-article-number-rejected-matching-hardware-component.md

### Requirement Clause Mapping

- Clause: User can redefine a magnet system type as standard only if it is a prototype.
	- Coverage: Full.
	- Notes: Covered by 002 with explicit non-prototype restriction check and valid prototype flow.

- Clause: Change affects all magnet systems currently assigned to the type.
	- Coverage: Full.
	- Notes: Covered by 005 with link persistence and per-assigned-magnet-system history entry checks.

- Clause: User is prompted to select article number from ERP.
	- Coverage: Full.
	- Notes: Covered by 001 and 003.

- Clause: If current dummy article exists in ERP, it is selected by default.
	- Coverage: Full.
	- Notes: Covered by 003.

- Clause: User can cancel at any time with no changes.
	- Coverage: Full.
	- Notes: Covered by 004.

- Clause: On confirm, article number is updated.
	- Coverage: Full.
	- Notes: Covered by 001 and 003 with ERP-selected article persistence checks.

- Clause: On confirm, predecessor is removed and variant code is cleared.
	- Coverage: Full.
	- Notes: Covered by 001 and 005.

- Clause: Type history entry format includes timestamp, user, article value, and magnet systems count.
	- Coverage: Full.
	- Notes: Covered by 001 and 005 with required summary token assertions.

- Clause: Type history details include list of all currently assigned magnet systems.
	- Coverage: Full.
	- Notes: Covered by 001 and 005.

- Clause: Each assigned magnet system receives a defined as standard history entry.
	- Coverage: Full.
	- Notes: Covered by 005.

- Clause: Access requires MagnetSystems_Modify security right.
	- Coverage: Full.
	- Notes: Covered by 006 with positive and negative authorization checks.

### Coverage Gaps

- No open design-time coverage gaps remain in this folder for Requirement 290763.

### Recommendations

- Execute the updated suite in SIT and capture evidence for ERP selection, cancellation behavior, and per-magnet-system history propagation.

- If UI wording differs from expected history text format, keep the required tokens in assertions: article number, magnet systems count, user, and timestamp.

---

## Notes

- Audit scope was limited to markdown files currently present in requirement-290763.

- Existing files were reused and consolidated to avoid unnecessary test-suite growth.

- This is a design-time coverage audit and does not include execution evidence from SIT or UAT.
