# CR 286067 - R10.2 Test Case Coverage Matrix (Draft)

- CR: 286067
- Ticket: 35008
- Release: R10.2
- Generated: 2026-07-07
- Status: DRAFT for review. No ADO changes, no state changes.

## Scope

- Requirements in CR: 31
- Requirement folders present under `test-cases/`: 31
- Total existing test case files: 42
- Missing requirement folders: 0

## Coverage Legend

- Covered - one or more test cases exist and address the primary requirement flow.
- Partial - test case exists but scenario depth or negative coverage is missing.
- Missing - no test case addresses the scenario at all.
- N/A - scenario not applicable to the requirement.

---

## Requirement Coverage Table

| Requirement | Title | Existing Test Cases | Positive | Negative | Validation | Regression | Integration | Recommendation |
|-------------|-------|---------------------|:--------:|:--------:|:----------:|:----------:|:-----------:|----------------|
| 73354 | Add Role to Logbook Configuration | 001 (Happy), 002 (Unhappy) | Covered | Covered | Partial | Missing | Missing | Add regression covering serial-number lock on `Magnet System` role; add duplicate role-name validation. |
| 73375 | Remove Comment or Hardware Configuration Change from Logbook | 001 (Happy), 002 (Regression) | Covered | Missing | Partial | Covered | Partial | Add negative for removal of non-removable entry; add linked magnet install/uninstall integration. |
| 174279 | New Target Type from ERP | 001 (Happy), 002 (Validation) | Covered | Missing | Covered | Missing | Missing | Add negative for article already used as target or magnet system type. |
| 205378 | Learned Associations | 001 (Happy) | Covered | Missing | Missing | Missing | Partial | Add unsaved-role-change reflection and URL context preservation coverage. |
| 205379 | Add Associations | 001 (Happy) | Covered | Missing | Missing | Missing | Partial | Add negative for invalid target selection; add magnet system role association scoped to Standard types. |
| 205380 | Remove Association | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add regression verifying removed item no longer appears as previously installed candidate. |
| 217766 | Export Hardware Configuration | 001 (Happy), 002 (Validation) | Covered | Missing | Covered | Missing | Partial | Add negative export permission denial; add prototype-variant export formatting scenario. |
| 226384 | Hardware Configuration for Real Module | 001 (Happy) | Covered | Missing | Missing | Missing | Partial | Add rewind/export coverage and magnet system change from real-module context. |
| 226385 | Copy Module Hardware Configuration | 001 (Happy) | Covered | Missing | Missing | Missing | Partial | Add negative for incompatible module type; add save-blocked-on-validation-error scenario. |
| 264374 | Import Hardware Components from File | 001 (Happy), 002 (Negative) | Covered | Covered | Partial | Missing | Partial | Add ERP-driven update of linked target/magnet type metadata verification. |
| 290756 | Magnet System Types (list) | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add filter/sort by prototype variant; add permission-denied view scenario. |
| 290757 | New Magnet System Type | 001 (Happy), 002 (Negative) | Covered | Covered | Partial | Missing | Missing | Add applications-field multi-value; add negative for article already used as Target Type. |
| 290758 | View and Upload Documents for New Magnet System Type | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add invalid-file-type negative and remove-during-create scenario. |
| 290759 | View Magnet System Type | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add permission-gated action visibility scenario. |
| 290760 | Edit Magnet System Type | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add prototype read-only-field enforcement scenario. |
| 290761 | View and Manage Magnet System Type Documents | 001 (Happy - replace) | Covered | Missing | Missing | Missing | Missing | Add open/download and remove document scenarios. |
| 290762 | Magnet System Type History | 001 (Audit) | Covered | Missing | Missing | Partial | Missing | Add prototype lineage history (create prototype from standard) and promote-to-standard history propagation. |
| 290763 | Define Magnet System Type as Standard | 001 (Happy), 002 (Uniqueness) | Covered | Missing | Covered | Missing | Partial | Add propagation to existing Magnet Systems linked to the type. |
| 290764 | Magnet Systems (list) | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add inspection flag filter and Retired records filter. |
| 290765 | New Magnet System | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add negative for duplicate serial number; add required-field validation. |
| 290766 | View and Upload Documents for New Magnet System | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add invalid-file-type negative. |
| 290767 | View Magnet System | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add state-sensitive field display (In Use shows Tool, others empty). |
| 290768 | View Magnet System Documents | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add permission denial and missing-document handling. |
| 290769 | Edit Magnet System | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add negative editing immutable fields (Serial Number, Magnet System Number). |
| 290770 | View and Manage Magnet System Documents | 001 (Happy - delete) | Covered | Missing | Missing | Missing | Missing | Add upload and replace scenarios in Edit context. |
| 290771 | Magnet System History | 001 (Audit) | Covered | Missing | Missing | Partial | Partial | Add lifecycle history: checkout, return, install, uninstall, modify, retire generate distinct entries. |
| 290772 | Retire Magnet System | 001 (Happy), 002 (Validation) | Covered | Partial | Covered | Missing | Partial | Add negative retire from In Use; require mandatory reason validation. |
| 290773 | Modify Magnet System | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add status-restriction negative (not modifiable in In Use); add variant code increment verification. |
| 290775 | Return Magnet System | 001 (Happy) | Covered | Missing | Missing | Missing | Missing | Add negative return from In Stock; add cleanup verification (location empty). |
| 290776 | Print Magnet System Label | 001 (Happy), 002 (Validation) | Covered | Missing | Covered | Missing | Missing | Add prototype-variant label print flow explicitly. |
| 290777 | Change Magnet System (Tool HW Config) | 001 (Happy), 002 (Regression) | Covered | Missing | Missing | Covered | Covered | Add negative: attempt change with no eligible replacement in Checked Out. |

