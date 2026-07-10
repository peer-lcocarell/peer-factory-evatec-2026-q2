# PF Evatec – Release Build Installation & Update Guide

## 1. Stop Services
- In Windows Services, stop:
  - **PEERFactory ECL x.y Server**
    - This also stops all **PSI.ServerTray** instances.
- In IIS, stop:
  - **pf-wsc19-qa1** website

## 2. Uninstall Existing Application
- Open **Control Panel → Programs and Features**
- Uninstall:
  - **PEER Factory ECL**

## 3. Install the New Release Build
- Navigate to:
  \\Services\PF\Evatec\Builds\Release Builds\PFEvatec_<Release Version>\Release\Installers\\n- Run the installer for the latest release.
- Choose **Complete** during the installation wizard.

## 4. Run the Database Upgrade Script
- Navigate to:
  C:\Program Files\PEER Group\PEER Factory ECL <Build #>\Database\Scripts
- Run:
  UpgradeDataModel.bat PF-WSC19-QA1\SQLEXPRESS C:\temp PEERGROUP\vstsbuild PEERGROUP\vstsbuild

## 5. Update WebUI appsettings
- Do not overwrite the full file with a direct copy.
- Merge release values from:
  C:\Automated Scripts\Files\appsettings.Release.json
  into:
  C:\Program Files\PEER Group\PEER Factory ECL <Build #>\WebUI\appsettings.json
- Preferred: run install script
  docs\qa-documents\setup-scripts\install\03-update-webui-appsettings.ps1
- Reason: full overwrite can remove required server settings and cause WebUI startup failure (HTTP 500.30).

## 6. Update MES gRPC Configuration (Only if required)
### If gRPC changes were made:
1. Navigate to:
   C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\
2. Open:
   Server.Grpc.config
3. Change host entry from:
   <port host="localhost" port="9090" credentials="insecure" />
   to:
   <port host="pf-wsc19-qa1" port="9090" credentials="insecure" />
4. Save the file.
5. Copy it to:
   C:\Automated Scripts\Files\\n
### If no gRPC changes were made:
- Copy:
  C:\Automated Scripts\Files\Server.Grpc.config
- Paste to:
  C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\

## 7. Update MES Server Components (Only if required)
### If component changes were made:
1. Open **Composer**.
2. Load the **MES** configuration.
3. Update **ToolConnectionManager**:
   - Connection Timeout: 3500
   - Host Address: pf-wsc19-qa1
   - FileWatchFolder: \\pf-wsc19-qa1\Uploaded
4. Update **BPS Import Service**:
   - DataSource: PF-WSC19-QA1\SQLEXPRESS
5. Update **DatabaseConnection**:
   - DataSource: PF-WSC19-QA1\SQLEXPRESS
6. Save changes in Composer.
7. Copy updated:
   C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\Components.config
   to:
   C:\Automated Scripts\Files\\n
### If no component changes were made:
- Copy:
  C:\Automated Scripts\Files\Components.config
- Paste to:
  C:\ProgramData\PEER Group\PEER FACTORY\Configurations\MES\Server\

## 8. Update Service Log On Credentials
- Open Windows Services.
- Right‑click **PEERFactory ECL x.y Server → Properties**.
- Go to the **Log On** tab.
- Select **This account**: peergroup\vstsbuild
- Enter password as required.
- Select **OK**.

## 9. Restart Services
- In Windows Services, start:
  - **PEERFactory ECL x.y Server**
- In IIS, start:
  - **pf-wsc19-qa1** website

## 10. Verify System
- Open: http://pf-wsc19-qa1
