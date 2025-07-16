@echo off
cd /d "%~dp0"
%windir%\system32\whoami.exe /USER | find /i "S-1-5-18" 1>nul || (
echo ============================================================
echo ERROR: Use the outer Installer.cmd to launch the process.
echo ============================================================
echo.
echo.
echo Press any key to exit...
pause >nul
goto :eof
)

for /f "tokens=6 delims=[]. " %%G in ('ver') do set winbuild=%%G


if %winbuild% LSS 9600 goto :noW81

echo Detected Windows build: %winbuild%
echo The installation is starting (the stock Blue skinned WMC will be installed)...

chcp 437 >nul
set _mui=(ar-SA,bg-BG,cs-CZ,da-DK,de-DE,el-GR,en-GB,es-ES,et-EE,fi-FI,fr-FR,he-IL,hr-HR,hu-HU,it-IT,ja-JP,ko-KR,lt-LT,lv-LV,nb-NO,nl-NL,pl-PL,pt-BR,pt-PT,ro-RO,ru-RU,sk-SK,sl-SI,sr-Latn-RS,sv-SE,th-TH,tr-TR,uk-UA,zh-CN,zh-HK)
echo.

echo Copying files...
xcopy .\MediaCenter\* %SystemDrive%\ /cheriky >nul 2>&1
copy .\ehres\ehres.black.dll %windir%\ehome\ehres.dll >nul 2>&1

echo.
echo Creating hard links 


mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_64\BDATunePIA\v4.0_6.3.0.0__31bf3856ad364e35\BDATunePIA.dll %SystemRoot%\ehome\BDATunePIA.dll  >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_64\mcplayerinterop\v4.0_6.3.0.0__31bf3856ad364e35\mcplayerinterop.dll  %SystemRoot%\ehome\mcplayerinterop.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_64\mcstoredb\v4.0_6.3.0.0__31bf3856ad364e35\mcstoredb.dll %SystemRoot%\ehome\mcstoredb.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_64\mcupdate\v4.0_6.3.0.0__31bf3856ad364e35\mcupdate.exe %SystemRoot%\ehome\mcupdate.exe >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_64\Mcx2Dvcs\v4.0_6.3.0.0__31bf3856ad364e35\Mcx2Dvcs.dll %SystemRoot%\ehome\Mcx2Dvcs.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_64\Microsoft.MediaCenter.Interop\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.Interop.dll %SystemRoot%\ehome\Microsoft.MediaCenter.Interop.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_64\Microsoft.MediaCenter.iTV.Media\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.iTV.Media.dll %SystemRoot%\ehome\Microsoft.MediaCenter.iTV.Media.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_64\Microsoft.MediaCenter.Mheg\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.Mheg.dll %SystemRoot%\ehome\Microsoft.MediaCenter.Mheg.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_64\Microsoft.MediaCenter.TV.Tuners.Interop\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.TV.Tuners.Interop.dll %SystemRoot%\ehome\Microsoft.MediaCenter.TV.Tuners.Interop.dll >nul 2>&1

mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_32\ehexthost32\v4.0_6.3.0.0__31bf3856ad364e35\ehexthost32.exe %SystemRoot%\ehome\wow\ehexthost32.exe >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_32\ehexthost32\v4.0_6.3.0.0__31bf3856ad364e35\ehexthost32.exe.config %SystemRoot%\ehome\wow\ehexthost32.exe.config >nul 2>&1

mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehCIR\v4.0_6.3.0.0__31bf3856ad364e35\ehCIR.dll %SystemRoot%\ehome\ehCIR.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehexthost\v4.0_6.3.0.0__31bf3856ad364e35\ehexthost.exe %SystemRoot%\ehome\ehexthost.exe >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehexthost\v4.0_6.3.0.0__31bf3856ad364e35\ehexthost.exe.config %SystemRoot%\ehome\ehexthost.exe.config >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiActivScp\v4.0_6.3.0.0__31bf3856ad364e35\ehiActivScp.dll %SystemRoot%\ehome\ehiActivScp.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiBmlDataCarousel\v4.0_6.3.0.0__31bf3856ad364e35\ehiBmlDataCarousel.dll %SystemRoot%\ehome\ehiBmlDataCarousel.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiExtens\v4.0_6.3.0.0__31bf3856ad364e35\ehiExtens.dll %SystemRoot%\ehome\ehiExtens.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiiTV\v4.0_6.3.0.0__31bf3856ad364e35\ehiiTV.dll %SystemRoot%\ehome\ehiiTV.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiProxy\v4.0_6.3.0.0__31bf3856ad364e35\ehiProxy.dll %SystemRoot%\ehome\ehiProxy.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiTVMSMusic\v4.0_6.3.0.0__31bf3856ad364e35\ehiTVMSMusic.dll %SystemRoot%\ehome\ehiTVMSMusic.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiUPnP\v4.0_6.3.0.0__31bf3856ad364e35\ehiUPnP.dll %SystemRoot%\ehome\ehiUPnP.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiUserXp\v4.0_6.3.0.0__31bf3856ad364e35\ehiUserXp.dll %SystemRoot%\ehome\ehiUserXp.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiVidCtl\v4.0_6.3.0.0__31bf3856ad364e35\ehiVidCtl.dll %SystemRoot%\ehome\ehiVidCtl.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiwmp\v4.0_6.3.0.0__31bf3856ad364e35\ehiwmp.dll %SystemRoot%\ehome\ehiwmp.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehiWUapi\v4.0_6.3.0.0__31bf3856ad364e35\ehiWUapi.dll %SystemRoot%\ehome\ehiWUapi.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehRecObj\v4.0_6.3.0.0__31bf3856ad364e35\ehRecObj.dll %SystemRoot%\ehome\ehRecObj.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\ehshell\v4.0_6.3.0.0__31bf3856ad364e35\ehshell.dll %SystemRoot%\ehome\ehshell.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\loadmxf\v4.0_6.3.0.0__31bf3856ad364e35\loadmxf.exe %SystemRoot%\ehome\loadmxf.exe >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\mcepg\v4.0_6.3.0.0__31bf3856ad364e35\mcepg.dll %SystemRoot%\ehome\mcepg.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\mcglidhostobj\v4.0_6.3.0.0__31bf3856ad364e35\mcglidhostobj.dll %SystemRoot%\ehome\mcglidhostobj.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\mcstore\v4.0_6.3.0.0__31bf3856ad364e35\mcstore.dll %SystemRoot%\ehome\mcstore.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.dll %SystemRoot%\ehome\Microsoft.MediaCenter.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.Bml\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.Bml.dll %SystemRoot%\ehome\Microsoft.MediaCenter.Bml.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.iTV\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.iTV.dll %SystemRoot%\ehome\Microsoft.MediaCenter.iTV.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.iTv.Hosting\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.iTv.Hosting.dll %SystemRoot%\ehome\Microsoft.MediaCenter.iTv.Hosting.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.ITVVM\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.ITVVM.dll %SystemRoot%\ehome\Microsoft.MediaCenter.ITVVM.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.Playback\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.Playback.dll %SystemRoot%\ehome\Microsoft.MediaCenter.Playback.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.Shell\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.Shell.dll %SystemRoot%\ehome\Microsoft.MediaCenter.Shell.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.Sports\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.Sports.dll %SystemRoot%\ehome\Microsoft.MediaCenter.Sports.dll >nul 2>&1
mklink /h %SystemRoot%\Microsoft.NET\assembly\GAC_MSIL\Microsoft.MediaCenter.UI\v4.0_6.3.0.0__31bf3856ad364e35\Microsoft.MediaCenter.UI.dll %SystemRoot%\ehome\Microsoft.MediaCenter.UI.dll >nul 2>&1

echo.




echo Setting attributes...


