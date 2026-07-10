@echo off

pushd \\peergroup.com\Files\Services\PF\Evatec\Builds\Release Builds\
FOR /F "delims=|" %%I IN ('DIR "*.*" /B /O:D') DO SET NewestVersion=%%I
popd


echo Uninstalling the latest version of PF Evatec - %NewestVersion% ...

set installerPath="\\20.0.1.11\files\Services\PF\Evatec\Builds\Release Builds\%NewestVersion%\Installers\PEER Factory ECL Server.msi"

FOR /F "delims=|" %%I IN ('DIR "*.*" /B /O:D') DO SET NewestVersion=%%I
popd


msiexec /x %installerPath% /qn


echo: Finished removal of PF Evatec.

