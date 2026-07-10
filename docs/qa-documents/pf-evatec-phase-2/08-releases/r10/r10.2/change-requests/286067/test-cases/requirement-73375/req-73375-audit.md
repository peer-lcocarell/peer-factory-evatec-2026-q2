# R10.2 Test Case Improvement Instructions
## CR 286067 – Remove Comment or Hardware Configuration Change from Logbook

## Objective

Review the existing R10.2 tests and restore regression coverage that existed in the R5 release while validating Magnet System-related logbook behavior introduced by CR 286067.

---

# Coverage Comparison

## R5 Coverage

R5 included validation for:

- Remove comment
- Remove hardware change
- Remove permissions
- Tool owner removal permissions

## R10.2 Coverage

R10.2 currently includes:

- Remove comment
- Remove hardware change/history regression
- Non-removable entries

## Missing From R10.2

The following R5 coverage is no longer present:

- Removal permissions
- Tool owner removal permissions
- Dedicated hardware change removal validation

These scenarios should either be restored as separate tests or incorporated into existing tests.

---

# Test Case 1

## Verify tester can remove a logbook entry comment (Happy Path)

### Current Gaps

- No cancellation validation.
- No reopen validation.
- No verification that only the selected comment is removed.

### Recommended Additions

#### Add Actions

```text
Trigger the Remove action on the comment.

Cancel the removal.
```

#### Expected Results

```text
The confirmation dialog is closed.

The comment remains visible.
```

---

#### Add Actions

```text
Trigger the Remove action again.

Confirm the removal.
```

#### Expected Results

```text
The selected comment is removed.

No other logbook entries are modified.
```

---

#### Add Actions

```text
Refresh the Logbook.

Close the Logbook.

Reopen the Logbook.
```

#### Expected Results

```text
The removed comment is not displayed.

Remaining logbook entries are unchanged.
```

---

# Test Case 2

## Verify removed logbook entry no longer appears in history view (Regression)

### Current Gaps

- Magnet System verification is vague.
- No persistence verification.
- No validation that only linked records are affected.

### Recommended Changes

#### Replace

```text
Verify linked Magnet System install or uninstall history behavior.
```

#### With

```text
Review any Magnet System history records associated with the removed logbook entry.

Review unrelated Magnet System history records.
```

#### Expected Results

```text
Linked Magnet System history records are updated according to the requirement.

Unrelated Magnet System history records remain unchanged.

Unrelated Logbook entries remain unchanged.
```

---

#### Add Actions

```text
Refresh the History view.

Close the Logbook.

Reopen the Logbook and History view.
```

#### Expected Results

```text
The removed entry is not displayed.

History remains consistent after reopening.
```

---

# Test Case 3

## Attempt to Remove a Non-Removable Logbook Entry (Negative)

### Current Gaps

- Does not verify persistence.
- Does not verify the protected entry remains unchanged.

### Recommended Additions

#### Add Actions

```text
Refresh the Logbook.
```

#### Expected Results

```text
The non-removable entry remains visible.

The entry remains unchanged.
```

---

#### Add Actions

```text
Close the Logbook.

Reopen the Logbook.
```

#### Expected Results

```text
The non-removable entry remains available.

The Remove action remains unavailable.
```

---

# Recommended New Regression Test

## Verify Tester Can Remove a Hardware Configuration Change Entry

### Reason

R5 contained a dedicated Hardware Change removal test.

R10.2 currently validates this indirectly within the history test, but no longer performs standalone validation of the removal workflow.

### Suggested Test

#### Actions

```text
Verify preconditions.

Open the Logbook page.

Locate a removable Hardware Configuration Change entry.

Select the entry.

Select Remove.
```

#### Expected Results

```text
A confirmation dialog is displayed.
```

---

#### Actions

```text
Confirm the removal.
```

#### Expected Results

```text
The Hardware Configuration Change entry is removed.
```

---

#### Actions

```text
Refresh the Logbook.

Reopen the Logbook.
```

#### Expected Results

```text
The removed entry is not displayed.

No unrelated entries are modified.
```

---

# Recommended New Regression Test

## Verify Removal Permissions Are Enforced

### Reason

Coverage existed in R5 but is missing in R10.2.

### Suggested Test

#### Actions

```text
Log in with an account that does not have Logbook editing permissions.

Open the Logbook.

Select a removable comment.

Review available actions.
```

