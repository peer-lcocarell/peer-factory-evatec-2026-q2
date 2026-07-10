# Setup Scripts Organization

This folder contains two script sets:

- Automated Scripts: Original script bundle copied from the QA VM, including batch and legacy PowerShell scripts.
- install: Repository-normalized PowerShell scripts intended for maintenance and automation.

Legacy VM install scripts have been moved to:

- Removed from the repository working set. Recover from git history if needed.

## Source of Truth

Use scripts in install for day-to-day execution, review, and future updates.

Treat scripts in Automated Scripts as historical/source artifacts from the VM.

## Mapping Highlights

- Install the latest PF Evatec silent: install/install-latest-pf-evatec-silent-disabled.ps1
- Copy filled in Config file to MES config: install/copy-config-file-to-mes-config.ps1
- Update gRCP config: install/update-grpc-config.ps1
- Update Service Account: install/update-service-account.ps1
- Restart IIS: install/restart-iis.ps1
- Start PF Service: install/start-pf-service.ps1
- Optional open PF application: install/open-pf-application-chrome.ps1

## Operational Guidance

- Run with WhatIf first for destructive scripts.
- Prefer parameterized execution over hard-coded environment values.
- Supply credentials securely through SecureString parameters or automation secret stores.
- Keep disabled scripts disabled unless explicitly needed for a controlled operation.
