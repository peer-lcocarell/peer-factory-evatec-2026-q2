@echo off


pushd \\peergroup.com\Files\Services\PF\Evatec\Builds\Release Builds\
FOR /F "delims=|" %%I IN ('DIR "*.*" /B /O:D') DO SET NewestVersion=%%I
popd


echo Installing the latest version of PF Evatec - %NewestVersion% ...


set installerPath="\\20.0.1.11\files\Services\PF\Evatec\Builds\Release Builds\%NewestVersion%\Installers\PEER Factory ECL Server.msi"


FOR /F "delims=|" %%I IN ('DIR "*.*" /B /O:D') DO SET NewestVersion=%%I
popd


msiexec /i %installerPath% /qn PIDKEY=1864280627-1175724579-A61753052-4nQnGovv-257743373 INSTALLLEVEL=1000

echo: Finished installation of the latest PF Evatec.

