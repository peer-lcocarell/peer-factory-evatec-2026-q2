# CR 286067 - R10.2 Test Case Review Findings (Draft)

- CR: 286067
- Ticket: 35008
- Release: R10.2
- Files reviewed: 42
- Requirements covered: 31 of 31
- Generated: 2026-07-07
- Status: DRAFT. No ADO changes. No review-state changes. No files modified.

## Verdict

- Review State (proposed): `Change - Re-review`
- Quality Score: 6 / 10
- Execution Readiness: Not Ready

The set is structurally sound (traceability headers present, ADO-parseable step tables, consistent file layout), but lifecycle depth is thin for the highest-risk CR in R10.2, and vague language pervades Expected Outcome sections. Missing coverage is significant, especially Checkout, standalone Install, standalone Uninstall, invalid state transitions, migration, and the primary end-to-end kickoff use case.

---

## High Severity Findings

### H1 - Missing standalone Checkout lifecycle coverage

- Requirement: 290764/290765/290775 area, Change Magnet System (290777)
- Evidence: No file titled or scoped to "Checkout Magnet System" exists.
- CR reference: "Checkout and installation are separate actions. Checkout records user and tool in Magnet System history."
- Impact: The Checkout event is a distinct history-generating action per CR. Without dedicated coverage, checkout-history integrity is unverified.
- Recommendation: Create `requirement-290775/` or dedicated checkout test file. (See coverage-matrix.md for full list.)

### H2 - Missing standalone Install / Uninstall coverage

- Requirement: 290777 (Change Magnet System / Tool HW Config)
- Evidence: Only `001-change-magnet-system-happy-path.md` covers Replace. No file addresses first-time Install or standalone Uninstall.
- Impact: The core "install into a tool position" and "uninstall from a tool position" flows are not directly tested. History and Logbook integration is exercised only through the Replace path.
- Recommendation: Add `004-install-magnet-system-happy-path.md`, `005-uninstall-magnet-system-happy-path.md`, `006-install-magnet-system-not-checked-out-negative.md`.

### H3 - No invalid state transition coverage

- Requirements: 290772, 290773, 290775, 290777
- Evidence: No test attempts prohibited transitions (retire while In Use; install a Magnet System that is not Checked Out; return from In Stock; modify from a disallowed status).
- CR reference: Supported Actions by Status table defines the state machine.
- Impact: State-machine integrity is the primary correctness contract of the CR. It is unverified.
- Recommendation: Add negatives in 290772, 290773, 290775, 290777.

### H4 - No migration coverage (kickoff-flagged HIGHEST risk)

- Requirements: Cross-cutting.
- Evidence: Zero test cases address migration of existing Hardware Components to Magnet Systems, existing installed hardware conversion, or preservation of existing associations.
- Kickoff reference: "USE CASE: have a hw component named Magnet Systems in a role named Magnet Systems... Existing customer Hardware Components may already be installed and associated with tools. Key use case."
- Impact: The primary customer use case has no test coverage. Database changes, existing serial number data, and existing associations are all in scope per the kickoff.
- Recommendation: Add cross-cutting `end-to-end/` folder with migration scenarios.

### H5 - No end-to-end scenario covering the CR primary flow

- Requirement: Cross-cutting.
- Evidence: No single test walks the full lifecycle from existing Hardware Component -> Magnet System Type -> Magnet System -> Checkout -> Install -> History/Logbook/Export.
- Impact: Integration risk between the 31 requirements is not exercised.
- Recommendation: Add `end-to-end/001-existing-component-to-magnet-system-e2e-happy-path.md`.

### H6 - Vague Expected Outcome language

- Requirements: Multiple (see below).
- Evidence:
  - `290756/001`: "as expected"
  - `290757/001`: "correct field behavior"
  - `290758/001`: "successfully" (repeat)
  - `290763/001`: "reflected in the list"
  - `290772/001`: "accordingly"
  - `290775/001`: "correctly"
  - `290776/001`: "successfully"
  - `290777/002`: "accurately represent the before/after" - subjective
  - `290770/001`: "the removal persists"
  - Many others use "successfully", "correctly", "as applicable".
- Style rule: Prohibited phrases include "as expected", "correctly", "accordingly", "properly".
- Impact: Not release-ready per PFEvatec style. Testers cannot execute against ambiguous outcomes.
- Recommendation: Replace with measurable outcomes citing specific field values, status text, or UI locations.

### H7 - No permission-denied / security coverage

- Requirements: 290756, 290757, 290764, 290765, 290767, 290768, 290772, 290775, 290776
- Evidence: Every test asserts the positive permission case. None attempt an action without the required right.
- CR reference: "Lifecycle actions are limited to Administrator, Logistics."
- Impact: Authorization enforcement is not verified.
- Recommendation: Add at least one permission-denied test per major action.

