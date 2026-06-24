---
title: Evatec Factory - Release 10.0.0.6 - Mini STP
source: Evatec Factory - Release 10.0.0.6 - Mini STP.xlsx
version: 10.0.0.6
document_type: Mini STP
---

# Evatec Factory - Release 10.0.0.6 - Mini STP

> Source: `Evatec Factory - Release 10.0.0.6 - Mini STP.xlsx`

## Contents

- [Overview](#overview)
- [Change Requests](#change-requests)
- [Test Environments & VMs](#test-environments-vms)
- [Template Info & Doc Control](#template-info-doc-control)

---

## Overview

**Evatec Factor - Release 10.0.0.6 - Mini Software Test Plan**

**Wrap-up: Actuals and analysis/comments**

| Rqmt/CR/Bug ID | Work Item Type |  | Timekeeping | Writing Estimate | Testing Estimate | Comments | Azure Writing Actuals | Azure Testing Actuals | Timekeeping Actuals | Comments |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  | Prepare Software Test Plan | Sys-Testing\plan |  | 2 |  |  |  | Get from TK |  |
**New Functionality**

| Change Requests | Ad hoc testing | Sys-Testing\QA Test | 4 | 16 | Information found on Change Requests tab | Get From Azure | Get From Azure |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  | Total New - Writing | Sys-Testing\write | 4 |  |  | 0 |  | Get from TK | Comment if Azure & TK significantly different |
|  | Total New - Testing | Sys-Testing\QA Test |  | 16 |  |  | 0 | Get from TK | Comment if Azure & TK significantly different |
**Regression**

| Total Regression | Sys-Testing\regression | 0 | 4 | Describe your regression areas/strategy here. Add a tab if needed.  ATP prep & execution go here. | Get from Azure | Get from Azure | Get from TK |
| --- | --- | --- | --- | --- | --- | --- | --- |
**General / Other**

| Consult time with Dev | Sys-Testing \consult | 1 |  | Get from TK |
| --- | --- | --- | --- | --- |
| Environment Setup, installing builds | Sys-Testing \setup | 4 | Haven't set up environments in awhile, may introduce some complexity | Get from TK |
| Bug verification | Sys-Testing\verify | 7 | Eight bugs to verify, expecting others as well | Get from TK |
| Reviewing spec | Sys-Testing\review | 1 |  | Get from TK |
| Unplanned changes / contingency | Sys-Testing\misc | 1 |  | Get from TK |
| Total General |  | 14 |  | 0 |
| Grand Total (estimate) | Grand Total (estimate) | 40 | Grand Total (actual) | 0 | 0 | 0 |
| --- | --- | --- | --- | --- | --- | --- |
| Budget: | Hours: |  |
| --- | --- | --- |
| Budget (check TK or ask PM) | 40 |  |
| Estimated Effort | 40 |  |
| Difference (hours) | 0 |  |
| % Difference to Budget | 0 |  |
| Actual Effort (hours) | 0 |  |
| Actual Effort (% Diff to Budget) | -1 | Assumptions, Areas Not Tested, Other supporting information: |
**Include in this section any assumptions, areas you will not be testing (but feel you should be) and any other information that will help explain your stategy, risks, etc.**


---

## Change Requests

### Change Requests

| Area Path | Iteration Path | ID | Title | Developer Estimate |  | QA Writing Est | QA Testing Est | Comments | Link |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PFEvatec\WF01 (Tool Configuration)\Modules | PFEvatec\Phase 2\R10\R10.0\R10.0.6 | 211377 | Ticket #20867 - Create / Manage Modules for File Tools | 12 |  | 1 | 4 |  |  |
| PFEvatec\WF04 (Substrate Browsing and Analysis)\History | PFEvatec\Phase 2\R10\R10.0\R10.0.6 | 214983 | Ticket #19857 - Manual tool - edit data | 12 |  | 1 | 5 |  |  |
| PFEvatec\WF01 (Tool Configuration)\Tools\SECS-GEM | PFEvatec\Phase 2\R10\R10.0\R10.0.6 | 233611 | Ticket #24299 - Module positions only once in Tool View | 1 |  | 0.25 | 0.5 |  |  |
| PFEvatec\WF08 (DB) | PFEvatec\Phase 2\R10\R10.0\R10.0.6 | 261053 | Ticket #29110 - Manual data input of Work Orders | 4 |  | 0.5 | 1.5 |  |  |
| PFEvatec | PFEvatec\Phase 2\R10\R10.0\R10.0.6 | 261151 | Ticket #28140 - Display of chuck number for BPME tools | 8 |  | 1.25 | 3 |  |  |
|  |  |  |  |  | Total Est Time: | 4 | 14 |  |  |

---

## Test Environments & VMs

### Test Environments & VMs

**Every project release requires testing on a specific environment (i.e., Windows 10 Enterprise LTSC 2019, 64-bit) or on multiple environments (i.e., development environment, regression testing, etc.). It is important to clarify in this section what environment(s) and what VM(s) you will be using / will need set up. If testing on multiple environments, list each test environment and VM separately.**

| Product version: | <Product name (i.e., PTO, EIB, PFSC) and version number> |
| --- | --- |
| License type to use: | 64bit, EDA, SECS/GEM, 300mm, E10, VA |
| Test environment: | <OS system/version> |  |
| --- | --- | --- |
| VM available: | <Yes/No> | <VM Name> |

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
