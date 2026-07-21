---
TestCaseId: 293944
PlanId: 291616
SuiteId: 292263
---

# R10.2 Update for CR 286067 - Magnet System Types: Verify tester can promote a Prototype Magnet System Type to Standard from the list page (Happy Path)

## Requirement
CR: 286067
Ticket: 35008
Requirement ID: 290756
Requirement: Magnet System Types (Magnet System Types)

## Preconditions
- Tester is signed in with `MagnetSystems_Modify`.
- A second user exists without `MagnetSystems_Modify`.
- A Prototype Magnet System Type (V01) exists with a Hardware Component available and eligible for promotion.

## Test Steps

| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open the 'Magnet System Types' list page and locate the V01 prototype. | The prototype is listed with the Prototype indicator visible and the Variant Code showing V01. |
| 2 | Open the prototype detail page and click the 'Define as Standard' action. | The promotion dialog opens. |
| 3 | In the promotion dialog, select the available Hardware Component from the lookup and confirm the promotion. | The dialog closes. The record status is Standard. The Prototype indicator is no longer displayed. The Variant Code field is blank or absent. |
| 4 | Navigate to the 'Magnet System Types' list page. | The promoted record appears in the list with Standard status. The Prototype indicator is not displayed for that record. |
| 5 | Log out and sign in as a user without `MagnetSystems_Modify`. Open a Prototype Magnet System Type. | The 'Define as Standard' action is not visible or is disabled on the detail page. |

## Expected Outcome
A user with `MagnetSystems_Modify` can promote a Prototype Magnet System Type to Standard from the list workflow. A user without that permission does not have access to the 'Define as Standard' action.