---

## Coverage Gaps by Category (per user checklist)

### Magnet System Types Lifecycle

| Scenario | Status | Notes |
|---|---|---|
| Create | Covered | 290757 |
| View | Covered | 290759 |
| Edit | Covered | 290760 |
| Delete | Missing | No test case for deleting a Magnet System Type. Confirm requirement supports delete. |
| List View | Covered | 290756 |
| Security | Missing | No permission-denied scenarios. |
| Read Only | Missing | No read-only mode coverage. |
| Document Management | Covered | 290758, 290761 |
| Applications Field | Missing | No dedicated multi-select/custom value coverage. |
| Prototype Creation | Missing | No standalone test for creating a Prototype from Standard. |
| Prototype Modification | Partial | 290773 covers modify but not variant-code increment behavior. |
| Prototype History | Missing | Prototype lineage not explicitly asserted. |
| Promotion to Standard | Covered | 290763 |
| Promotion Validation | Partial | Uniqueness covered; article-number-vs-hardware-component uniqueness missing. |
| Standard to Prototype | Missing | Not covered. |
| Prototype to Prototype | Missing | Not covered. |
| Retirement (Type) | Missing | Type retirement/deactivation not covered. |
| Retirement Validation | Missing | Cannot retire type in use. |
| Article Number Validation | Missing | Uniqueness of Article Number within system. |
| Duplicate Article Number Prevention | Missing | Prevent article number matching an existing Hardware Component. |

### Magnet Systems Lifecycle

| Scenario | Status | Notes |
|---|---|---|
| Create | Covered | 290765 |
| View | Covered | 290767 |
| Edit | Covered | 290769 |
| Delete | N/A | Business decision uses Retire, not Delete. Confirm. |
| Checkout | Missing | **HIGH RISK** - No standalone checkout test. |
| Return | Covered | 290775 |
| Install | Missing | **HIGH RISK** - Install from checked-out to tool position not standalone. |
| Uninstall | Missing | **HIGH RISK** - Uninstall from tool position not standalone. |
| Replace | Covered | 290777 |
| Print Label | Covered | 290776 |
| QR Code | Partial | Encoded in 290776/002 but variant code display only for prototype not fully asserted. |
| History | Covered | 290771 |
| Audit | Covered | 290771 |
| Search | Missing | No search-by-article-number, serial-number, or magnet-system-number test. |
| Filtering | Partial | List test covers basic filter; no inspection-flag or checkout-owner filter. |
| Retirement | Covered | 290772 |
| Invalid Status Transitions | Missing | **HIGH RISK** - No negative cases (install non-checked-out, retire In Use, etc.). |

### Hardware Configuration Integration

| Scenario | Status | Notes |
|---|---|---|
| New Magnet System Role | Covered | 73354 |
| Requires Serial Number = Yes locked | Partial | 73354/001 asserts; needs standalone negative for edit attempt. |
| Installation Support | Missing | Standalone install test missing. |
| Replacement Support | Covered | 290777 |
| Export Support | Covered | 217766 |
| Learned Associations | Covered | 205378 |
| Remove Associations | Covered | 205380 |
| Tool Integration | Partial | Change flow covered; install-only flow missing. |

### Logbook Integration

