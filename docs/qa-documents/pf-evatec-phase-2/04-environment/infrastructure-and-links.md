[[_TOC_]]

# Infrastructure and Links

## Core Network Paths

- Base folder:
  - \\peergroup.com\files\Services\PF\Evatec
- Releases:
  - \\peergroup.com\files\Services\PF\Evatec\Releases
- User guides:
  - \\peergroup.com\files\Services\PF\Evatec\User Documentation\Released Versions

## Additional Shared Locations

- PTO tool assets:
  - \\peergroup.com\files\Services\PF\Evatec\PTO Tool
- Batch tool area:
  - \\peergroup.com\files\Services\PF\Evatec\PTO Tool\Clusterline200 BPME
- Database backups:
  - \\peergroup.com\Files\Services\PF\Evatec\DB Backups

## External References

- VM list:
  - https://vmlist.peergroup.com/
- Playwright docs:
  - https://playwright.dev/docs/getting-started-vscode
  - https://playwright.dev/docs/intro

## Legacy Context Notes

- Enterprise Architect connection details and historical links appeared in legacy notes and may require credential/network access.
- Validate accessibility of all UNC paths from your current environment before use.

## Resources

- Clarity
  - Design System: https://v4.clarity.design/documentation
  - Icons: https://v4.clarity.design/icons
  - Blazority (Blazor wrapper for Clarity): https://blazority.com/

- Font Awesome Icons
  - https://fontawesome.com/icons

- gRPC
  - proto Reference: https://developers.google.com/protocol-buffers/docs/reference/csharp

## Important Places and Things

### Current VM Setup (as of May 2025)

| Name | Value | Notes |
|--|--|--|
| QA VM | pf-wsc19-qa1 on HVTest02.Peergroup.com | Windows Server 2019, Local admin account is "peergroup/vstsbuild" - contact team for password; MES, PFDB, EDP, BPS DB |
| QA VM | pf-wsc19-qa2 on HVTest02.Peergroup.com | Windows Server 2019, Local admin account is ".\\administrator" with the password "p@ssw0rd"; PTO |
| QA VM | pf-wsc19-qa3 on HVTest02.Peergroup.com | Windows Server 2019, Local admin account is ".\\administrator" with the password "p@ssw0rd"; FTM, Batch Tool (BPME) |
| Enterprise Architect | ea_pf_evatec | DBType=1;Connect=Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=EA_PF_Evatec;Data Source=ea |

### Historical VM Setup (2020 to April 2025)

Note: These may be deactivated eventually.

| Name | Value | Notes |
|--|--|--|
| QA VM [no longer supported] | evatec2012r2qa4 on vmm.peergroup.com:8100 (Host: hvtest01) | NON-PEER Network, Username: Administrator, Password: p@ssw0rd!, direct browser access: http://evatec2012r2qa4 |
| QA VM Domain Controller [no longer supported] | evatec2012r2dc on vmm.peergroup.com:8100 (Host: hvtest01) | NON-PEER Network, Username: Administrator, Password: p@ssw0rd! |
| QA VM (Second User) [no longer supported] | evatec2012r2qa4 on vmm.peergroup.com:8100 (Host: hvtest01) | Username: Administrator2, Password: p@ssw0rd, direct browser access: http://evatec2012r2qa4 |
| QA VM - PTO Tool [no longer supported] | pfevatec64-qa1 on testvs18 | Username: Administrator, Password: p@ssw0rd |
| QA VM - FTM [no longer supported] | pfevatec64-clone on testvs18 | Username: Administrator, Password: p@ssw0rd |
| QA VM - Batch Tool | pfevatec64-qa2 on testvs21 | Access via browser to http://testvs21.peergroup.com instead of vSphere; Username: Administrator; Password: p@ssw0rd |
| Tool PC VM (SECS/GEM) | pfevatec64-qa1 on testvs18 | NON-PEER Network, Username: Administrator, Password: p@ssw0rd |
| Spare VM | evatec2012r2qa2 on testvs15 | Connected to PEER AD, use your PEER credentials to login; currently has FTM installed |
| Staging VM | evatec2012r2qa3 on testvs13 | Connected to PEER AD, User: Administrator, Password: p@ssw0rd, direct browser access: http://evatec2012r2qa3 |

## Accounts

- PEERGROUP\\ASPWorker: asp!worker
- PEERGROUP\\PEERFACTORYCollect: dev.solis1 (UPN: peerfactorycollect@peergroup.com)