---

## Medium Severity Findings

### M1 - Inconsistent security-right formatting

- Evidence: Some files use backticks (`` `Targets_View` ``, `` `ManageHardware_Edit` ``), others use generic prose ("permission to view Magnet Systems").
- Files using backticked names: 174279/001, 205378, 205379, 205380, 217766/001, 226384, 226385, 290777, 73354, 73375/001.
- Files using generic prose: All Magnet Systems (290764-290777) except 290777, 73375/002.
- Impact: Style inconsistency; publishable content lacks specific security-right assertions.
- Recommendation: Confirm exact rights with dev team, then apply backticked names across all files.
- Open question: Are `MagnetSystem_View`, `MagnetSystem_Edit`, `MagnetSystemType_View`, `MagnetSystemType_Edit`, `Logistics`, `Administrator` the correct right names?

### M2 - Inconsistent screen and page name quoting

- Evidence: "Manage Hardware screen" vs "'Manage Hardware' screen"; "Magnet Systems list" vs "'Magnet Systems' page".
- Files affected: All 42 test cases have at least one inconsistency.
- Style rule: Screen and page names must appear in single quotes.
- Impact: Style inconsistency; low but blocks style-compliance PASS.
- Recommendation: Wrap all screen and page references in single quotes.

### M3 - Requirement header format inconsistency

- Evidence: Two formats present:
  - Prose lines: "CR: 286067", "Ticket: 35008", "Requirement ID: nnnn", "Requirement: ..."
  - Bullet list: same content but bulleted.
- Prose format in: 174279/001, 174279/002, 205378, 205379, 205380, 217766/001, 226384, 226385, 264374, 290756, 290757/001, 290758, 290759, 290760, 290761, 290762, 290763, 290764, 290765, 290766, 290767, 290768, 290769, 290770, 290771, 290772, 290773, 290775, 290776/001, 73354/002, 73375/001.
- Bullet format in: 217766/002, 264374 (partial), 290757/002, 290776/002, 290777/001, 290777/002, 73354/001, 73375/002.
- Recommendation: Standardize on one format. Prose is more common in the corpus.

### M4 - Table header alignment inconsistency

- Evidence: `|------|----------|----------------|` in most files; `|------|--------|-----------------|` in 290757/002.
- Impact: Cosmetic; does not affect publishing but violates consistency rule.
- Recommendation: Normalize to a single divider pattern.

### M5 - Missing negative and validation coverage for common CRUD requirements

- Requirements: 290759, 290760, 290761, 290766, 290767, 290768, 290769, 290770 (view/edit/document requirements each have only Happy Path).
- Impact: Weak coverage per PFEvatec Coverage Rules table (Negative required, Validation required).
- Recommendation: See coverage-matrix.md for per-requirement additions.

### M6 - Applications field multi-value behavior untested

- Requirement: 290757
- Evidence: The CR and kickoff notes describe a multi-select Applications field with predefined + custom values displayed comma-separated. No test asserts this behavior.
- Recommendation: Add dedicated validation test.

### M7 - Prototype variant behavior fragmented

- Requirements: 290762, 290763, 290773, 290776
- Evidence: Variant code V0x behavior is mentioned only in 290776/002 expected results and 290773/001. No dedicated test asserts variant-code increment, lineage, or prototype-to-prototype flow.
- Recommendation: Add 290763/003 (Standard->Prototype), 290763/004 (Prototype->Prototype), 290773/003 (variant increment).

### M8 - Article number uniqueness rule untested

- Requirement: 290763 or new dedicated
- CR reference: "The Article Number must be unique within the system" and "must not match an existing Hardware Component Article Number".
- Evidence: 290763/002 covers Standard-flag uniqueness only, not Article Number uniqueness.
- Recommendation: Add 290763/006 (article number uniqueness validation).

---

## Low Severity Findings

### L1 - Titles use trailing parenthesized qualifier

- Evidence: All 42 files use `... (Happy Path)`, `(Unhappy Path)`, `(Validation)`, `(Regression)`, `(Audit)` at end of title.
- Style rule (per pf-qa-test-case-review agent): Prefer prefix qualifier: `'Happy Path': Verify [action]`.
- User instruction: Preserve current format (matches user example file). No action required.
- Status: Documented for awareness. Not remediated.

### L2 - No `[1] Verify preconditions.` opening step

- Evidence: All 42 files start at first substantive action.
- Style rule (per pf-qa-test-case-review agent): Step 1 should be `[1] Verify preconditions.` with empty result.
- User instruction: Preserve current format. No action required.
- Status: Documented for awareness. Not remediated.