attrib +h %ProgramData%
attrib -h -a -i +r "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Accessories"
attrib -a -i +r "%SystemDrive%\Users\Public\Recorded TV\Sample Media"
attrib -a -i +r "%SystemDrive%\Users\Public\Recorded TV"
attrib -h +r "%SystemDrive%\Users\Public\Desktop"
attrib -a -i +h "%SystemDrive%\Users\Public\Desktop"
echo.

echo Deleting the unwanted WMC languages

for /d %%G in %_mui% do (
if not exist "%SystemRoot%\%%G\explorer.exe.mui" (
  rmdir /s /q "%SystemRoot%\ehome\%%G" >nul 2>&1
  )
)
echo.



echo Installing assemblies...
set _ngen=%windir%\Microsoft.NET\Framework64\v4.0.30319\ngen.exe
%_ngen% install "Microsoft.MediaCenter.Mheg, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiwmp, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.Bml, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "mcstoredb, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.iTv.Hosting, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "mcstore, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "mcglidhostobj, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiiTV, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "mcepg, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.iTV.Media, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehshell, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehCIR, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehexthost, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.Playback, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiVidCtl, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiUserXp, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "loadmxf, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiActivScp, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.Sports, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.Interop, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.TV.Tuners.Interop, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiExtens, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "mcupdate, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiWUapi, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.ITVVM, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiTVMSMusic, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiProxy, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "BDATunePIA, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.Shell, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "mcplayerinterop, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiBmlDataCarousel, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiUPnP, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.UI, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Mcx2Dvcs, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=amd64" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.iTV, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehRecObj, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
set _ngen=%windir%\Microsoft.NET\Framework\v4.0.30319\ngen.exe
%_ngen% install "BDATunePIA, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=x86" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "mcstoredb, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=x86" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehexthost32, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=x86" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "ehiExtens, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
%_ngen% install "Microsoft.MediaCenter.UI, Version=6.3.0.0, Culture=Neutral, PublicKeyToken=31bf3856ad364e35, processorArchitecture=msil" /NoDependencies /queue:1 >nul 2>&1
echo.
echo Creating services...
%windir%\system32\sc.exe create ehRecvr binPath= "%systemroot%\ehome\ehRecvr.exe" error= ignore start= demand type= own DisplayName= "@%SystemRoot%\ehome\ehrecvr.exe,-101" depend= RPCSS obj= "NT AUTHORITY\networkService"  2>&1
%windir%\system32\sc.exe create ehSched binPath= "%systemroot%\ehome\ehsched.exe" error= ignore start= demand type= own DisplayName= "@%SystemRoot%\ehome\ehsched.exe,-101" depend= RPCSS obj= "NT AUTHORITY\networkService"  2>&1
%windir%\system32\sc.exe create Mcx2Svc binPath= "%SystemRoot%\system32\svchost.exe -k LocalServiceAndNoImpersonation" error= normal start= demand type= share DisplayName= "@%SystemRoot%\ehome\ehres.dll,-15501" depend= SSDPSRV/DeviceAssociationService/TermService/fdphost obj= "NT Authority\LocalService" 2>&1
echo.
echo Updating registry settings...
%windir%\system32\reg.exe import Install.reg >nul 2>&1
echo.
echo Creating scheduled tasks...
rmdir /s /q "%SystemRoot%\System32\Tasks\Microsoft\Windows\Media Center" >nul 2>&1
%windir%\system32\reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Microsoft\Windows\Media Center" /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\ActivateWindowsSearch" /xml Tasks\ActivateWindowsSearch.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\ConfigureInternetTimeService" /xml Tasks\ConfigureInternetTimeService.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\DispatchRecoveryTasks" /xml Tasks\DispatchRecoveryTasks.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\ehDRMInit" /xml Tasks\ehDRMInit.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\InstallPlayReady" /xml Tasks\InstallPlayReady.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\mcupdate" /xml Tasks\mcupdate.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\mcupdate_scheduled" /xml Tasks\mcupdate_scheduled.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\MediaCenterRecoveryTask" /xml Tasks\MediaCenterRecoveryTask.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\ObjectStoreRecoveryTask" /xml Tasks\ObjectStoreRecoveryTask.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\OCURActivate" /xml Tasks\OCURActivate.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\OCURDiscovery" /xml Tasks\OCURDiscovery.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\PBDADiscovery" /xml Tasks\PBDADiscovery.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\PBDADiscoveryW1" /xml Tasks\PBDADiscoveryW1.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\PBDADiscoveryW2" /xml Tasks\PBDADiscoveryW2.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\PeriodicScanRetry" /xml Tasks\PeriodicScanRetry.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\PvrRecoveryTask" /xml Tasks\PvrRecoveryTask.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\PvrScheduleTask" /xml Tasks\PvrScheduleTask.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\RecordingRestart" /xml Tasks\RecordingRestart.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\RegisterSearch" /xml Tasks\RegisterSearch.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\ReindexSearchRoot" /xml Tasks\ReindexSearchRoot.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\SqlLiteRecoveryTask" /xml Tasks\SqlLiteRecoveryTask.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\StartRecording" /xml Tasks\StartRecording.xml /f >nul 2>&1
schtasks /create /tn "\Microsoft\Windows\Media Center\UpdateRecordPath" /xml Tasks\UpdateRecordPath.xml /f >nul 2>&1
mkdir "%SystemRoot%\System32\Tasks\Microsoft\Windows\Media Center\Extender" >nul 2>&1
echo.
echo Setting access permissions...
SetACL -on "HKLM\SOFTWARE\Classes\AppID\{0E11CB54-4C4A-4B37-AE0B-E93CEE60E646}" -ot reg -actn restore -bckp .\AclClass >nul 2>&1
SetACL -on "HKLM\SOFTWARE\Clients\Media\Windows Media Center" -ot reg -actn restore -bckp .\AclSoft >nul 2>&1
SetACL -on "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Media Center" -ot reg -actn restore -bckp .\AclSoftWow >nul 2>&1
SetACL -on "HKLM\SYSTEM\CurrentControlSet\Services\EventLog\Media Center" -ot reg -actn restore -bckp .\AclSys >nul 2>&1
SetACL -on "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Microsoft\Windows\Media Center"  -ot reg -actn restore -bckp .\AclTaskCache >nul 2>&1
SetACL -on "C:\Users\Public\Recorded TV\desktop.ini" -ot file -actn restore -bckp .\Acl >nul 2>&1

