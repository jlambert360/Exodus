rmdir .\WiiBuild\ /s /q

@echo Copying to Wii Build Folder
Xcopy /E /I .\Build .\WiiBuild

@echo Deleting Netplay Only Files
del .\WiiBuild\Project+\NETPLAY.txt /Q
del .\WiiBuild\Project+\NETBOOST.txt /Q
del .\WiiBuild\Project+\pf\menu3\dnet.cmnu /Q
rmdir .\WiiBuild\Project+\pf\movie /s /q
rmdir .\WiiBuild\Project+\pf\sound\netplaylist /s /q
rmdir .\WiiBuild\Project+\Source\Netplay /s /q

@echo Building Codesets
".\WiiBuild\Project+\GCTRealMate.exe" -q ".\WiiBuild\Project+\RSBE01.txt"
".\WiiBuild\Project+\GCTRealMate.exe" -q ".\WiiBuild\Project+\BOOST.txt"

::@echo Zipping Files Please Wait
::powershell.exe .\ZipWiiFiles.ps1

@echo Finished!