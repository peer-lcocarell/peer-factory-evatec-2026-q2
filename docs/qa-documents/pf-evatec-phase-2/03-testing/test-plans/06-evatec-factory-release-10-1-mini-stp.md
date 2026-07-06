---
title: Copy of Evatec Factory - Release 10.1 - Mini STP
source: Copy of Evatec Factory - Release 10.1 - Mini STP - Updated.xlsx
version: 10.1
document_type: Mini STP
---

# Copy of Evatec Factory - Release 10.1 - Mini STP

> Source: `Copy of Evatec Factory - Release 10.1 - Mini STP - Updated.xlsx`

## Contents

- [Overview](#overview)
- [Change Requests](#change-requests)
- [Bugs](#bugs)
- [Template Info & Doc Control](#template-info-doc-control)

---

## Overview

**Evatec Factor - Release 10.1 - Mini Software Test Plan**

**Wrap-up: Actuals and analysis/comments**

| Rqmt/CR/Bug ID | Work Item Type |  | Timekeeping | Writing Estimate | Testing Estimate | Comments | Azure Writing Actuals | Azure Testing Actuals | Timekeeping Actuals | Comments |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  | Prepare Software Test Plan | Sys-Testing\plan |  | 4 | Writing mini STP, creating tasks and test suites |  |  | Get from TK |  |
**New Functionality**

| Change Requests | Ad hoc testing | Sys-Testing\QA Test |  | 5.25 | Information found on Change Requests tab | Get From Azure | Get From Azure |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  | Total New - Writing | Sys-Testing\write | 2 |  |  | 0 |  | Get from TK | Comment if Azure & TK significantly different |
|  | Total New - Testing | Sys-Testing\QA Test |  | 13 |  |  | 0 | Get from TK | Comment if Azure & TK significantly different |
**Regression**

| Total Regression | Sys-Testing\regression | 3 | Perform quick manual smoke test around changes | Get from Azure | Get from Azure | Get from TK |
| --- | --- | --- | --- | --- | --- | --- |
**General / Other**

| Consult time with Dev | Sys-Testing \consult | 1 |  | Get from TK |
| --- | --- | --- | --- | --- |
| Environment Setup, installing builds | Sys-Testing \setup | 3.5 | Haven't set up environments in awhile, which can introduce some complexity | Get from TK |
| Bug verification | Sys-Testing\verify | 7 | Information found on Bugs tab | Get from TK |
| Unplanned changes / contingency | Sys-Testing\misc | 1.5 |  | Get from TK |
| Total General |  | 13 |  | 0 |
| Grand Total (estimate) | Grand Total (estimate) | 35 | Grand Total (actual) | 0 | 0 | 0 |
| --- | --- | --- | --- | --- | --- | --- |
| Budget: | Hours: |  |
| --- | --- | --- |
| Budget (check TK or ask PM) | 40 |  |
| Estimated Effort | 35 |  |
| Difference (hours) | -5 |  |
| % Difference to Budget | -0.125 |  |
| Actual Effort (hours) | 0 |  |
| Actual Effort (% Diff to Budget) | -1 | Assumptions, Areas Not Tested, Other supporting information: |
**Include in this section any assumptions, areas you will not be testing (but feel you should be) and any other information that will help explain your stategy, risks, etc.**


---

## Change Requests

### Change Requests

| Area Path | Iteration Path | ID | Title |  | QA Writing Est | QA Testing Est | Priority (1-4) | Comments | Link |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PFEvatec\WF00 | PFEvatec\Phase 2\R10\R10.1 | 281622 | Ticket #34214 - All/Active switch |  | 0.75 | 2 | 3 | Impacts: - 6 requirements. QA Testing Approach: - QA will verify the new All/Active switch works across all listed pages by toggling item visibility and confirming consistent updates. Potential Issues: - Differences in how each page loads or caches data could lead to inconsistent filtering behavior. | Change Request 281622: Ticket #34214 - All/Active switch - Boards |
| PFEvatec\WF08 (DB) | PFEvatec\Phase 2\R10\R10.1 | 281625 | Ticket #34217 - Replace BPS # with Article # |  | 0.5 | 1.5 | 4 | Impacts: - 38 requirements. QA Testing Approach: - QA will review all pages where 'BPS #' appears and confirm it is fully replaced with 'Article #', ensuring table headers, labels, and related UI text update consistently. Potential Issues: - Large amount of areas impacted. Need to ensure areas are not skipped in the UI. | Change Request 281625: Ticket #34217 - Replace BPS # with Article # - Boards |
| PFEvatec\ | PFEvatec\Phase 2\R10\R10.1 | 282163 | Ticket #34211 - Multiple selection for filters |  | 0.5 | 3 | 3 | Impacts:  - No specific requirements are connected but in the description it lists 11  modules across the application. QA Testing Approach:  - QA will confirm that all updated lists correctly support multi‑select filtering by using the new Checkbox List control in the affected areas and ensuring that filtering behaves consistently and returns accurate results. Potential Issues:  - Large number of impacted areas increases the risk of inconsistent filter behavior or missed locations. | Change Request 282163: Ticket #34211 - Multiple selection for filters - Boards |
| PFEvatec\WF06 (Logbook)\Targets | PFEvatec\Phase 2\R10\R10.1 | 282737 | Ticket #34444 - Possibility to attach documents to target types |  | 0.25 | 0.75 | 1 | Impacts:  - Impacts three requirements. QA Testing Approach:  - QA will verify that documents can be attached, viewed, and removed for target types, following the same workflow used for individual targets, and will ensure the UI and storage behavior remain consistent. Potential Issues:  - Adding document functionality to a new area may expose inconsistencies with existing attachment workflows or permission handling. | Change Request 282737: Ticket #34444 - Possibility to attach documents to target types - Boards |
|  |  |  |  | Ad Hoc Verification Time: |  | 5.75 |  | Because the changes impact many areas of the application, verify that ad hoc testing is performed for all affected components in each CR. |  |
|  |  |  |  | Total Est Time: | 2 | 13 |  |  |  |

---

## Bugs

**Bugs**

| Area Path | Iteration Path | ID | Title |  | QA Verification Est | Priority (1-4) | Comments | Link |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PFEvatec | PFEvatec\Phase 2\R10\R10.1 | 282022 | Ticket #34273 - Selector in Projects/Tags column |  | 0.5 | 3 | QA will recreate the tag setup, check that tags display clearly in the filter, and do a quick sweep of related UI areas to make sure nothing else breaks. | Bug 282022: Ticket #34273 - Selector in Projects/Tags column - Boards |
| PFEvatec | PFEvatec\Phase 2\R10\R10.1 | 282564 | Ticket #34349 - Wrong Percentage Target Erosion calculation |  | 0.5 | 2 | QA will enter the affected targets and thickness values, verify the erosion percentage now uses the correct reference, and spot‑check a few other targets for consistent calculation. | Bug 282564: Ticket #34349 - Wrong Percentage Target Erosion calculation - Boards |
| PFEvatec | PFEvatec\Phase 2\R10\R10.1 | 282588 | Ticket #34371 - Excel import, special characters not imported |  | 0.5 | 2 | QA will import Excel files containing special characters, verify they now appear correctly in all fields, and run a few extra imports to confirm consistent behavior. | Bug 282588: Ticket #34371 - Excel import, special characters not imported - Boards |
| PFEvatec/WF08 (DB) | PFEvatec\Phase 2\R10\R10.1 | 281623 | Ticket #34215 - BPS data - Work Orders table - filter not working |  | 0.5 | 1 | QA will confirm that filtering in the Work Orders table now updates the displayed rows correctly and will also verify a few other tables that use the same filter control to ensure the filter behaves consistently across the app. | Bug 281623: Ticket #34215 - BPS data - Work Orders table - filter not working - Boards |
| PFEvatec/WF06 (Logbook)/Targets | PFEvatec\Phase 2\R10\R10.1 | 281624 | Ticket #34216 - Used Targets are shown as "New" |  | 1 | 1 | QA will create targets, add measurements, and verify the status correctly shifts from New to Used, and will also check a few similar cases for consistent behavior while noting that target‑related bugs usually require more detailed verification than other areas. | Bug 281624: Ticket #34216 - Used Targets are shown as "New" - Boards |
|  |  |  |  | Ad Hoc Verification Time: | 1.5 |  | Testing around issues found, or during verification of impacted areas |  |
|  |  |  |  | Additional Verification Time: | 2.5 |  | For any incoming bugs |  |
|  |  |  |  | Total Est Time: | 7 |  |  |  |

---

## Template Info & Doc Control

**Template Information:**

**This template is intended for small/simple projects/product releases (e.g., service packs). Use the following guidelines:

-  QA effort is ~80 hours or less. If it is more, then you need permission from your project/product Manager to use the mini-STP.
-  Only 1 QA resource. If 2 QA resources (but other criteria apply), then add a Resource column to the right of the Timekeeping column. If >2 then use full STP.
-  There is no "manage" activity in the template because it is assumed it is small enough that it is not needed. It can be added if needed.
-  Do not use this STP template if testing SEMI standard changes (product) or kicking off test automation initiatives.
-  There is no "task" column because it is assumed that the Test task(s) will be linked to the Requirement/CR/Bug listed in each row.

Basically, if you find that this template requires too much modification to outline your test strategy, then use the full STP.**

**Document Control Information:**

| Template Version: | 1.2 |
| --- | --- |
| Release Date: | February 10, 2022 |
| Document Owner: | Sylvia Ward |
| Approvers: | Services Management Team |
| Next Review Date: | February 10, 2024 |
| Expiration Date: | May 10, 2024 |

---
