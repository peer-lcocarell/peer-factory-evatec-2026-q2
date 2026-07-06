```markdown
# Evatec Factor - Release 10.2 - Mini Software Test Plan

## Wrap-up: Actuals and Analysis/Comments

| Rqmt/CR/Bug ID | Work Item Type | Description | Timekeeping | Writing Estimate | Testing Estimate | Comments | Azure Writing Actuals | Azure Testing Actuals | Timekeeping Actuals | Comments |
|----------------|----------------|-------------|-------------|------------------|------------------|----------|----------------------|----------------------|--------------------|----------|
| | | Prepare Software Test Plan | Sys-Testing\plan | 3 | | | | | Get from TK | |

## New Functionality

| Rqmt/CR/Bug ID | Work Item Type | Description | Timekeeping | Writing Estimate | Testing Estimate | Comments | Azure Writing Actuals | Azure Testing Actuals | Timekeeping Actuals | Comments |
|----------------|----------------|-------------|-------------|------------------|------------------|----------|----------------------|----------------------|--------------------|----------|
| [CR ID] | CR | CR description | | 4.00 | 18.00 | See *Change Requests* section for more details. | Get From Azure | Get From Azure | | |
| | Bugs | Bug description | | | 0.50 | See *Bugs* section for more details. | | | | |
| | n/a | Ad hoc testing | Sys-Testing\QA Test | | 3.00 | See *Change Requests* section for more details. | Get From Azure | Get From Azure | | |

### Totals

| Description | Timekeeping | Writing Estimate | Testing Estimate | Comments | Azure Writing Actuals | Azure Testing Actuals | Timekeeping Actuals | Comments |
|-------------|-------------|------------------|------------------|----------|----------------------|----------------------|--------------------|----------|
| Total New - Writing | Sys-Testing\write | 4 | | See *Change Requests* section for more details. | 0 | | Get from TK | Comment if Azure & TK significantly different |
| Total New - Testing | Sys-Testing\QA Test | | 21.5 | See *Change Requests* section for more details. | | 0 | Get from TK | Comment if Azure & TK significantly different |

## Regression

| Description | Timekeeping | Writing Estimate | Testing Estimate | Comments | Azure Writing Actuals | Azure Testing Actuals | Timekeeping Actuals |
|-------------|-------------|------------------|------------------|----------|----------------------|----------------------|--------------------|
| Total Regression | Sys-Testing\regression | 0 | 4 | Allocating ad hoc verification time for exploratory testing and validation of impacted workflows not explicitly covered by formal test cases. | Get from Azure | Get from Azure | Get from TK |

## General / Other

| Description | Timekeeping | Testing Estimate | Comments | Timekeeping Actuals |
|-------------|-------------|------------------|----------|--------------------|
| Consult time with Dev | Sys-Testing\consult | 3 | Because of new feature, allowing time to consult with Nicola | Get from TK |
| Environment Setup, installing builds | Sys-Testing\setup | 1 | | Get from TK |
| Bug verification | Sys-Testing\verify | 6.5 | See *Bugs* section for more details. | Get from TK |
| Test case and spec reviews | Sys-Testing\review | 2 | | Get from TK |
| Unplanned changes / contingency | Sys-Testing\misc | 1 | | Get from TK |
| **Total General** | | **13.5** | | **0** |

## Grand Totals

| Item | Estimate | Actual |
|------|---------:|-------:|
| Grand Total | 46 | 0 |

## Budget

| Item | Hours |
|------|------:|
| Budget (check TK or ask PM) | |
| Estimated Effort | 46 |
| Difference (hours) | 46 |
| % Difference to Budget | #DIV/0! |
| Actual Effort (hours) | 0 |
| Actual Effort (% Diff to Budget) | #DIV/0! |

## Assumptions, Areas Not Tested, Other Supporting Information

Include in this section any assumptions, areas you will not be testing (but feel you should be), and any other information that will help explain your strategy, risks, and related considerations.

# Change Requests

## CR 286067 - Ticket #35008 - Tracking of Magnet Systems in Evatec Fabric

**Area:** PFEvatec\WF06 (Logbook)\Magnet Systems  
**Release:** Phase 2\R10\R10.2  
**Priority:** 1  
**Writing Estimate:** 3.00 hours  
**Testing Estimate:** 12.00 hours

### Impacts
- 32 requirements

### QA Writing Approach
- Test case writing with assistance from Copilot to expedite formatting.
- Happy path and unhappy path scenarios planned.
- Edge cases and targeted regression cases included across impacted areas.

### QA Testing Approach
- Verify Magnet System Type and Magnet System functionality.
- Verify document management, permissions, inspection tracking, overdue calculations, and filter behavior.
- Validate lifecycle workflows:
  - Checkout
  - Return
  - Install
  - Uninstall
  - Replace
  - Retire
  - Label generation
  - QR code generation
- Validate Standard-to-Prototype workflows including:
  - Variant numbering
  - Lineage
  - Article Number uniqueness
  - Promotion to Standard while preserving associations
- Verify Hardware Configuration integration including:
  - New Magnet System role type
  - Serial number enforcement
- Validate Magnet System History and Logbook synchronization across lifecycle events.
- Verify Export Hardware Configuration includes Magnet System details.
- Validate database migrations and entity relationships.
- Verify conversion of existing Hardware Components to Magnet Systems.
- Perform regression testing on impacted areas.

### Potential Issues
- Highest-risk area of the release due to broad cross-module impact across Hardware Configuration, Logbook, History, and Export.
- Prototype lifecycle, Article Number uniqueness, and Standard-to-Prototype promotion may introduce defects related to lineage, history, or association preservation.
- Migration of existing Hardware Components and Magnet System-to-Logbook synchronization presents significant regression and data-integrity risk.

---

## CR 285729 - Ticket #34951 - Search HW Components

**Area:** PFEvatec\WF06 (Logbook)\HW Config  
**Release:** Phase 2\R10\R10.2  
**Priority:** 2  
**Writing Estimate:** 0.25 hours  
**Testing Estimate:** 1.00 hours

### Impacts
- 3 requirements

### QA Writing Approach
- Test case writing with assistance from Copilot to expedite formatting.
- Happy path and unhappy path scenarios planned.
- Edge cases and regression coverage focused on modified requirements.

### QA Testing Approach
- Verify Search HW Components functionality across all impacted areas.
- Execute positive, negative, partial-match, and no-result searches.
- Validate installed hardware components are returned correctly.
- Confirm consistent filtering, search results, and display behavior across supported pages.

### Potential Issues
- Differences in page-level data loading, indexing, or caching may cause inconsistent search behavior across impacted areas.

---

## CR 286836 - Ticket #34948 - Article Import

**Area:** PFEvatec  
**Release:** Phase 2\R10\R10.2  
**Priority:** 3  
**Writing Estimate:** 0.50 hours  
**Testing Estimate:** 1.50 hours

### Impacts
- 2 requirements

### QA Writing Approach
- Test cases created with Copilot assistance to expedite formatting and writing.
- Coverage includes happy path, unhappy path, edge cases, and regression scenarios.

### QA Testing Approach
- Verify custom import formats and mappings.
- Validate hardware component imports using both legacy and new file formats.
- Confirm field mappings and numeric status values import correctly.
- Verify partial imports do not incorrectly deactivate valid hardware components.
- Perform regression testing on:
  - BOM Import
  - Work Order Import
  - Hardware Component Import

### Potential Issues
- Incorrect mappings may result in invalid imported data.
- Import framework changes could impact existing import workflows.
- Partial imports may incorrectly deactivate hardware components.
- Large import files may expose performance or responsiveness issues.

---

## CR 284111 - Ticket #34682 - WBS Element for Self-Service Boxes

**Area:** PFEvatec\WF02 (Box and Substrates)\Box Management  
**Release:** Phase 2\R10\R10.2  
**Priority:** 4  
**Writing Estimate:** 0.25 hours  
**Testing Estimate:** 0.50 hours

### Impacts
- 2 requirements

### QA Writing Approach
- Test case writing with assistance from Copilot to expedite formatting.
- Coverage includes happy path, unhappy path, edge cases, and regression scenarios around modified requirements.

### QA Testing Approach
- Verify the WBS Element field across all impacted pages.
- Create self-service boxes with WBS Element values.
- Edit self-service boxes with WBS Element values.
- Confirm WBS Element values save correctly and persist after updates.
- Validate consistent display across all applicable pages.
- Verify WBS Element values remain available and functional in related workflows.

### Potential Issues
- Differences in page-level loading or caching behavior may lead to inconsistent WBS Element functionality.

---

## CR 290161 - Ticket #35623 - Error: Use PDT to Create the Tool Definition for New Tool Type

**Area:** PFEvatec  
**Release:** Phase 2\R10\R10.2  
**Priority:** N/A  
**Writing Estimate:** 0.00 hours  
**Testing Estimate:** 0.00 hours

### Impacts
- 0 requirements

### Notes
- This item was logged as a CR because it introduces support for a new tool type rather than fixing an existing defect.
- The change was delivered as a customer patch to unblock Hermann's tool setup activity.
- Hermann validated the fix within the customer environment and closed the ticket.
- No additional internal QA testing is planned.

# Bugs

## Bug 285795 - Ticket #34217 - Article # with Project # in the Projects Table

**Area:** PFEvatec  
**Release:** PFEvatec\Phase 2\R10\R10.1  
**Priority:** 2  
**QA Verification Estimate:** 0.5 hours

### QA Verification Approach
- Verify the defect fix for Article # and Project # handling within the Projects table.
- Perform a quick sweep of related impacted UI areas.
- Confirm no regressions were introduced by the change.
- Validate expected behavior remains intact across affected workflows.

### Comments
- QA will do a quick sweep of related impacted UI areas to make sure nothing breaks from the change related to this bug.

### Link
- Bug Ticket #34217 - Article # with Project # in the Projects Table

---

## Additional Bug Verification Time

**Estimate:** 6.5 hours

### Rationale
- Accounts for expected incoming bugs requiring verification.
- Estimate is based on the average bug verification effort observed during previous releases.

---

## Bug Verification Totals

| Item | Hours |
|------|------:|
| Bug 285795 Verification | 0.5 |
| Additional Verification Time | 6.5 |
| **Total Estimated Bug Verification Time** | **7.0** |
```
