# Evatec Factory - Release 10.2 - Mini STP

## Overview

### Overview

### Metadata

- Evatec Factor - Release 10.2 - Mini Software Test Plan
- Wrap-up: Actuals and analysis/comments

### Requirements

| Rqmt/CR/Bug ID | Work Item Type |   | Timekeeping | Writing Estimate | Testing Estimate | Comments |   | Azure Writing<br>Actuals | Azure Testing<br>Actuals | Timekeeping<br>Actuals | Comments |
|---|---|---|---|---|---|---|---|---|---|---|---|
|  |  | Prepare Software Test Plan | Sys-Testing\\plan |  | 3 |  |  |  |  | Get from TK |  |
| New Functionality |  |  |  |  |  |  |  |  |  |  |  |
| [CR ID] | CR | CR description |  | =CRs!E8 | =CRs!F8 | See 'Change Requests' tab for more details. |  | Get From Azure | Get From Azure |  |  |
|  | Bugs | Bug description |  |  | =Bugs!F3 | See 'Bugs' tab for more details. |  |  |  |  |  |
|  | n/a | Ad hoc testing | Sys-Testing\\QA Test |  | =CRs!F7 | See 'Change Requests' tab for more details. |  | Get From Azure | Get From Azure |  |  |
|  |  | Total New - Writing | Sys-Testing\\write | =SUM(E7:E10) |  | See 'Change Requests' tab for more details. |  | =SUM(J7:J10) |  | Get from TK | Comment if Azure & TK significantly different |
|  |  | Total New - Testing | Sys-Testing\\QA Test |  | =SUM(F7:F10) | See 'Change Requests' tab for more details. |  |  | =SUM(K7:K10) | Get from TK | Comment if Azure & TK significantly different |
| Regression |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Total Regression | Sys-Testing\\regression | 0 | 4 | Allocating ad hoc verification time for exploratory testing and validation of impacted workflows not explicitly covered by formal test cases. |  | Get from Azure | Get from Azure | Get from TK |  |
| General / Other |  |  |  |  |  |  |  |  |  |  |  |
|  |  | Consult time with Dev | Sys-Testing \\consult |  | 3 | Because of new feature, allowing time to consult with Nicola |  |  |  | Get from TK |  |
|  |  | Environment Setup, installing builds | Sys-Testing \\setup |  | 1 |  |  |  |  | Get from TK |  |
|  |  | Bug verification | Sys-Testing\\verify |  | =Bugs!F4 | See 'Bugs' tab for more details. |  |  |  | Get from TK |  |
|  |  | Test case and spec reviews | Sys-Testing\\review |  | 2 |  |  |  |  | Get from TK |  |
|  |  | Unplanned changes / contingency | Sys-Testing\\misc |  | 1 |  |  |  |  | Get from TK |  |
|  |  | Total General |  |  | =SUM(F19:F23) |  |  |  |  | =SUM(L19:L23) |  |
|  |  |  | Grand Total (estimate) |  | =SUM(F4:F5)+F12+E11+SUM(E15:F17)+F24 |  | Grand Total (actual) | =SUM(J6:J10)+SUM(J15:J17) | =SUM(K6:K10)+SUM(K15:K17) | =SUM(L11:L12)+SUM(L15:L17)+SUM(L24)+SUM(L4:L5) |  |
|  |  | Budget: | Hours: |  |  |  |  |  |  |  |  |
|  |  | Budget (check TK or ask PM) |  |  |  |  |  |  |  |  |  |
|  |  | Estimated Effort | =F26 |  |  |  |  |  |  |  |  |
|  |  | Difference (hours) | =D30-D29 |  |  |  |  |  |  |  |  |
|  |  | % Difference to Budget | =D31/D29 |  |  |  |  |  |  |  |  |
|  |  | Actual Effort (hours) | =L26 |  |  |  |  |  |  |  |  |
|  |  | Actual Effort (% Diff to Budget) | =(L26-D29)/D29 |  |  | Assumptions, Areas Not Tested, Other supporting information: |  |  |  |  |  |
|  |  |  |  |  |  | Include in this section any assumptions, areas you will not be testing (but feel you should be) and any other information that will help explain your stategy, risks, etc.  |  |  |  |  |  |

### Notes

- Sylvia Ward:<br>Please fill in with any additional comments.

### Merged Cells

- A18:H18
- A15:H15
- I2:M2
- D26:E26
- A6:H6


## CRs

### Overview

### Data

