# VM Remote Desktop Helper Scripts

Scripts for launching RDP sessions to current QA VMs.

## Files

- Connect-RdpVm.ps1
- Connect-pf-wsc19-qa1.ps1
- Connect-pf-wsc19-qa2.ps1
- Connect-pf-wsc19-qa3.ps1

## Usage

Open PowerShell in this folder, then run:

```powershell
.\Connect-RdpVm.ps1 -Menu
```

Direct launch for a specific VM:

```powershell
.\Connect-pf-wsc19-qa1.ps1
.\Connect-pf-wsc19-qa2.ps1
.\Connect-pf-wsc19-qa3.ps1
```

To prompt and cache credentials with cmdkey before launch:

```powershell
.\Connect-pf-wsc19-qa1.ps1 -CacheCredential
```

## Notes

- Uses mstsc.exe for Remote Desktop launch.
- Uses cmdkey only when -CacheCredential is specified.
- Avoid hardcoding passwords in scripts.
