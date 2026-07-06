---
title: STTD WW05 GLP - Mini STP
source: STTD WW05 GLP - Mini STP.xlsx
document_type: Mini STP
---

# STTD WW05 GLP - Mini STP

> Source: `STTD WW05 GLP - Mini STP.xlsx`

## Contents

- [Overview](#overview)
- [Requirements](#requirements)
- [Test Environments & VMs](#test-environments-vms)
- [Template Info & Doc Control](#template-info-doc-control)

---

## Overview

**3401INT GLP TA/TC PTO 9 - Summit - Release - WW05 GLP - Mini Software Test Plan**

**Wrap-up: Actuals and analysis/comments**

| Rqmt/CR/Bug ID | Work Item Type |  | Timekeeping | Writing Estimate | Testing Estimate | Comments | Azure Writing Actuals | Azure Testing Actuals | Timekeeping Actuals | Comments |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  | Prepare Software Test Plan | 3401INT GLP TA PTO 9\Sys-Testing\plan | 3 |  | Time est. includes draft, review, and edits after suggestions |  |  | Get from TK |  |
**New Functionality**

| TA Requirements | See 'Requirements' tab for detailed breakdown | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\<QA Test - Write> | 10 | 27 | TA requirements for GLP are the bulk of writing and testing | Get From Azure | Get From Azure |
| --- | --- | --- | --- | --- | --- | --- | --- |
| TC Requirements | See 'Requirements tab for detailed breakdown | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\<QA Test - Write> | 2 | 10 | TC requirements for GLP are all focused on SkyRunner suite | Get From Azure | Get From Azure |
| n/a | Ad hoc testing | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\QA Test |  | 7 | This includes estimated time for abnormal testing | Get From Azure | Get From Azure |
| Total New - Writing | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\QA Write | 12 |  | Writing includes abnormal and non-happy path tests | 0 |  | Get from TK | Comment if Azure & TK significantly different |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Total New - Testing | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\QA Test |  | 44 | Testing includes abnormal and non-happy paths |  | 0 | Get from TK | Comment if Azure & TK significantly different |
**Regression**

| Total Regression | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\Regression | 0 | 5 | Targeted manual regression on impacted areas and SkyRunner automated tests | Get from Azure | Get from Azure | Get from TK |
| --- | --- | --- | --- | --- | --- | --- | --- |
**General / Other**

| n/a | Consult time with Dev | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\Consult | 0.5 | Note: I did not create tasks for this item, will just be added to time keeping | Get from TK |
| --- | --- | --- | --- | --- | --- |
| n/a | Environment Setup, installing builds | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\Setup | 2 | Note: I did not create tasks for this item, will just be added to time keeping | Get from TK |
| n/a | Bug verification | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\Verify | 6 | Note: I did not create tasks for this item, will just be added to time keeping | Get from TK |
| n/a | Test case reviews | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\Review | 1 | Note: I did not create tasks for this item, will just be added to time keeping | Get from TK |
| n/a | Release | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\Release | 4 | Note: I did not create tasks for this item, will just be added to time keeping | Get from TK |
| n/a | Unplanned changes / contingency | 3401INT GLP <TA-TC> PTO 9\Sys-Testing\Misc | 0.5 | Note: I did not create tasks for this item, will just be added to time keeping | Get from TK |
|  | Total General |  | 14 |  | 0 |
| Grand Total (estimate) | Grand Total (estimate) | 75 | Grand Total (actual) | 0 | 0 | 0 |
| --- | --- | --- | --- | --- | --- | --- |
| Budget: | Hours: |  |
| --- | --- | --- |
| Budget (check TK or ask PM) | 60 |  |
| Estimated Effort | 75 |  |
| Difference (hours) | 15 |  |
| % Difference to Budget | 0.25 |  |
| Actual Effort (hours) | 0 |  |
| Actual Effort (% Diff to Budget) | -1 | Assumptions, Areas Not Tested, Other supporting information: |
**Include in this section any assumptions, areas you will not be testing (but feel you should be) and any other information that will help explain your stategy, risks, etc.**


---

## Requirements

**Requirements**

| Area Path | Iteration Path | ID | Requirement | Developer Estimate |  | QA Writing Est | QA Testing Est | Comments | Link |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252929 | PickAndPlaceBuffer Refactor (Tool Model) | 24 |  | 0.5 | 2.5 | Mostly tested by Hardware during integration, we don't need to go through hardware. Base testing can be performed. | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252929 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252933 | Tray Scheduler (Tool Model) | 8 |  | 1 | 2 | Need to confirm that no tray dispatching occurs | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252933 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252930 | Chiller Component (Tool Model) | 4 |  | 0.5 | 0 | No changes made -Should be tested during regression. | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252930 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252931 | LTIM Component (Tool Model) | 4 |  | 0.5 | 0 | No changes made -Should be tested during regression. | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252931 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252932 | Unit Scheduler (Tool Model) | 32 |  | 2 | 3 | Extensive changes for this task, may require more time than estimate, majority of work appears to be on developer side | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252932 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252934 | Simulation (Internal Services) | 4 |  | 1 | 4 | Extensive changes for this task, may require more time than estimate, majority of work appears to be on developer side | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252934 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252935 | SkyRunner Support (Simulation) | 12 |  | 0.5 | 1 | May overlap with SkyRunner TC testing | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252935 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252936 | Recipe Service (Internal Services) | 8 |  | 0.5 | 1.5 | Should be able to utilize chiller recipe --> via hdmx. Test multiple hdmx recipes with hdmx | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252936 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252937 | Component Monitoring Service (Internal Services) | 6 |  | 0 | 0 | Confirm not required to test. Will be tested during integration. | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252937 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252938 | TC Lite Cycling (Internal Services) | 6 |  | 2.5 | 10 | Changes to TC Lite Cycling could cause issues (issue prone area based on other testing). Confirm changes to existing funcitonality, can compare with earlier builds for reference. This should be bulk of testing. | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252938 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252939 | RAL Cycling (TC Lite Cycling) | 20 |  | 1 | 3 | Important requirement - should be tested at same time as other TC Lite Cycling as well | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252939 |
| PTOAEM\Summit\GLP | PTOAEM\Horizon\Skyline 4.0\2025\WW06 GLP | 252940 | GLP Backwards Compatibility (External Interfaces) | 40 |  | 0 | 0 | Testing for this can only be done by dev unit tests or during integration. Testing time should instead be utilized for regression | https://ops1.peergroup.com/DefaultCollection/PTOAEM/_workitems/edit/252940 |
|  |  |  |  |  | Total Est Time: | 10 | 27 | Add these values to main Overview tab |  |
| PTOIntelTester\Summit\GLP | PTOIntelTester\Horizon\Skyline 4.0\2025\WW06 GLP | 259685 | SkyRunner RAL Loading (SkyRunner) | 8 |  | 1 | 3 | Confirming functionality in logs after running tests in Kubernetes, could run tests locally as well to confirm  - regression --- > multiprocess step --> binning.... | https://ops1.peergroup.com/DefaultCollection/PTOIntelTester/_workitems/edit/259685 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PTOIntelTester\Summit\GLP | PTOIntelTester\Horizon\Skyline 4.0\2025\WW06 GLP | 259686 | SkyRunner TestPlan Definition (SkyRunner) | 16 |  | 1 | 7 | Ensure SkyRunner test plan created by developer targets required areas and tests are functional. Brendan is writing so time for QA would mostly be updating test suite / executing tests / logging results / failed. | https://ops1.peergroup.com/DefaultCollection/PTOIntelTester/_workitems/edit/259686 |
|  |  |  |  |  | Total Est Time: | 2 | 10 | Add these values to main Overview tab |  |
**Digital UNIT --> covered --- >  .. ad hoc / tc lite cycling**

**Manual trays in ad hoc regression -->**


---

## Test Environments & VMs

### Test Environments & VMs

**Every project release requires testing on a specific environment (i.e., Windows 10 Enterprise LTSC 2019, 64-bit) or on multiple environments (i.e., development environment, regression testing, etc.). It is important to clarify in this section what environment(s) and what VM(s) you will be using / will need set up. If testing on multiple environments, list each test environment and VM separately.**

| Product version: | 3401INT GLP TA/TC PTO 9 |
| --- | --- |
| License type to use: | PTO 9 |
| Test environment: | Linux Container |  |
| --- | --- | --- |
| VM available: | Yes - but not required. | hbi1064ql14-qa1 |

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