#### Expected Results

```text
The Remove action is not available.

The tester cannot remove Logbook entries.
```

---

# Recommended New Regression Test

## Verify Tool Owner Can Remove Comments Without Logbook Editing Permissions

### Reason

Coverage existed in R5 but is missing in R10.2.

### Suggested Test

#### Actions

```text
Open the Logbook for a tool owned by the tester.

Locate a removable comment authored by another tester.

Select Remove.
```

#### Expected Results

```text
A confirmation dialog is displayed.
```

---

#### Actions

```text
Confirm the removal.
```

#### Expected Results

```text
The comment is removed.

No unrelated Logbook entries are modified.
```

---

# Highest Priority Changes

1. Restore Hardware Configuration Change removal coverage.

2. Restore permission-based removal coverage.

3. Restore tool-owner removal coverage.

4. Add Logbook reopen validation to all removal tests.

5. Strengthen Magnet System history validation by explicitly verifying linked versus unrelated records.

---

# Final Assessment

The largest issue with the current R10.2 suite is not the quality of the existing three tests. It is that two important R5 regression scenarios appear to have been dropped entirely:

- Permission-based removal validation
- Tool-owner removal validation

In addition, R10.2 no longer contains a dedicated Hardware Configuration Change removal workflow test and relies on indirect validation through the history regression test. Restoring these scenarios will significantly improve regression coverage and confidence in the CR 286067 implementation.

---

# Updated TODO List - Agent Skill Integration

- [x] Preserve existing R10.2 requirement 73375 audit recommendations.
- [x] Add a generic, reusable QA requirement-to-test-case audit prompt.
- [x] Add a ready-to-use audit table template.
- [x] Keep output structure explicit for coverage, gaps, risks, and verdict.
- [ ] Optional: add a stricter regulated-environment variant with entry and exit criteria.

---

# Agent Skill - Reusable QA Requirement-to-Test-Case Audit Prompt

```text
You are a Senior QA Auditor performing a requirements-to-test-case accuracy audit.

Task:
Review the provided requirements and test cases for correctness, completeness, and traceability.

Audit Objectives:
1. Verify whether each test case correctly maps to one or more requirements.
2. Determine whether each requirement is fully covered, partially covered, or not covered.
3. Identify gaps, ambiguities, contradictions, and missing negative/edge/error/recovery scenarios.
4. Detect redundant or overlapping test cases.
5. Propose concrete improvements to test case quality and coverage.

Inputs:
- Requirements: [Paste requirements here]
- Test Cases: [Paste test cases here]
- Optional Context (system/module, constraints, assumptions): [Paste context here]

Rules:
1. Do not invent requirements or expected behavior not present in the input.
2. If requirement text is unclear, mark as [UNCERTAIN] and explain why.
3. Prefer requirement IDs and test case IDs exactly as provided.
4. Flag any test that is out of scope for the listed requirements.
5. Keep feedback actionable and specific.

Output Format:

Section 1: Requirement Coverage Summary
- Total requirements
- Fully covered
- Partially covered
- Not covered
- Duplicate/overlapping tests detected (count)

Section 2: Test Case Audit Table
Columns:
- Test Case ID
- Mapped Requirement ID(s)
- Coverage Status (Full/Partial/None)
- Accuracy Issues (mismatch, missing assertions, invalid assumptions)
- Missing Scenarios (negative, edge, boundary, error, recovery)
- Redundancy/Overlap
- Improvement Suggestions
- Priority (High/Medium/Low)

Section 3: Requirement Gap Table
Columns:
- Requirement ID
- Coverage Status (Full/Partial/None)
- Missing Test Ideas
- Recommended New Test Case(s)

Section 4: Ambiguities and Risks
- List all [UNCERTAIN] items
- Explain impact on testing
- Clarification questions for product/engineering

Section 5: Final QA Verdict
- Audit Decision: Pass / Needs Revision / Blocked
- Release Risk: High / Medium / Low
- Minimum fixes required before approval
```

## Ready-to-Use Audit Table Template

```text
| Test Case ID | Mapped Requirement ID(s) | Coverage Status | Accuracy Issues | Missing Scenarios | Redundancy/Overlap | Improvement Suggestions | Priority |
|--------------|---------------------------|-----------------|-----------------|-------------------|--------------------|-------------------------|----------|
|              |                           |                 |                 |                   |                    |                         |          |
```

