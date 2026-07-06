# Release Deployment Notes

## Quick Instructions: Install or Update PF Evatec Build

1. Stop Windows service: PEERFactory ECL x.y Server.
2. Stop IIS website: pf-wsc19-qa1.
3. Uninstall existing PEER Factory ECL application from Control Panel.
4. Install latest release from:
   - \\Services\PF\Evatec\Builds\Release Builds\PFEvatec_<Release Version>\Release\Installers\
5. Run database upgrade script from installed build scripts folder:
   - UpgradeDataModel.bat PF-WSC19-QA1\SQLEXPRESS C:\temp PEERGROUP\vstsbuild PEERGROUP\vstsbuild
6. Copy release app settings to WebUI folder when applicable.
7. Apply MES gRPC and component configuration updates if required by the release.
8. Ensure service Log On account is correct (for example peergroup\vstsbuild).
9. Start service and IIS website.
10. Verify application is reachable at target host URL.

## Important Notes

- If build iteration changes significantly (for example major/minor runtime shifts), IIS-level updates may be required.
- Coordinate with developers for server-side gRPC and component changes before final validation.

## EDP Setup for Testing

1. Download latest artifact from build pipeline.
2. Stop EDP service on test VM.
3. Replace local EDP binaries (do not overwrite config.ini).
4. Restart EDP service.
5. Validate version/function from PF Web UI.

## Supplemental Tooling

- Python 3.8.10 may be required for older EDP compatibility scenarios.
- NSSM can be used to support service creation via Install.bat where needed.
