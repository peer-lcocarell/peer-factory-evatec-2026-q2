@ECHO OFF


ECHO.
ECHO *******************************************************************************
ECHO ** You are about to update PFDB
ECHO ** 
ECHO ** Press Ctrl-C to prevent this.
ECHO *******************************************************************************
ECHO.
PAUSE


ECHO Update Database...
CALL UpgradeDataModel.bat PF-WSC19-QA1\SQLEXPRESS C:\temp PEERGROUP\vstsbuild PEERGROUP\vstsbuild /q
ECHO Done!
ECHO.