| Area Path | Iteration Path | ID | Title | QA Writing Est | QA Testing Est | Focus Priority (1-4) | Comments | Link |
|---|---|---|---|---|---|---|---|---|
| PFEvatec\\WF06 (Logbook)\\Magnet Systems | Phase 2\\R10\\R10.2 | 286067 | Ticket #35008 - Tracking of magnet systems in Evatec Fabric | 3 | 12 | 1 | Impacts:<br>- 32 requirements.<br>QA Writing Approach:<br>- Test case writing with assistance from Copilot for formatting to expedite. Happy path and unhappy path scenarios planned with edge cases and  targeted regression cases for the multiple impacted areas.<br>QA Testing Approach:<br>- Verify Magnet System Type and Magnet System functionality, document management, permissions, inspection tracking, overdue calculations, and filter behavior.<br>- Validate lifecycle workflows: checkout, return, install, uninstall, replace, retire, and label/QR generation.<br>- Validate Standard to Prototype workflows including variant numbering, lineage, Article Number uniqueness, and promotion to Standard preserving associations.<br>- Verify Hardware Configuration integration including the new Magnet System role type and serial number enforcement.<br>- Validate Magnet System History and Logbook synchronization across all lifecycle events.<br>- Verify Export Hardware Configuration includes Magnet System details.<br>- Validate database migrations, entity relationships, and conversion of existing Hardware Components to Magnet Systems.<br>- Perform regression testing on impacted areas.<br>Potential Issues:<br>- Highest-risk area of the release with broad cross-module impact across Hardware Configuration, Logbook, History, and Export.<br>- Prototype lifecycle, Article Number uniqueness, and Standard/Prototype promotion may cause defects in lineage, history, or association preservation.<br>- Migration of existing Hardware Components and Magnet System ↔ Logbook synchronization carry the highest regression and data-integrity risk. | Change Request 286067: Ticket #35008 - Tracking of magnet systems in Evatec Fabric |
| PFEvatec\\WF06 (Logbook)\\HW Config | Phase 2\\R10\\R10.2 | 285729 | Ticket #34951 - Search HW components | 0.25 | 1 | 2 | Impacts:<br>- 3 requirements.<br>QA Writing Approach:<br>- Test case writing with assistance from Copilot for formating to expadite.Happy path and unhappy path scenarios planned with edge cases and regressions around modified requirements.<br>QA Testing Approach:<br>- Verify Search HW Components functionality across all impacted areas.<br>- Execute positive, negative, partial-match, and no-result search scenarios.<br>- Validate installed hardware components are returned correctly in search results.<br>- Confirm consistent filtering, search results, and display behavior across all supported pages.<br>Potential Issues:<br>- Differences in page-level data loading, indexing, or caching could lead to inconsistent search behavior across the impacted areas. | Change Request 285729: Ticket #34951 - Search HW components |
| PFEvatec | Phase 2\\R10\\R10.2 | 286836 | Ticket #34948 - Article import | 0.5 | 1.5 | 3 | Impacts:<br>- 2 requirements.<br>QA Writing Approach:<br>- Test cases will be created with Copilot assistance to expadite formatting and writing process, covering happy path, unhappy path, edge cases, and regression scenarios for impacted functionality.<br>QA Testing Approach:<br>- QA will verify custom import formats and mappings.<br>- QA will validate hardware component imports using legacy and new file formats.<br>- QA will confirm field mappings and numeric status values import correctly.<br>- QA will verify partial imports do not incorrectly deactivate valid hardware components.<br>- QA will perform regression testing on BOM Import, Work Order Import, and Hardware Component import workflows.<br>Potential Issues:<br>- Incorrect mappings may result in invalid imported data.<br>- Import framework changes could affect existing import workflows.<br>- Partial imports may incorrectly deactivate hardware components.<br>- QA will validate import behavior and responsiveness for large import files. | Change Request 286836: Ticket #34948 - Article import |
| PFEvatec\\WF02 (Box and Substrates)\\Box Management | Phase 2\\R10\\R10.2 | 284111 | Ticket #34682 - WBS Element for self-service boxes | 0.25 | 0.5 | 4 | Impacts:<br>- 2 requirements<br>QA Writing Approach:<br>- Test case writing with assistance from Copilot for formating to expadite. Happy path, unhappy path scenarios planned with some edge cases and regressions around modified requirements. <br>QA Testing Approach:<br>- Verify the WBS Element field across all impacted pages.<br>- Create and edit self-service boxes with WBS Element values.<br>- Confirm WBS Element values save correctly and persist after updates.<br>- Validate consistent display of WBS Element values across all applicable pages.<br>- Verify WBS Element values remain available and functional in related workflows.<br>Potential Issues:<br>- Differences in how each page loads or caches data could lead to inconsistent WBS Element behavior.<br><br> | Change Request 284111: Ticket #34682 - WBS Element for self-service boxes |
| PFEvatec | Phase 2\\R10\\R10.2 | 290161 | Ticket #35623 - Error: Use PDT to create the tool definition for new tool type | 0 | 0 | N/A | Impacts:<br>- 0 requirements.<br>Note:<br>- This item was logged as a CR because it introduces support for a new tool type rather than fixing an existing defect.<br>- The change was delivered as a customer patch to unblock Hermann's tool setup activity.<br>- Hermann validated the fix in his environment and closed the ticket.<br>- No additional internal QA testing is planned.<br> | Change Request 290161: Ticket #35623 - Error: Use PDT to create the tool definition for new tool type |
|  |  |  | Ad Hoc Verification Time: | 0 | 3 |  | Allocate ad hoc verification time for exploratory testing and validation of impacted workflows not explicitly covered by formal test cases. |  |
|  |  |  | Total Est Time: | =SUM(E2:E7) | =SUM(F2:F7) |  |  |  |


