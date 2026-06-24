---
title: Evatec Factory - Release 10.0.0.8 - Mini STP
source: Evatec Factory - Release 10.0.0.8 - Mini STP - Updated.xlsx
version: 10.0.0.8
document_type: Mini STP
---

# Evatec Factory - Release 10.0.0.8 - Mini STP

> Source: `Evatec Factory - Release 10.0.0.8 - Mini STP - Updated.xlsx`

## Contents

- [Overview](#overview)
- [Change Requests](#change-requests)
- [Template Info & Doc Control](#template-info-doc-control)

---

## Overview

**Evatec Factor - Release 10.0.0.8 - Mini Software Test Plan**

**Wrap-up: Actuals and analysis/comments**

| Rqmt/CR/Bug ID | Work Item Type |  | Timekeeping | Writing Estimate | Testing Estimate | Comments | Azure Writing Actuals | Azure Testing Actuals | Timekeeping Actuals | Comments |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  | Prepare Software Test Plan | Sys-Testing\plan |  | 1 |  |  |  | Get from TK |  |
**New Functionality**

| Change Requests | Ad hoc testing | Sys-Testing\QA Test | 1 | 2 | Information found on Change Requests tab | Get From Azure | Get From Azure |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  | Total New - Writing | Sys-Testing\write | 3 |  |  | 0 |  | Get from TK | Comment if Azure & TK significantly different |
|  | Total New - Testing | Sys-Testing\QA Test |  | 17 |  |  | 0 | Get from TK | Comment if Azure & TK significantly different |
**Regression**

| Total Regression | Sys-Testing\regression | 0 | 0.5 | Perform quick manual smoke test around changes | Get from Azure | Get from Azure | Get from TK |
| --- | --- | --- | --- | --- | --- | --- | --- |
**General / Other**

| Consult time with Dev | Sys-Testing \consult | 0.5 |  | Get from TK |
| --- | --- | --- | --- | --- |
| Environment Setup, installing builds | Sys-Testing \setup | 3 | Haven't set up environments in awhile, which can introduce some complexity | Get from TK |
| Bug verification | Sys-Testing\verify | 5 | Four external bugs to verify, adding some time for internal issues as well | Get from TK |
| Unplanned changes / contingency | Sys-Testing\misc | 1 |  | Get from TK |
| Total General |  | 9.5 |  | 0 |
| Grand Total (estimate) | Grand Total (estimate) | 31 | Grand Total (actual) | 0 | 0 | 0 |
| --- | --- | --- | --- | --- | --- | --- |
| Budget: | Hours: |  |
| --- | --- | --- |
| Budget (check TK or ask PM) | 40 |  |
| Estimated Effort | 31 |  |
| Difference (hours) | -9 |  |
| % Difference to Budget | -0.22500000000000001 |  |
| Actual Effort (hours) | 0 |  |
| Actual Effort (% Diff to Budget) | -1 | Assumptions, Areas Not Tested, Other supporting information: |
**Include in this section any assumptions, areas you will not be testing (but feel you should be) and any other information that will help explain your stategy, risks, etc.**


---

## Change Requests

### Change Requests

| Area Path | Iteration Path | ID | Title | Developer Estimate |  | QA Writing Est | QA Testing Est | Comments | Link |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PFEvatec\WF00 (Core) | PFEvatec\Phase 2\R10\R10.0\R10.0.8 | 228689 | Ticket #23360 - Sorting predefiend type values |  |  | 0.25 | 0.5 |  |  |
| PFEvatec\WF06 (Logbook)\HW Config | PFEvatec\Phase 2\R10\R10.0\R10.0.8 | 231083 | Ticket #23423 - collapse all in hardware list |  |  | 0.25 | 0.25 |  |  |
| PFEvatec\WF02 (Box and Substrates) | PFEvatec\Phase 2\R10\R10.0\R10.0.8 | 233500 | Ticket #24059 - Automatic ECL Box Reminder |  |  | 0.25 | 0.75 |  |  |
| PFEvatec\WF08 (DB)\BPS | PFEvatec\Phase 2\R10\R10.0\R10.0.8 | 269207 | Ticket #32097 - Project (Work Order) upload from Excel |  |  | 0.25 | 0.5 |  |  |
| PFEvatec\WF04 (Substrate Browsing and Analysis)\Substrates | PFEvatec\Phase 2\R10\R10.0\R10.0.8 | 225471 | Ticket #22904 - Modify Tracking data |  |  | 1 | 8 |  |  |
| PFEvatec\WF03 (Process and Measure) | PFEvatec\Phase 2\R10\R10.0\R10.0.8 | 235679 | Ticket #29725 - Store files/manual data against modules |  |  | 1 | 7 |  |  |
|  |  |  |  |  | Total Est Time: | 3 | 17 |  |  |

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