### L3 - Preconditions in bullet-list format (not sentence)

- Evidence: All 42 files.
- Style rule (per pf-qa-test-case-review agent): Sentence paragraph format.
- User instruction: Keep bullet-list format per example. No action required.
- Status: Documented for awareness. Not remediated.

### L4 - Test data section absent

- Evidence: No test case has a `## Test Data` section.
- Style rule (per Advanced Test Case Writer): Test Data section required.
- Impact: Data prerequisites are folded into Preconditions; acceptable but not per full standard.
- Recommendation: Optional. Consider adding a `## Test Data` section for tests requiring specific values (for example serial numbers, article numbers).

### L5 - Priority and Risk Category missing

- Evidence: No file lists Priority or Risk Category.
- Style rule (per Advanced Test Case Writer): Both required.
- Impact: Downstream prioritization signals absent.
- Recommendation: Add optional metadata block; do not block release readiness on this.

---

## Style Compliance Summary

| Check | Status | Notes |
|-------|:------:|-------|
| Traceability (CR, Ticket, Requirement ID present) | PASS | All 42 cases include CR, Ticket, Requirement ID. |
| Table format for steps | PASS | ADO-compatible step tables in all files. |
| Requirement header - consistent format | FAIL | Mix of prose and bullet forms. See M3. |
| Preconditions - bullet-list format (per user example) | PASS | Consistent bullets. |
| Security rights in backticks and named | PARTIAL | Half of files use generic prose. See M1. |
| Screen names in single quotes | FAIL | Inconsistent across all files. See M2. |
| No prohibited vague phrases | FAIL | "as expected", "accordingly", "correctly", "successfully" present in ~20+ files. See H6. |
| Positive coverage | PASS | Every requirement has at least one Happy Path. |
| Negative coverage | FAIL | 22 of 31 requirements lack a negative case. |
| Validation coverage | PARTIAL | 8 requirements have validation cases; 23 do not. |
| Regression coverage | PARTIAL | Only 73375 and 290777 have Regression. |
| Integration coverage | PARTIAL | Only 290777/002 explicitly integrates HW Config + Logbook + History. |
| Lifecycle depth (Magnet Systems) | FAIL | Checkout, Install, Uninstall, invalid transitions missing. |
| Migration coverage | FAIL | Zero coverage. |
| End-to-end scenario | FAIL | Missing. |

---

## Coverage Statistics

- Requirements with Happy Path: 31 of 31
- Requirements with Negative: 9 of 31
- Requirements with Validation: 8 of 31
- Requirements with Regression: 2 of 31
- Requirements with Audit: 2 of 31
- Requirements with Integration: 1 of 31 (dedicated)

---

## Recommended Remediation Batch (draft plan)

If approved, remediation would proceed under `review-working/` in the following order:

1. **Batch A - Style normalization** (all 42 files)
   - Standardize security-right formatting (pending answer to Open Question 3).
   - Wrap all screen/page names in single quotes.
   - Replace prohibited vague phrases in Expected Outcome sections with measurable outcomes.
   - Normalize requirement header format.
   - Normalize table divider format.

2. **Batch B - High-risk new coverage**
   - Add Checkout, Install, Uninstall, invalid-transition tests.
   - Add end-to-end and migration cross-cutting tests.

3. **Batch C - Requirement-level coverage additions**
   - Add negatives and validations per coverage-matrix.md.

4. **Batch D - Audit report**
   - Generate `audit-report.md` with per-file change summary.

---

## Blocking Open Questions (require answer before Batch A)

1. Correct security-right names for Magnet Systems and Magnet System Types? (see M1)
2. Is Delete supported for Magnet System Types? (see coverage-matrix.md gap)
3. Is Magnet System Type Retirement in R10.2 scope?
4. Is standalone Install a distinct action or always via Change dialog? (see H2)
5. Does Retire require a mandatory reason field? (see 290772 recommendation)
6. Are all 31 requirements approved for R10.2, including those still Proposed? (see 290757, 290758, 290759, 290760, 290761, 290762, 290763, 290764, 290765, 290766, 290767, 290768, 290769, 290770, 290771, 290772, 290773, 290775, 290776, 290777)
7. Migration approach: manual only or scripted? Do we test both?

---

## Files Reviewed

Full list of 42 files reviewed is available in `coverage-matrix.md` per requirement.

---

## Reviewer Sign-off

- Reviewed by: GitHub Copilot - pf-qa-test-case-writer-advanced-agent-profile mode
- Date: 2026-07-07
- Deliverable state: DRAFT for human approval
- Next action: Await approval and answers to blocking open questions before Batch A remediation.
