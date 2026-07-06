```md
# Updated To-Do List

## R10.2 QA Estimate Recommendation (80-Hour Budget)

**Current Allocated:** 36 hrs  
**Confirmed Budget:** 80 hrs  
**Additional Hours Available:** 44 hrs

## Recommended Task Updates

### Task 291908
**Title:** PF Evatec - R10.2 - QA - MISC

- Original Estimate: 5 hrs
- Recommended Estimate: 8 hrs
- Increase: +3 hrs

**Rationale**

Expand coverage for:

- Ad hoc requests
- Environment-related issues
- Small unplanned validation activities outside dedicated CR testing

This task will also serve as part of the overall contingency pool.

### Task 291909
**Title:** PF Evatec - R10.2 - QA - Planning and Review

- Original Estimate: 5 hrs
- Recommended Estimate: 6 hrs
- Increase: +1 hr

**Rationale**

- Task is already resolved with 6 hours of completed work.
- Update the estimate to align with actual effort for reporting accuracy.
- No additional work is planned.

### Task 291910
**Title:** PF Evatec - R10.2 - QA - Regression

- Original Estimate: 4 hrs
- Recommended Estimate: 10 hrs
- Increase: +6 hrs

**Rationale**

Regression coverage spans five change requests affecting:

- Hardware Configuration
- Logbook
- History
- Export functionality
- Article Import

Additional effort supports:

- Cross-module regression testing
- Retesting after defect fixes
- Full regression execution as changes stabilize

### Task 291911
**Title:** PF Evatec - R10.2 - QA - Verification

- Original Estimate: 7 hrs
- Recommended Estimate: 12 hrs
- Increase: +5 hrs

**Rationale**

Additional time is required for:

- Defect verification
- Retesting cycles
- Hotfix validation
- Release-window support activities

### Task 292161
**Title:** QA Test - Ticket #35008 - Tracking of Magnet Systems in Evatec Fabric

- Original Estimate: 12 hrs
- Recommended Estimate: 28 hrs
- Increase: +16 hrs

**Rationale**

This is the highest-risk change request in the release.

Current scope includes:

- 41 authored test cases
- 31 requirements
- Many requirements covered by only a single test case

Additional effort supports:

- Expanded validation coverage
- Exploratory testing
- Defect analysis
- Lifecycle transition validation
  - Create
  - Checkout
  - Return
  - Install
  - Uninstall
  - Retire
- History and audit verification
- Migration validation

### Task 292215
**Title:** QA Test - Ticket #34682 - WBS Element for Self-Service Boxes

- Original Estimate: 0.5 hrs
- Recommended Estimate: 3 hrs
- Increase: +2.5 hrs

**Rationale**

The original estimate is not sufficient for:

- Executing 7 authored test cases
- Create box validation
- WBS editing
- Save and display verification
- Reporting validation

Includes time for defect retesting.

### Task 292218
**Title:** QA Test - Ticket #34951 - Search HW Components

- Original Estimate: 1 hr
- Recommended Estimate: 4 hrs
- Increase: +3 hrs

**Rationale**

Current scope includes:

- 11 authored test cases
- 3 requirements

Coverage includes:

- Name searches
- Serial number searches
- Article searches
- Partial matches
- No-match scenarios
- Post-edit validation

Additional time supports:

- Performance validation
- Negative testing
- Retesting activities

### Task 292219
**Title:** QA Test - Ticket #34948 - Article Import

- Original Estimate: 1.5 hrs
- Recommended Estimate: 5 hrs
- Increase: +3.5 hrs

**Rationale**

Current scope includes:

- 12 authored test cases
- 4 requirements

Testing requires:

- Test data preparation
- Execution and validation
- BOM imports
- Work Order imports
- Hardware Component imports

Additional effort covers:

- Duplicate handling
- Invalid data scenarios
- Missing-field validation
- Defect retesting

## Budget Summary

- Total Original Hours: 36 hrs
- Total Recommended Hours: 76 hrs
- Unallocated Contingency: 4 hrs
- Contingency Included in MISC: 8 hrs
- Total Effective Contingency: 12 hrs
- Total Planned Testing Budget: 80 hrs

## Planning Notes

- Estimates have been adjusted to align with the confirmed 80-hour testing budget approved on July 6, 2026.
- The largest increase is allocated to CR 286067 (Magnet Systems) due to its elevated risk profile, broad requirement coverage, and need for exploratory and defect-focused testing.
- Verification and Regression estimates have been expanded to accommodate defect investigation, retesting, and release stabilization activities.
- Task 291909 is already resolved. The estimate adjustment is solely for alignment with actual completed work and does not represent new effort.
- Task 291908 is intentionally increased to provide flexibility for ad hoc testing and issue response during execution.
- Four hours remain unallocated and are reserved for late-breaking scope changes, deployment concerns, or environment-related issues.
- The Mini STP remains approved with no changes to the planned test strategy or structure.

## Recommended Azure DevOps Update Order

1. Update Task 292161 (Magnet Systems)
2. Update Task 291911 (Verification)
3. Update Task 291910 (Regression)
4. Update Task 292215 (WBS Element)
5. Update Task 292218 (Search HW Components)
6. Update Task 292219 (Article Import)
7. Update Task 291908 (MISC / Contingency)

### Optional

- Add a note to Task 291909 indicating the estimate was adjusted to match actual completed work for reporting purposes.
```
