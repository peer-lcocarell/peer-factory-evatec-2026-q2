# PEER Factory Evatec Q2 2026

This repository documentation has been split into focused guides under the docs folder.

## Documentation Index

- [Overview](docs/overview.md)
- [Infrastructure and Links](docs/infrastructure-and-links.md)
- [Test Plan Converter Guide](docs/test-plan-converter.md)
- [Release Deployment Notes](docs/release-deployment.md)
- [QA Environment Setup](docs/qa-environment-setup.md)
- [PTO Operations Guide](docs/pto-operations.md)
- [Domain Reference](docs/domain-reference.md)
- [Playwright Workspace Setup](docs/playwright-setup.md)

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
