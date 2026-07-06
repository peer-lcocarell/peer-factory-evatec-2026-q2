```md
# July 6, 2026 – Planning and Budget Update

## Budget Review

Discussed the testing budget with Kevin Bodbyl.

Key outcomes:

- Confirmed a minimum of 80 hours is available for testing activities.
- Original estimates were intentionally conservative due to uncertainty in available budget.
- Testing effort estimates will be increased where appropriate based on the confirmed allocation.
- Remaining capacity will be reserved for ad hoc testing and contingency activities.

Additional budget will support:

- Expanded validation coverage for newly identified scenarios.
- Defect investigation and retesting.
- Increased Magnet Systems testing, including bug analysis and exploratory testing.
- Buffer for issues discovered during execution.

The Mini STP remains approved and will proceed as planned.

Azure DevOps planning tasks will be updated to reflect the revised testing effort and budget allocation.

## Updated To-Do List

### Review Documentation

- [ ] Read `03-testing/test-cases`
- [ ] Read `03-testing/test-plans`
- [ ] Read `03-testing/test-assets`
- [ ] Read `08-releases/r10`
- [ ] Read `08-releases/r10/r10.2`
- [ ] Read `08-releases/r10/r10.2/change-requests`

### Review Change Requests

- [ ] Review CR 286067
- [ ] Review CR 285729
- [ ] Review CR 286836
- [ ] Review CR 284111
- [ ] Review CR 290161

### Review Test Cases by Change Request

- [ ] Review CR 286067 test cases
- [ ] Review CR 285729 test cases
- [ ] Review CR 286836 test cases
- [ ] Review CR 284111 test cases

## R10.2 Test Case Status Summary

**Location:** `change-requests`

### Totals by Change Request

- **CR 286067 – Magnet Systems**
  - 41 test cases
  - 31 requirement folders

- **CR 286836 – Article Import**
  - 12 test cases
  - 4 requirement folders

- **CR 285729 – Search Hardware Components**
  - 11 test cases
  - 3 requirement folders

- **CR 284111 – WBS Element (Self-Service Boxes)**
  - 7 test cases
  - 2 requirement folders

- **CR 290161 – PDT Tool Definition Patch**
  - 0 test cases
  - Validated through patch review
  - No test-case authoring folder exists

### Overall Totals

- 71 markdown test cases across all authored CRs

## Key Observations

### CR 286067 – Magnet Systems

- Largest and highest-risk area in the release.
- Covers 31 requirements.
- Many requirements contain only a single test case.
- Current coverage may be insufficient for:
  - Negative scenarios
  - Boundary conditions
  - Permission and security validation
  - Data integrity verification
  - History and audit-related behavior

### CR 286836 and CR 285729

- Coverage is relatively balanced.
- Average of approximately three test cases per requirement.

### CR 284111

Coverage currently includes:

- Requirement 36297
  - 4 test cases

- Requirement 36298
  - 3 test cases

### CR 290161

- Contains only the `cr-290161.md` reference document.
- No `test-cases` directory exists.

## Gaps and Risks

### Magnet Systems Coverage

- 24 of 31 requirements contain only one test case.
- Additional coverage should be considered for:
  - Error handling
  - Invalid inputs
  - Permission scenarios
  - Workflow variations
  - Regression validation

### Requirement Mapping

The following requirement IDs appear across multiple CRs:

- `264374`
- `287451`

Verify suite ownership and publishing targets to prevent:

- Duplicate test publication
- Incorrect suite mapping
- Reporting inconsistencies

### CR 290161 Coverage

- No authored test cases exist.
- If patch revalidation is required, additional coverage should be created.

### Repository Structure

- No files were found under:
  - `03-testing/test-cases`
  - `03-testing/test-assets`

- All authored test cases currently reside under the R10.2 release structure, which appears consistent with repository conventions.

## Recommended Actions

### High Priority

- Expand CR 286067 coverage for requirements with only one test case.
- Add negative, validation, boundary, and history-related scenarios.
- Reassess coverage against identified project risks.

### Medium Priority

- Confirm whether CR 290161 requires formal test coverage.
- If not, add documentation indicating validation rationale.
- If yes, create a `test-cases` folder and author coverage.

### Release Readiness

- Verify `suite-map.json` maps all 71 test cases to Test Plan **291616** suites before bulk publishing.
- Validate suite ownership for shared requirement IDs.
- Confirm all change requests are represented in release reporting and traceability artifacts.
```