## Bugs

### Overview

### Metadata

- Bugs

### Data

| Area Path | Iteration Path | ID | Title |   | QA Verification Est | Priority (1-4) | Comments | Link |
|---|---|---|---|---|---|---|---|---|
| PFEvatec | PFEvatec\\Phase 2\\R10\\R10.1 | 285795 | Ticket #34217 - Article # with Project # in the Projects table |  | 0.5 | 2 | QA will do a quick sweep of related impacted UI areas to make sure nothing breaks from change related to bug. | Bug Ticket #34217 - Article # with Project # in the Projects table |
|  |  |  |  | Additional Est Verification Time: | 6.5 |  | Rationale: Accounts for expected incoming bugs requiring verification. Estimate is based on the average bug verification effort observed during previous releases. |  |
|  |  |  |  | Total Est Time: | =SUM(F3:F4) |  |  |  |


## Test Environments & VMs

### Overview

### Data

| Test Environments & VMs |   |   |
|---|---|---|
| Every project release requires testing on a specific environment (i.e., Windows 10 Enterprise LTSC 2019, 64-bit) or on multiple environments (i.e., development environment, regression testing, etc.). It is important to clarify in this section what environment(s) and what VM(s) you will be using / will need set up. If testing on multiple environments, list each test environment and VM separately. |  |  |
| Product version: | <Product name (i.e., PTO, EIB, PFSC) and version number> |  |
| License type to use:  | 64bit, EDA, SECS/GEM, 300mm, E10, VA |  |
| Test environment: | <OS system/version> |  |
| VM available: | <Yes/No> | <VM Name> |

### Notes

- Kristen Matsumoto:<br>It is important to specify which license to use as there are many options. If not sure, ask your manager.
- Tina Chonko:<br>If testing in a development environment, indicate the version of Visual Studio and .NET used for testing.
- Tina Chonko:<br>Indicate VM to use or if one must still be set up. View the VM List on PEERHub for details about available VMs: https://vmlist.peergroup.com/

### Merged Cells

- A3:D3


## Template Info & Doc Control

### Overview

### Data

| Template Information: |   |
|---|---|
| This template is intended for small/simple projects/product releases (e.g., service packs). Use the following guidelines:<br><br>-  QA effort is ~80 hours or less. If it is more, then you need permission from your project/product Manager to use the mini-STP.<br>-  Only 1 QA resource. If 2 QA resources (but other criteria apply), then add a Resource column to the right of the Timekeeping column. If >2 then use full STP.<br>-  There is no "manage" activity in the template because it is assumed it is small enough that it is not needed. It can be added if needed.<br>-  Do not use this STP template if testing SEMI standard changes (product) or kicking off test automation initiatives.<br>-  There is no "task" column because it is assumed that the Test task(s) will be linked to the Requirement/CR/Bug listed in each row.<br><br>Basically, if you find that this template requires too much modification to outline your test strategy, then use the full STP. |  |
| Document Control Information: |  |
| Template Version: | 1.2 |
| Release Date: | February 10, 2022 |
| Document Owner: | Sylvia Ward |
| Approvers: | Services Management Team |
| Next Review Date: | February 10, 2024 |
| Expiration Date: | May 10, 2024 |

### Merged Cells

- A3:B3
- A1:B1
