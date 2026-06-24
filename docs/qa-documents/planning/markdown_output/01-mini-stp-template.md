---
title: Mini STP1
source: Mini STP1.xlsx
document_type: Mini STP
---

# Mini STP1

> Source: `Mini STP1.xlsx`

## Contents

- [Overview](#overview)
- [Test Environments & VMs](#test-environments-vms)
- [Template Info & Doc Control](#template-info-doc-control)

---

## Overview

**[Project TK and customer] Release - [Description] Mini Software Test Plan**

**Wrap-up: Actuals and analysis/comments**

| Rqmt/CR/Bug ID | Work Item Type |  | Timekeeping | Writing Estimate | Testing Estimate | Comments | Azure Writing Actuals | Azure Testing Actuals | Timekeeping Actuals | Comments |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  | Prepare Software Test Plan | Sys-Testing\plan |  | 1 |  |  |  | Get from TK |  |
**New Functionality**

| [Rqmt ID] | Requirement | Requirement description | 2 | 4 | Get From Azure | Get From Azure |
| --- | --- | --- | --- | --- | --- | --- |
| [Bug ID] | Bug | Bug description | 0.25 | 3 | Get From Azure | Get From Azure |
| [CR ID] | CR | CR description | 1 | 2 | Get From Azure | Get From Azure |
| n/a | Ad hoc testing | Sys-Testing\QA Test | 2 | Get From Azure | Get From Azure |
| --- | --- | --- | --- | --- | --- |
| Total New - Writing | Sys-Testing\write | 3.25 |  | 0 |  | Get from TK | Comment if Azure & TK significantly different |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Total New - Testing | Sys-Testing\QA Test |  | 11 |  | 0 | Get from TK | Comment if Azure & TK significantly different |
**Regression**

| Total Regression | Sys-Testing\regression | 0 | 4 | Describe your regression areas/strategy here. Add a tab if needed.  ATP prep & execution go here. | Get from Azure | Get from Azure | Get from TK |
| --- | --- | --- | --- | --- | --- | --- | --- |
**General / Other**

| Consult time with Dev | Sys-Testing \consult | 2 |  | Get from TK |
| --- | --- | --- | --- | --- |
| Environment Setup, installing builds | Sys-Testing \setup | 1 |  | Get from TK |
| Bug verification | Sys-Testing\verify | 2 |  | Get from TK |
| Test case reviews | Sys-Testing\review | 1 |  | Get from TK |
| Wrap up | Sys-Testing\report | 1 | Include putting transferable items (scripts) in appropriate fileshare locations. | Get from TK |
| Unplanned changes / contingency | Sys-Testing\misc | 2 |  | Get from TK |
| Update PFS | Sys-Testing\misc | 1 |  |  |
| Total General |  | 10 |  | 0 |
| Grand Total (estimate) | Grand Total (estimate) | 29.25 | Grand Total (actual) | 0 | 0 | 0 |
| --- | --- | --- | --- | --- | --- | --- |
| Budget: | Hours: |  |
| --- | --- | --- |
| Budget (check TK or ask PM) | 30 |  |
| Estimated Effort | 29.25 |  |
| Difference (hours) | -0.75 |  |
| % Difference to Budget | -2.5000000000000001E-2 |  |
| Actual Effort (hours) | 0 |  |
| Actual Effort (% Diff to Budget) | -1 | Assumptions, Areas Not Tested, Other supporting information: |
**Include in this section any assumptions, areas you will not be testing (but feel you should be) and any other information that will help explain your stategy, risks, etc.**


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