| Scenario | Status | Notes |
|---|---|---|
| Create Entries (magnet install/uninstall) | Missing | No standalone verification a logbook entry is created on install/uninstall. |
| History Entries | Partial | 290777/002 covers change-driven history; standalone install/uninstall log entry missing. |
| Filtering (magnet category) | Missing | New magnet filter/category not asserted. |
| Visibility | Missing | No test for magnet entry visibility in the logbook role filter. |

### Migration (HIGHEST RISK - per kickoff)

| Scenario | Status | Notes |
|---|---|---|
| Existing Hardware Component conversion | Missing | Zero coverage. |
| Existing installed hardware conversion | Missing | Zero coverage. |
| Existing associations preservation | Missing | Zero coverage. |
| Existing serial number relationships | Missing | Zero coverage. |
| End-to-end migration workflow | Missing | The primary kickoff use case is uncovered. |

### End-to-End Scenario (HIGHEST RISK)

The kickoff primary use case is: existing Hardware Component -> installed -> convert to Magnet System Type -> create Magnet System -> checkout -> install -> history -> logbook -> export.

| Step | Status |
|---|---|
| Existing Hardware Component exists | Covered indirectly |
| Hardware Component is installed | Covered indirectly |
| Hardware Component becomes a Magnet System Type | Missing |
| Magnet System is created from that type | Missing |
| Magnet System is checked out | Missing |
| Magnet System is installed | Missing |
| History updates | Partial |
| Logbook updates | Missing |
| Hardware Configuration updates | Partial |
| Export data updates | Partial |
| Magnet System remains traceable through lifecycle actions | Missing |

**Verdict: end-to-end scenario has no dedicated test case and is fragmented across partial coverage.**

---

## Recommended New Test Cases

Files to be created under `review-working/new-test-cases/` grouped by requirement folder. All draft. Naming follows existing 3-digit sequential prefix continuing from current highest per folder.

### CR-wide / cross-requirement (new folder)

| File | Requirement | Type | Reason |
|---|---|---|---|
| `end-to-end/001-existing-component-to-magnet-system-e2e-happy-path.md` | Cross-cutting (290763, 290765, 290777, 73354, 217766, 73375) | Scenario | Kickoff primary use case. |
| `end-to-end/002-migration-existing-hardware-to-magnet-system.md` | Cross-cutting migration | Migration | Highest-risk gap identified by QA at kickoff. |
| `end-to-end/003-legacy-magnet-role-deletion-and-recreation.md` | Cross-cutting migration | Migration | Recreate associations after legacy role removal. |

### Requirement-specific additions

