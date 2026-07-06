# R10.2 — Azure DevOps Task Field Baseline

**Date:** 2026-07-06
**Author:** Lev Cocarell
**Budget Reference:** Confirmed 80-hour testing budget (Kevin Bodbyl, 2026-07-06)
**Scope:** Current baseline of R10.2 QA task estimates in Azure DevOps after the 80-hour budget re-plan, the Magnet Systems reallocation, and the Regression → MISC reallocation.

## Current Baseline (11 tasks)

Verified against ADO on 2026-07-06.

### Active / Proposed

| ID | State | OE | RW | CW | Title |
|---|---|---:|---:|---:|---|
| 291908 | Active | 16 | 14.5 | 1.5 | PF Evatec - R10.2 - QA - MISC |
| 291911 | Active | 10 | 10 | 0 | PF Evatec - R10.2 - QA - Verification |
| 292162 | Active | 8 | 7 | 1 | QA Write - Ticket #35008 - Tracking of magnet systems |
| 292217 | Active | 1 | 0.5 | 0.5 | QA Write - Ticket #34951 - Search HW components |
| 291910 | Proposed | 4 | 4 | 0 | PF Evatec - R10.2 - QA - Regression |
| 292161 | Proposed | 23 | 23 | 0 | QA Test - Ticket #35008 - Tracking of magnet systems |
| 292215 | Proposed | 3 | 3 | 0 | QA Test - Ticket #34682 - WBS Element for self-service boxes |
| 292218 | Proposed | 3 | 3 | 0 | QA Test - Ticket #34951 - Search HW components |
| 292219 | Proposed | 3 | 3 | 0 | QA Test - Ticket #34948 - Article import |

### Resolved

| ID | State | OE | RW | CW | Title |
|---|---|---:|---:|---:|---|
| 291909 | Resolved | 7 | 1 | 6 | PF Evatec - R10.2 - QA - Planning and Review |
| 292220 | Resolved | 2 | 1 | 1 | QA Write - Ticket #34948 - Article import |

## Totals

| Grouping | Original Estimate | Remaining Work | Completed Work |
|---|---:|---:|---:|
| Active / Proposed | 71.0 | 68.0 | 3.0 |
| Resolved | 9.0 | 2.0 | 7.0 |
| **Grand Total** | **80.0** | **70.0** | **10.0** |

- Budget: **80 hrs**
- Variance: **0 hrs**

## Bucket Rationale

- **MISC (17 hrs)** — enlarged contingency pool covering ad hoc testing, environment surprises, exploratory testing, and late-breaking scope. Given elevated risk from CR 286067 Magnet Systems, most contingency is consolidated here.
- **Regression (4 hrs)** — deliberately kept small because each CR test task already scopes its own regression coverage, and Verification (11 hrs) handles retest cycles. Reserved for one focused cross-module regression pass late in the cycle.
- **Verification (11 hrs)** — bug verification, hotfix validation, retesting across the release window.

## Magnet Systems (CR 286067) Split

- QA Testing (292161): 23 hrs remaining
- QA Writing (292162): 7 hrs remaining
- Total Magnet: 30 hrs remaining
- Split: ~77% testing / ~23% writing

## Change History

### 2026-07-06 — ADO manual edits (post-regression reallocation)

- **291909** Planning and Review (Resolved): OE 6 → 7, RW 0 → 1 (manual UI edit)
- **291911** Verification: OE 11 → 10, RW 11 → 10 (manual reduction)
- **292215** WBS Element: State Active → Proposed (OE/RW unchanged)
- **292217** Write Search HW: Resolved → Active, OE 0.25 → 1, RW 0 → 0.5, CW 0 → 0.5 (reopened and increased)

### 2026-07-06 — Regression → MISC reallocation

Consolidated 6 hrs into the MISC contingency bucket. Regression retained a minimum 4 hr window for a focused cross-module pass.

- **291910** Regression: OE 10 → 4, RW 10 → 4
- **291908** MISC: OE 11 → 17, RW 9.5 → 15.5 (CW 1.5 unchanged)

### 2026-07-06 — Task tuning (post-planning adjustments)

Manual ADO edits made between initial re-plan and this doc refresh:

- **291908** MISC: OE 8 → 11, RW 6.5 → 9.5
- **291911** Verification: OE 12 → 11, RW 12 → 11
- **292218** Test Search HW: OE 4 → 3, RW 4 → 3
- **292219** Test Article Import: OE 5 → 3, RW 5 → 3
- **292220** Write Article Import (Resolved): OE 0.5 → 2, RW 0 → 1

### 2026-07-06 — Magnet Systems reallocation

Moved 5 hrs from Test to Write to reflect ongoing test-case authoring effort.

- **292161** Test #35008 Magnet: OE 28 → 23, RW 28 → 23
- **292162** Write #35008 Magnet: OE 3 → 8, RW 2 → 7 (CW 1 unchanged)

### 2026-07-06 — Initial 80-hour budget re-plan

- **291908** MISC: OE 5 → 8, RW 3.5 → 6.5
- **291910** Regression: OE 4 → 10, RW 4 → 10 *(later revised to 4 — see reallocation above)*
- **291911** Verification: OE 7 → 12, RW 7 → 12 *(later revised to 11)*
- **291909** Planning and Review (Resolved): OE 5 → 6 (updated manually in UI)
- **292161** Test Magnet Systems: OE 12 → 28, RW 12 → 28 *(later revised to 23)*
- **292215** WBS Element: OE 0.5 → 3, RW 0.5 → 3
- **292218** Search HW Components: OE 1 → 4, RW 1 → 4 *(later revised to 3)*
- **292219** Article Import: OE 1.5 → 5, RW 1.5 → 5 *(later revised to 3)*

Applied via [scripts/ado/invoke-ado-task-estimate-update.ps1](../../../../../../../scripts/ado/invoke-ado-task-estimate-update.ps1) using Windows Integrated Authentication.

## Verification Rule

- Original Estimate should equal Remaining Work + Completed Work for Active/Proposed tasks.
- Resolved tasks: Remaining Work should be 0 (except where an item was resolved with residual RW — currently 292220 has RW=1); do not attempt to PATCH Resolved items — update Original Estimate manually in ADO UI.

## Update Procedure

1. Edit `$TaskUpdates` in [scripts/ado/invoke-ado-task-estimate-update.ps1](../../../../../../../scripts/ado/invoke-ado-task-estimate-update.ps1).
2. Dry-run: `.\invoke-ado-task-estimate-update.ps1 -WhatIf`
3. Apply: `.\invoke-ado-task-estimate-update.ps1 -Confirm:$false`
4. Verify by re-running the WhatIf (all rows should be no-op).
5. Update this doc's Baseline and Change History sections.

## Direct ADO Links

- [Task 291908](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/291908)
- [Task 291909](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/291909)
- [Task 291910](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/291910)
- [Task 291911](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/291911)
- [Task 292161](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/292161)
- [Task 292162](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/292162)
- [Task 292215](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/292215)
- [Task 292217](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/292217)
- [Task 292218](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/292218)
- [Task 292219](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/292219)
- [Task 292220](https://ops1.peergroup.com/DefaultCollection/PFEvatec/_workitems/edit/292220)