## Optional Extension

If needed, provide a stricter variant for regulated environments with explicit entry criteria, exit criteria, required evidence, and sign-off fields.



Yes. If the focus is only on the R10.2 test cases, I would recommend the following improvements.

R10.2 Test Case Recommendations
TC: Verify tester can remove a logbook entry comment (Happy Path)
Strengths
Validates comment removal workflow.
Validates confirmation dialog.
Validates removal survives a refresh.
Verifies other entries are not affected.
Recommended Updates
Add Close/Reopen Validation

Current coverage stops at refresh.

Add:

Close the Logbook page.
Reopen the Logbook page.
Verify the removed comment is not displayed.
Add Entry Count Validation

Current expected result:

The entry is displayed without the removed comment.

Consider adding:

The number of comments associated with the entry is reduced by one.

This provides stronger observable validation.

Capture Comment Details Before Removal

Add a step to record:

Comment text
Author
Timestamp

Then verify the exact comment was removed rather than simply confirming a visual change.

TC: Verify removed logbook entry no longer appears in history view (Regression)
Strengths
Covers history synchronization.
Covers linked Magnet System behavior.
Covers data integrity of unrelated records.
Recommended Updates
Verify Removal from Both Locations

Current flow verifies Logbook and History.

Add explicit verification:

Verify entry is removed from Logbook.
Verify entry is removed from History.

This creates clearer traceability.

Define Linked Record Expectations

Current expected result:

Related linked history entries are removed from the Logbook according to requirement rules.

This is vague.

Recommendation:

Identify exact linked records before test execution.
Verify those specific records are removed.
Verify specific unrelated records remain present.
Add Refresh of History View

After navigating to History:

Refresh History view.
Verify removed records remain absent.

This adds persistence coverage.

Add Hardware Change Validation Details

Since this test is acting as the primary hardware change removal test, add validation for:

Hardware change description
Installation/removal information
Associated system component

This confirms the correct record was removed.

TC: Attempt to remove a non-removable Logbook entry (Negative)
Strengths
Covers protected entries.
Covers disabled/missing Remove functionality.
Covers coexistence of removable and non-removable entries.
Recommended Updates
Split Into Two Validations

Currently the test verifies:

Non-removable entry cannot be removed.
Removable entry can be removed.

These are separate objectives.

Recommendation:

Keep negative validation focused only on protected records.
Create a separate positive validation if needed.
Expand Protected Entry Coverage

Current example:

System-generated event or linked install entry.

Add coverage for multiple protected record types if supported:

System-generated events
Install entries
Uninstall entries
Dependency-linked entries
Verify No State Change

After reviewing the protected entry:

Add:

Refresh the Logbook page.
Verify the protected entry remains unchanged.

This strengthens data integrity validation.

Missing R10.2 Test Cases

Based only on the R10.2 suite, I would add the following.

High Priority
Verify tester can remove a hardware configuration change (Happy Path)

Currently there is no dedicated R10.2 happy path equivalent to the R5 hardware change test.

Coverage:

Select hardware change.
Confirm removal.
Refresh Logbook.
Verify removal.
Verify History synchronization.
Verify user without ModuleTypes_Edit permission cannot remove Logbook entries

The R5 suite contains this coverage, but the R10.2 suite does not.

Coverage:

Login with restricted account.
Open Logbook.
Verify Remove action unavailable.
Verify hardware changes and comments cannot be removed.
Medium Priority
Verify Tool Owner can remove comments without Log Book Editing rights

Existing R5 coverage should be represented in R10.2 regression coverage if ownership logic remains part of CR behavior.

Verify removal persists after close and reopen

Coverage:

Remove entry.
Close Logbook.
Reopen Logbook.
Verify entry remains removed.
Low Priority
Verify multiple sequential removals

Coverage:

Remove several comments.
Remove several hardware changes.
Verify all selected entries are removed.
Verify remaining entries are intact.
Overall Recommendation

For the R10.2 suite specifically, I would classify:

Comment Removal Test        Good
History Regression Test     Good
Non-Removable Entry Test    Good

Missing:
- Hardware Change Happy Path
- Permission Validation
- Tool Owner Validation
- Close/Reopen Persistence


If those four scenarios are added, I would consider the R10.2 coverage effectively complete for CR 286067.
