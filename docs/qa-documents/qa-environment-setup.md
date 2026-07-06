# QA Environment Setup

## VM and Environment Notes

Examples referenced in legacy notes:

- pf-wsc19-qa1 (MES/EDP/IIS)
- pf-wsc19-qa2 (PTO)
- pf-wsc19-qa3 (FTM/BPME)

VM inventory portal:

- https://vmlist.peergroup.com/

## Prerequisites

- .NET Core Hosting Bundle version aligned to target release stream
- IIS with required features (including WebSocket support)
- SQL Server 2017+

## Install PF Evatec

1. Install latest release from release installers path.
2. Confirm program files and database scripts are present.

## Database Setup

### Create PFDB

1. Create local folders for database/log files.
2. Run CreateDataModel.bat from Database/Scripts with correct SQL instance and credentials.
3. Verify PFDB exists in SQL Server Management Studio.

### Upgrade PFDB

- Run UpgradeDataModel.bat for upgrade scenarios on existing PFDB.

### BPS Database

- If BPS changed, run RecreateBPS.cmd with target SQL instance and DB path.

## IIS Setup

1. Enable IIS and WebSocket support.
2. Unlock modules/handlers in root IIS configuration if required.
3. Create website and application pool for PF Evatec.
4. Use No Managed Code and appropriate service identity.
5. Restart IIS.

## Configuration Updates

After install, update as needed:

- ProgramData configuration files
- Composer data source and FileWatchFolder
- WebUI appsettings.json DataSource and GrpcClient values
- Server.Grpc.config host/port values

## Runtime Modes

- PSI as service:
  - Configure service Log On account and start service.
- PSI simulator as server app:
  - Run PSI.ServerApp.exe and validate host URL.
