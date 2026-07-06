# PEER Factory Evatec Q2 2026

This repository documentation has been split into focused guides under the docs folder.

## Documentation Index

- [Overview](docs/qa-documents/pf-evatec-phase-2/00-project-overview/project-overview.md)
- [Domain Reference](docs/qa-documents/pf-evatec-phase-2/00-project-overview/domain-reference.md)
- [Project Kickoff Summary](docs/qa-documents/pf-evatec-phase-2/00-project-overview/project-kickoff-summary.md)
- [Change Request Plan](docs/qa-documents/pf-evatec-phase-2/02-planning/change-request-plan.md)
- [Mini STP Outline](docs/qa-documents/pf-evatec-phase-2/02-planning/mini-stip-outline.md)
- [QA Test Estimates](docs/qa-documents/pf-evatec-phase-2/03-testing/estimates/qa-test-estimates.csv)
- [Infrastructure and Links](docs/qa-documents/pf-evatec-phase-2/04-environment/infrastructure-and-links.md)
- [QA Environment Setup](docs/qa-documents/pf-evatec-phase-2/04-environment/qa-environment-setup.md)
- [Playwright Workspace Setup](docs/qa-documents/pf-evatec-phase-2/04-environment/playwright-setup.md)
- [PTO Operations Guide](docs/qa-documents/pf-evatec-phase-2/05-operations/pto-operations.md)
- [Release Deployment Notes](docs/qa-documents/pf-evatec-phase-2/05-operations/release-deployment.md)
- [Test Plan Converter Guide](docs/qa-documents/pf-evatec-phase-2/06-automation/converters/test-plan-converter.md)
- [ADO Publishing Guide (R10.02)](docs/qa-documents/pf-evatec-phase-2/07-references/ado-publishing-guide-r10.02.md)
- [R10.2 Release Documentation](docs/qa-documents/pf-evatec-phase-2/08-releases/r10/r10.2/release-documentation/)
- [Reorganization Report](docs/qa-documents/pf-evatec-phase-2/reorganization-report.md)

## Quick Start

1. Install converter dependency:

```powershell
py -m pip install openpyxl
```

2. Run converter:

```powershell
py .\\test-utility\\convert_excel_testplans_to_markdown.py
```

3. Run Playwright tests:

```powershell
npx playwright test
```
