---
mode: ask
description: Prompt for qa-file-naming-copilot-prompt-guide.
---

# qa-file-naming-copilot-prompt-guide

## Overview
This guide standardizes file naming for this repository and provides a reusable Copilot prompt for deterministic filename refactoring.

## Repository Naming Standard

### General
- Use names that clearly describe domain, context, and purpose.
- Keep names unique within each folder.
- Prefer stable names over temporary suffixes such as final, new, or v2.
- Avoid ambiguous names such as notes, misc, items, or temp.

### Markdown
- Use kebab-case and lowercase.
- Pattern: domain-context-purpose.md.
- Allowed: a-z, 0-9, and hyphen.

### Source Code
- Follow language conventions.
- JavaScript and TypeScript: kebab-case.
- React components: PascalCase.
- C# classes: PascalCase.

### Scripts and Automation Artifacts
- Use lowercase kebab-case for script file names.
- Remove numeric prefixes unless execution order is required by tooling.
- Avoid spaces, punctuation, and duplicated extensions.

### Configuration
- Keep required framework naming intact when convention-driven.
- Examples: package.json, playwright.config.ts, azure-pipelines.yml.

## Reusable Copilot Prompt
Use this prompt when reviewing or refactoring file names:

Analyze repository filenames and propose deterministic renames to improve clarity, consistency, and maintainability.

Requirements:
- Apply kebab-case to markdown and script files unless tooling requires another convention.
- Preserve language-specific naming for source files.
- Use domain-context-purpose when possible.
- Remove spaces, underscores, special characters, duplicate extensions, and vague terminology.
- Preserve file intent and folder context.
- Ensure uniqueness in each folder.

Validation rules:
- No spaces.
- No special characters except hyphen and dot before extension.
- No generic names.
- No duplicate filenames in the same folder.
- Names should be searchable and understandable by new contributors.

Output format:
- Bullet list old-name -> new-name.
- Include one short rationale only when the rename is not self-evident.
- Include required follow-up updates for links, imports, scripts, and pipeline references.

## Project-Specific Rename Recommendations

### High Priority
- docs/### Additional Requirements & Scope Changes Identi.md -> docs/additional-requirements-scope-changes-identified.md
- docs/qa-documents/Magnet_Systems_Kickoff_Summary.md -> docs/qa-documents/magnet-systems-kickoff-summary.md
- docs/r102/Magnet_Systems_Kickoff_Summary.md -> docs/r102/magnet-systems-kickoff-summary.md
- docs/r102/magenet_system_notes.md -> docs/r102/magnet-system-notes.md

### Script Naming Cleanup
- docs/qa-documents/scripts/Install/1. clearLogs.ps1 -> docs/qa-documents/scripts/install/clear-logs.ps1
- docs/qa-documents/scripts/Install/2. clearProgramData.ps1 -> docs/qa-documents/scripts/install/clear-program-data.ps1
- docs/qa-documents/scripts/Install/2 - Copy filled in Config file to MES config. ps1.ps1 -> docs/qa-documents/scripts/install/copy-config-file-to-mes-config.ps1
- docs/qa-documents/scripts/Install/3 - Update the gRCP config.ps1 -> docs/qa-documents/scripts/install/update-grpc-config.ps1
- docs/qa-documents/scripts/Install/4 - Update the Service Account.ps1 -> docs/qa-documents/scripts/install/update-service-account.ps1
- docs/qa-documents/scripts/Install/5 - Restart IIS.ps1 -> docs/qa-documents/scripts/install/restart-iis.ps1
- docs/qa-documents/scripts/Install/6 - Start the PF Service.ps1 -> docs/qa-documents/scripts/install/start-pf-service.ps1
- docs/qa-documents/scripts/Install/Optional -  Open PF Application - Chrome.ps1 -> docs/qa-documents/scripts/install/open-pf-application-chrome.ps1
- qa-documents/scripts/Install/1 - Upgrade the PFDB.ps1 -> qa-documents/scripts/install/upgrade-pfdb.ps1

### Optional Excel Artifact Normalization
- docs/qa-documents/planning/excel-files/Copy of Evatec Factory - Release 10.1 - Mini STP - Updated.xlsx -> docs/qa-documents/planning/excel-files/evatec-factory-release-10-1-mini-stp-updated.xlsx
- docs/qa-documents/planning/excel-files/Evatec Factory - Release 10.0.0.6 - Mini STP.xlsx -> docs/qa-documents/planning/excel-files/evatec-factory-release-10-0-0-6-mini-stp.xlsx
- docs/qa-documents/planning/excel-files/Evatec Factory - Release 10.0.0.8 - Mini STP - Updated.xlsx -> docs/qa-documents/planning/excel-files/evatec-factory-release-10-0-0-8-mini-stp-updated.xlsx
- docs/qa-documents/planning/excel-files/Mini STP1.xlsx -> docs/qa-documents/planning/excel-files/mini-stp-initial-draft.xlsx
- docs/qa-documents/planning/excel-files/PFEvatec.R1 - R6.5  Test Plan.xlsx -> docs/qa-documents/planning/excel-files/pfevatec-r1-r6-5-test-plan.xlsx
- docs/qa-documents/planning/excel-files/STTD WW05 GLP - Mini STP.xlsx -> docs/qa-documents/planning/excel-files/sttd-ww05-glp-mini-stp.xlsx

## Reference Update Impact
- Search and update markdown links in docs after renames.
- Search and update script call paths in automation docs and runbooks.
- Search and update CI references if script paths are used by pipelines.
- If folder Install is renamed to install, update every relative path reference.

## Deterministic Refactoring Process
1. Identify file domain, audience, and purpose from file content.
2. Extract concise keywords.
3. Build candidate name using domain-context-purpose.
4. Validate compliance with repository standards.
5. Apply rename and update references in the same change set.
6. Re-run link and path checks.

## Quality Checklist
- Purpose is immediately clear.
- Name is searchable.
- Name is unique in its folder.
- Name matches nearby naming style.
- A new team member can infer file intent.
- Name remains meaningful after one year.