echo.
echo Restoring Microsoft SQLCE COM registrations...
%windir%\system32\reg.exe import RestoreSqlCe.reg >nul 2>&1

echo.
echo Unblocking files

1>nul 2>nul powershell -NoProfile -NonInteractive -InputFormat None -ExecutionPolicy Bypass -Command "& {dir C:\Windows\ehome | Unblock-File}
echo.
echo.
echo Enabling the stock MPEG2 Codecs trough the DVD Player app...



if %winbuild% LSS 10240 goto :noW10

%windir%\system32\reg.exe query HKLM\SOFTWARE\Classes\Installer\Products\AAD08E5278DF5ECD02C2CC206F760320 /v ProductName 2>nul | findstr /C:"WindowsDVDPlayer" 1>nul && goto :dvdinstalled



echo.
echo Installing the app...
%windir%\System32\reg.exe add HKLM\SYSTEM\CurrentControlSet\Services\ADOVMPPackage\Final /v ActivationEnabled /t REG_DWORD /d 2 /f >nul 2>&1
windows10.0-kb3106246-x64.msi /qn >nul 2>&1

goto :end

:noW10

echo.
echo The DVDplayer app dosen't work on Win8.1 or Win Sever 2012 R2, skipping installation
echo Please install the LAV Codecs, if not already installed
goto :end

:noW81
echo.
echo This package requires at least Win8.1 or Win Sever 2012 R2, skipping installation

goto :end

:dvdinstalled

echo.
echo The DVDplayer app is already installed, skipping installation


:end
echo.
echo Done.
echo.
echo Press any key to exit.
pause >nul
exit