| File | Requirement | Type | Reason |
|---|---|---|---|
| `requirement-73354/003-add-role-serial-number-lock-magnet-system-regression.md` | 73354 | Regression | Assert serial-number requirement lock for `Magnet System` role. |
| `requirement-73354/004-add-role-duplicate-role-name-validation.md` | 73354 | Validation | Duplicate role name within category. |
| `requirement-73375/003-remove-logbook-entry-non-removable-negative.md` | 73375 | Negative | Attempt to remove non-removable comment/change. |
| `requirement-174279/003-new-target-type-article-already-used-negative.md` | 174279 | Negative | Article already used as target or magnet system type. |
| `requirement-217766/003-export-hardware-configuration-permission-denied-negative.md` | 217766 | Negative | Permission-denied export attempt. |
| `requirement-217766/004-export-hardware-configuration-prototype-variant-format.md` | 217766 | Validation | Prototype variant export formatting. |
| `requirement-226385/002-copy-module-incompatible-target-negative.md` | 226385 | Negative | Copy to incompatible module type is blocked. |
| `requirement-264374/003-import-hardware-components-updates-linked-magnet-type-metadata.md` | 264374 | Integration | ERP-driven update of linked type metadata. |
| `requirement-290756/002-magnet-system-types-list-permission-denied-negative.md` | 290756 | Negative | List view permission enforcement. |
| `requirement-290757/003-new-magnet-system-type-applications-field-multi-value.md` | 290757 | Validation | Multi-select and custom value display. |
| `requirement-290757/004-new-magnet-system-type-article-used-as-target-type-negative.md` | 290757 | Negative | Article already used as Target Type excluded from selection. |
| `requirement-290758/002-upload-documents-invalid-file-type-negative.md` | 290758 | Negative | Invalid file type blocked. |
| `requirement-290760/002-edit-magnet-system-type-prototype-readonly-fields.md` | 290760 | Validation | Prototype read-only field enforcement. |
| `requirement-290761/002-view-manage-magnet-system-type-documents-remove.md` | 290761 | Happy | Remove document scenario in Edit. |
| `requirement-290762/002-magnet-system-type-prototype-lineage-history.md` | 290762 | Audit | Lineage from Standard -> Prototype -> Promoted. |
| `requirement-290763/003-standard-to-prototype-happy-path.md` | 290763 | Happy | Create Prototype from Standard type. |
| `requirement-290763/004-prototype-to-prototype-variant-increment.md` | 290763 | Happy | Prototype -> new Prototype variant with V0x increment. |
| `requirement-290763/005-promote-prototype-propagates-to-existing-magnet-systems.md` | 290763 | Integration | Existing Magnet Systems remain linked after promotion. |
| `requirement-290763/006-article-number-uniqueness-validation.md` | 290763 | Validation | Article number unique and non-matching to Hardware Component article numbers. |
| `requirement-290764/002-magnet-systems-list-inspection-and-retired-filters.md` | 290764 | Validation | Inspection flag and Retired filter. |
| `requirement-290765/002-new-magnet-system-duplicate-serial-negative.md` | 290765 | Negative | Duplicate serial number blocked. |
| `requirement-290765/003-new-magnet-system-required-field-validation.md` | 290765 | Validation | Required field validation. |
| `requirement-290767/002-view-magnet-system-state-sensitive-fields.md` | 290767 | Validation | Location shows Tool in In Use; empty otherwise. |
| `requirement-290769/002-edit-magnet-system-immutable-field-negative.md` | 290769 | Negative | Serial Number and Magnet System Number cannot be edited. |
| `requirement-290770/002-manage-magnet-system-documents-upload-and-replace.md` | 290770 | Happy | Add and Replace document flows in Edit. |
| `requirement-290771/002-magnet-system-history-full-lifecycle-audit.md` | 290771 | Audit | Distinct history entries for checkout, install, uninstall, return, modify, retire. |
| `requirement-290772/003-retire-magnet-system-in-use-negative.md` | 290772 | Negative | Cannot retire In Use. |
| `requirement-290772/004-retire-magnet-system-mandatory-reason-validation.md` | 290772 | Validation | Mandatory retirement reason. |
| `requirement-290773/002-modify-magnet-system-status-restriction-negative.md` | 290773 | Negative | Modify blocked when status disallows. |
| `requirement-290773/003-modify-magnet-system-variant-code-increment.md` | 290773 | Validation | Variant code V0x behaviour. |
| `requirement-290775/002-return-magnet-system-from-in-stock-negative.md` | 290775 | Negative | Cannot return from In Stock. |
| `requirement-290775/003-return-magnet-system-cleanup-validation.md` | 290775 | Validation | Location cleared, In Inspection cleanup rules. |
| `requirement-290776/003-print-magnet-system-label-prototype-variant.md` | 290776 | Validation | Prototype variant printed on label. |
| `requirement-290777/003-change-magnet-system-no-eligible-replacement-negative.md` | 290777 | Negative | No Checked Out replacement available. |
| `requirement-290777/004-install-magnet-system-happy-path.md` | 290777 | Happy | Standalone install (not replace). |
| `requirement-290777/005-uninstall-magnet-system-happy-path.md` | 290777 | Happy | Standalone uninstall. |
| `requirement-290777/006-install-magnet-system-not-checked-out-negative.md` | 290777 | Negative | Blocked when not Checked Out. |
| `requirement-290777/007-logbook-entry-generated-on-magnet-install.md` | 290777 | Integration | Verify logbook entry generation on install. |
| `requirement-290777/008-logbook-magnet-filter-visibility.md` | 290777 | Integration | Magnet filter/category visible in Logbook. |

Total recommended new files: **38** (including 3 cross-cutting E2E/migration).

---

## Duplicates and Weak Coverage

- No duplicate test cases detected across folders.
- Weak coverage areas that rely on generic Expected Outcome language rather than measurable state changes are flagged in `review-findings.md`.

---

## Open Questions

1. Are all 31 requirements approved for R10.2, or are any Proposed-state requirements deferred?
2. Does the CR support Delete for Magnet System Types? If yes, requires new tests. If no, mark N/A.
3. Are specific security-right names finalized (for example `MagnetSystem_View`, `MagnetSystem_Edit`, `MagnetSystemType_Edit`)? Current tests use generic prose.
4. Is there an automated migration script or is migration purely manual (delete role + recreate)?
5. Confirm whether Install (standalone) is a distinct action or always accessed via Change dialog.
6. Confirm variant code numbering rules (V01, V02, V03 increment behavior across parallel prototypes).
7. Confirm whether Retire requires a mandatory reason field or only confirmation.
8. Confirm whether Retirement of a Magnet System Type is in scope for R10.2.
