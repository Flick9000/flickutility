@ECHO OFF
setlocal enabledelayedexpansion
title Flick's Post-Install Utility
mode con: cols=60 lines=15
cd %~dp0
cls

goto check_Permissions
:check_Permissions
echo Administrative permissions required. 
powershell write-host -fore Red Checking permissions...
net session >nul 2>&1
if [%errorLevel%] == [0] (
powershell write-host -fore Green Success: Administrative permissions confirmed.
pause
for /f "delims=" %%E in ('forfiles /p "%~dp0." /m "%~nx0" /c "cmd /c echo(0x1B"') do (
    set "ESC=%%E"
)
goto MENU
) else (
powershell write-host -fore Red Failure: Current permissions inadequate.
powershell write-host -fore Red Fix: Run the Batch as Administrator.
)
pause
exit

REM MAIN MENU
:MENU
title Flick's Post-Install Utility
chcp 65001 > nul 
mode con: cols=125 lines=45
cls    
ECHO:
ECHO:
ECHO:
ECHO:
ECHO:
ECHO:
echo              %Esc%[35m███████╗██╗     ██╗ ██████╗██╗  ██╗ ███╗ ███████╗    ██╗   ██╗████████╗██╗██╗     ██╗████████╗██╗   ██╗
echo              ██╔════╝██║     ██║██╔════╝██║ ██╔╝██╔██╗██╔════╝    ██║   ██║╚══██╔══╝██║██║     ██║╚══██╔══╝╚██╗ ██╔╝
echo              █████╗  ██║     ██║██║     █████╔╝ ╚═╝╚═╝███████╗    ██║   ██║   ██║   ██║██║     ██║   ██║    ╚████╔╝ 
echo              ██╔══╝  ██║     ██║██║     ██╔═██╗       ╚════██║    ██║   ██║   ██║   ██║██║     ██║   ██║     ╚██╔╝  
echo              ██║     ███████╗██║╚██████╗██║  ██╗      ███████║    ╚██████╔╝   ██║   ██║███████╗██║   ██║      ██║   
echo              ╚═╝     ╚══════╝╚═╝ ╚═════╝╚═╝  ╚═╝      ╚══════╝     ╚═════╝    ╚═╝   ╚═╝╚══════╝╚═╝   ╚═╝      ╚═╝%Esc%[0m   
echo:
echo:
echo                    %ESC%[35m╔═════════════════════════════════════════════════════════════════════════════════════╗%ESC%[0m
echo                    %ESC%[35m║          %ESC%[0mVersion 0.1                                     Welcome %username%          %ESC%[35m║
echo                    %ESC%[35m╚═════════════════════════════════════════════════════════════════════════════════════╝%ESC%[0m
ECHO:
ECHO:
echo                            %ESC%[31m1. %ESC%[0mActivate Windows                            %ESC%[0m %ESC%[31m2. %ESC%[0mOptimize Windows
echo:
echo:
echo                                                  %ESC%[31m3. %ESC%[0mDrivers ^& Utilities%ESC%[0m
echo:
echo:
echo                    %ESC%[35m╔═════════════════════════════════════════════════════════════════════════════════════╗%ESC%[0m
echo                    %ESC%[35m║                                 %ESC%[35mG. %ESC%[0mGithub Page                                      %ESC%[35m║
echo                    %ESC%[35m╚═════════════════════════════════════════════════════════════════════════════════════╝%ESC%[0m
echo:
chcp 437 > NUL
CHOICE /C 123G /n
if %errorlevel%==4 call :MENU
if %errorlevel%==3 call :LIBRARIES
if %errorlevel%==2 call :TWEAKS
if %errorlevel%==1 call :ACTIVATE

REM ACTIVATE MENU
:ACTIVATE
title Flick's Post-Install Utility
chcp 65001 > nul 
cls    
ECHO:
ECHO:
ECHO:
ECHO:
ECHO:
ECHO:
echo                %ESC%[35m██╗███╗   ██╗███████╗████████╗██████╗ ██╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗%ESC%[0m 
echo                %ESC%[35m██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║   ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝%ESC%[0m 
echo                %ESC%[35m██║██╔██╗ ██║███████╗   ██║   ██████╔╝██║   ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████%ESC%[0m
echo                %ESC%[35m██║██║╚██╗██║╚════██║   ██║   ██╔══██╗██║   ██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║%ESC%[0m 
echo                %ESC%[35m██║██║ ╚████║███████║   ██║   ██║  ██║╚██████╔╝╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║%ESC%[0m 
echo                %ESC%[35m╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝%ESC%[0m 
echo:
echo:
echo                %ESC%[35mStep 1.%ESC%[0m For activating Windows, select "HWID", and wait for MAS to finish activating Windows.
echo:
echo                %ESC%[35mStep 2.%ESC%[0m For activating Office, select "OHook", and wait for MAS to finish activating Office.
echo:
echo                %ESC%[35mStep 3.%ESC%[0m For checking if your system is activated, select "Activation Status".
echo:       
echo                %ESC%[35mStep 4.%ESC%[0m Close the Microsoft Activation Script and press enter for going back to the menu.
echo:
chcp 437 > nul                                                                               
powershell.exe -command "irm https://massgrave.dev/get | iex"     
echo    	                                            %ESC%[31mPress "Enter" to go back.%ESC%[0m                                                                  
pause > nul
goto MENU


REM WINDOWS TWEAKS MENU
:TWEAKS
title Flick's Post-Install Utility
chcp 65001 > nul 
cls    
ECHO:
ECHO:
ECHO:
ECHO:
ECHO:
ECHO:
echo                                     %ESC%[35m████████╗██╗    ██╗███████╗ █████╗ ██╗  ██╗███████╗%ESC%[0m 
echo                                     %ESC%[35m╚══██╔══╝██║    ██║██╔════╝██╔══██╗██║ ██╔╝██╔════╝%ESC%[0m 
echo                                     %ESC%[35m   ██║   ██║ █╗ ██║█████╗  ███████║█████╔╝ ███████╗%ESC%[0m 
echo                                     %ESC%[35m   ██║   ██║███╗██║██╔══╝  ██╔══██║██╔═██╗ ╚════██║%ESC%[0m 
echo                                     %ESC%[35m   ██║   ╚███╔███╔╝███████╗██║  ██║██║  ██╗███████║%ESC%[0m 
echo                                     %ESC%[35m   ╚═╝    ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝%ESC%[0m 
echo:
echo:
echo                                            %ESC%[31mTools%ESC%[0m                         %ESC%[31mTweaks%ESC%[0m
echo:  
echo                                       %ESC%[35m1. %ESC%[0mCTT Utility              %ESC%[35m4. %ESC%[0mOptimize Visual FXs
echo                                       %ESC%[35m2. %ESC%[0mO^&O Shutup               %ESC%[35m5. %ESC%[0mSchedule Clean at Start
echo                                       %ESC%[35m3. %ESC%[0mHarden Tools             %ESC%[35m6. %ESC%[0mChoose from DNS list
echo:  
echo:  
echo                                                          %ESC%[31mShortcuts%ESC%[0m
echo:  
echo                                                       %ESC%[35mA. %ESC%[0mControl Panel
echo                                                       %ESC%[35mB. %ESC%[0mTask Scheduler
echo                                                       %ESC%[35mC. %ESC%[0mSettings
echo                                                       %ESC%[35mD. %ESC%[0mMSConfig
echo:  
echo:  
echo    	                                            %ESC%[31mEnter "Z" to go back.%ESC%[0m
echo:
chcp 437 > NUL
CHOICE /C 123456ZABCD /n

REM CTT
if %errorlevel%==1 (
    cls
    echo:
    powershell write-host -fore Red Downloading Chris Titus Tech Windows Utility for improving overall system performance and privacy...
    powershell.exe -command "irm https://christitus.com/win | iex" | title
    powershell write-host -fore Green Done. Press enter to go back to the menu.
    pause > nul
    GOTO TWEAKS
)
REM OOSU
if %errorlevel%==2 (
    cls
    cd %~dp0
    echo:
    powershell write-host -fore Red Downloading and applying optimal OO ShutUp settings for better performance and privacy...
    powershell -Command "Invoke-WebRequest https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe -OutFile %~dp0\OOSU10.exe"
    
    REM CREATING CUSTOM OOSU CONFIG FILE
    echo P001	+ >> ooshutup10.cfg
    echo P002	+ >> ooshutup10.cfg
    echo P003	+ >> ooshutup10.cfg
    echo P004	+ >> ooshutup10.cfg
    echo P005	+ >> ooshutup10.cfg
    echo P006	+ >> ooshutup10.cfg
    echo P008	+ >> ooshutup10.cfg
    echo P026	+ >> ooshutup10.cfg
    echo P027	+ >> ooshutup10.cfg
    echo P028	+ >> ooshutup10.cfg
    echo P064	+ >> ooshutup10.cfg
    echo P065	+ >> ooshutup10.cfg
    echo P066	+ >> ooshutup10.cfg
    echo P067	+ >> ooshutup10.cfg
    echo P070	+ >> ooshutup10.cfg
    echo P069	+ >> ooshutup10.cfg
    echo P009	+ >> ooshutup10.cfg
    echo P010	+ >> ooshutup10.cfg
    echo P015	+ >> ooshutup10.cfg
    echo P068	- >> ooshutup10.cfg
    echo P016	- >> ooshutup10.cfg
    echo A001	+ >> ooshutup10.cfg
    echo A002	+ >> ooshutup10.cfg
    echo A003	+ >> ooshutup10.cfg
    echo A004	+ >> ooshutup10.cfg
    echo A006	+ >> ooshutup10.cfg
    echo A005	+ >> ooshutup10.cfg
    echo P007	+ >> ooshutup10.cfg
    echo P036	+ >> ooshutup10.cfg
    echo P025	+ >> ooshutup10.cfg
    echo P033	+ >> ooshutup10.cfg
    echo P023	+ >> ooshutup10.cfg
    echo P056	+ >> ooshutup10.cfg
    echo P057	+ >> ooshutup10.cfg
    echo P012	- >> ooshutup10.cfg
    echo P034	- >> ooshutup10.cfg
    echo P013	- >> ooshutup10.cfg
    echo P035	- >> ooshutup10.cfg
    echo P062	+ >> ooshutup10.cfg
    echo P063	+ >> ooshutup10.cfg
    echo P081	- >> ooshutup10.cfg
    echo P047	+ >> ooshutup10.cfg
    echo P019	+ >> ooshutup10.cfg
    echo P048	+ >> ooshutup10.cfg
    echo P049	+ >> ooshutup10.cfg
    echo P020	+ >> ooshutup10.cfg
    echo P037	+ >> ooshutup10.cfg
    echo P011	+ >> ooshutup10.cfg
    echo P038	+ >> ooshutup10.cfg
    echo P050	+ >> ooshutup10.cfg
    echo P051	+ >> ooshutup10.cfg
    echo P018	+ >> ooshutup10.cfg
    echo P039	+ >> ooshutup10.cfg
    echo P021	+ >> ooshutup10.cfg
    echo P040	+ >> ooshutup10.cfg
    echo P022	+ >> ooshutup10.cfg
    echo P041	+ >> ooshutup10.cfg
    echo P014	+ >> ooshutup10.cfg
    echo P042	+ >> ooshutup10.cfg
    echo P052	+ >> ooshutup10.cfg
    echo P053	+ >> ooshutup10.cfg
    echo P054	+ >> ooshutup10.cfg
    echo P055	+ >> ooshutup10.cfg
    echo P029	- >> ooshutup10.cfg
    echo P043	- >> ooshutup10.cfg
    echo P030	+ >> ooshutup10.cfg
    echo P044	+ >> ooshutup10.cfg
    echo P031	- >> ooshutup10.cfg
    echo P045	- >> ooshutup10.cfg
    echo P032	- >> ooshutup10.cfg
    echo P046	- >> ooshutup10.cfg
    echo P058	+ >> ooshutup10.cfg
    echo P059	+ >> ooshutup10.cfg
    echo P060	+ >> ooshutup10.cfg
    echo P061	+ >> ooshutup10.cfg
    echo P071	- >> ooshutup10.cfg
    echo P072	- >> ooshutup10.cfg
    echo P073	- >> ooshutup10.cfg
    echo P074	- >> ooshutup10.cfg
    echo P075	- >> ooshutup10.cfg
    echo P076	- >> ooshutup10.cfg
    echo P077	+ >> ooshutup10.cfg
    echo P078	+ >> ooshutup10.cfg
    echo P079	- >> ooshutup10.cfg
    echo P080	- >> ooshutup10.cfg
    echo P024	- >> ooshutup10.cfg
    echo S001	+ >> ooshutup10.cfg
    echo S002	+ >> ooshutup10.cfg
    echo S003	+ >> ooshutup10.cfg
    echo S008	- >> ooshutup10.cfg
    echo E101	+ >> ooshutup10.cfg
    echo E201	+ >> ooshutup10.cfg
    echo E115	+ >> ooshutup10.cfg
    echo E215	+ >> ooshutup10.cfg
    echo E118	+ >> ooshutup10.cfg
    echo E218	+ >> ooshutup10.cfg
    echo E107	+ >> ooshutup10.cfg
    echo E207	+ >> ooshutup10.cfg
    echo E111	+ >> ooshutup10.cfg
    echo E211	+ >> ooshutup10.cfg
    echo E112	+ >> ooshutup10.cfg
    echo E212	+ >> ooshutup10.cfg
    echo E109	+ >> ooshutup10.cfg
    echo E209	+ >> ooshutup10.cfg
    echo E121	+ >> ooshutup10.cfg
    echo E221	+ >> ooshutup10.cfg
    echo E103	+ >> ooshutup10.cfg
    echo E203	+ >> ooshutup10.cfg
    echo E123	+ >> ooshutup10.cfg
    echo E223	+ >> ooshutup10.cfg
    echo E124	+ >> ooshutup10.cfg
    echo E224	+ >> ooshutup10.cfg
    echo E128	+ >> ooshutup10.cfg
    echo E228	+ >> ooshutup10.cfg
    echo E119	- >> ooshutup10.cfg
    echo E219	- >> ooshutup10.cfg
    echo E120	- >> ooshutup10.cfg
    echo E220	- >> ooshutup10.cfg
    echo E122	- >> ooshutup10.cfg
    echo E222	- >> ooshutup10.cfg
    echo E125	- >> ooshutup10.cfg
    echo E225	- >> ooshutup10.cfg
    echo E126	- >> ooshutup10.cfg
    echo E226	- >> ooshutup10.cfg
    echo E106	- >> ooshutup10.cfg
    echo E206	- >> ooshutup10.cfg
    echo E127	- >> ooshutup10.cfg
    echo E227	- >> ooshutup10.cfg
    echo E001	+ >> ooshutup10.cfg
    echo E002	+ >> ooshutup10.cfg
    echo E003	+ >> ooshutup10.cfg
    echo E008	+ >> ooshutup10.cfg
    echo E007	+ >> ooshutup10.cfg
    echo E010	+ >> ooshutup10.cfg
    echo E011	+ >> ooshutup10.cfg
    echo E012	+ >> ooshutup10.cfg
    echo E009	+ >> ooshutup10.cfg
    echo E004	- >> ooshutup10.cfg
    echo E005	- >> ooshutup10.cfg
    echo E013	+ >> ooshutup10.cfg
    echo E014	+ >> ooshutup10.cfg
    echo E006	- >> ooshutup10.cfg
    echo Y001	+ >> ooshutup10.cfg
    echo Y002	+ >> ooshutup10.cfg
    echo Y003	+ >> ooshutup10.cfg
    echo Y004	+ >> ooshutup10.cfg
    echo Y005	+ >> ooshutup10.cfg
    echo Y006	+ >> ooshutup10.cfg
    echo Y007	+ >> ooshutup10.cfg
    echo C012	+ >> ooshutup10.cfg
    echo C002	+ >> ooshutup10.cfg
    echo C013	+ >> ooshutup10.cfg
    echo C007	+ >> ooshutup10.cfg
    echo C008	+ >> ooshutup10.cfg
    echo C009	+ >> ooshutup10.cfg
    echo C010	+ >> ooshutup10.cfg
    echo C011	+ >> ooshutup10.cfg
    echo C014	+ >> ooshutup10.cfg
    echo C015	+ >> ooshutup10.cfg
    echo C101	+ >> ooshutup10.cfg
    echo C201	+ >> ooshutup10.cfg
    echo C102	+ >> ooshutup10.cfg
    echo L001	+ >> ooshutup10.cfg
    echo L003	+ >> ooshutup10.cfg
    echo L004	+ >> ooshutup10.cfg
    echo L005	+ >> ooshutup10.cfg
    echo U001	+ >> ooshutup10.cfg
    echo U004	+ >> ooshutup10.cfg
    echo U005	+ >> ooshutup10.cfg
    echo U006	+ >> ooshutup10.cfg
    echo U007	+ >> ooshutup10.cfg
    echo W001	+ >> ooshutup10.cfg
    echo W011	+ >> ooshutup10.cfg
    echo W004	- >> ooshutup10.cfg
    echo W005	- >> ooshutup10.cfg
    echo W010	- >> ooshutup10.cfg
    echo W009	- >> ooshutup10.cfg
    echo P017	+ >> ooshutup10.cfg
    echo W006	- >> ooshutup10.cfg
    echo W008	- >> ooshutup10.cfg
    echo M006	+ >> ooshutup10.cfg
    echo M011	- >> ooshutup10.cfg
    echo M010	+ >> ooshutup10.cfg
    echo O003	+ >> ooshutup10.cfg
    echo O001	+ >> ooshutup10.cfg
    echo S012	+ >> ooshutup10.cfg
    echo S013	+ >> ooshutup10.cfg
    echo S014	- >> ooshutup10.cfg
    echo K001	+ >> ooshutup10.cfg
    echo K002	+ >> ooshutup10.cfg
    echo K005	+ >> ooshutup10.cfg
    echo M003	+ >> ooshutup10.cfg
    echo M015	+ >> ooshutup10.cfg
    echo M016	+ >> ooshutup10.cfg
    echo M017	+ >> ooshutup10.cfg
    echo M018	+ >> ooshutup10.cfg
    echo M019	+ >> ooshutup10.cfg
    echo M020	+ >> ooshutup10.cfg
    echo M021	- >> ooshutup10.cfg
    echo M022	+ >> ooshutup10.cfg
    echo M001	+ >> ooshutup10.cfg
    echo M004	+ >> ooshutup10.cfg
    echo M005	+ >> ooshutup10.cfg
    echo M024	+ >> ooshutup10.cfg
    echo M012	+ >> ooshutup10.cfg
    echo M013	+ >> ooshutup10.cfg
    echo M014	+ >> ooshutup10.cfg
    echo N001	- >> ooshutup10.cfg
    REM CUSTOM OOSU CONFIG FILE CREATED

    start OOSU10.exe ooshutup10.cfg /force
    powershell write-host -fore Green Done. Press enter to go back to the menu.
    pause > nul
    GOTO TWEAKS
)
REM HARDENTOOLS
if %errorlevel%==3 (
    cls
    cd %~dp0
    echo:
    powershell write-host -fore Red Downloading HardenTools to fix exploits and improve overall system security...
    powershell -Command "Invoke-WebRequest https://github.com/hardentools/hardentools/releases/latest/download/hardentools.exe -OutFile %~dp0\hardentools.exe"
    start hardentools.exe
    powershell write-host -fore Green Done. Press enter to go back to the menu.
    pause > nul
    GOTO TWEAKS
)
REM VISUALFX
if %errorlevel%==4 (
    echo:
    powershell write-host -fore Red Optimizing Windows Visual Effects to increase performance...
    Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d "1" /f
    Reg.exe add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /t REG_SZ /d "1" /f
    Reg.exe add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d "2" /f
    Reg.exe add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "9012038012000000" /f
    Reg.exe add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "1" /f
    Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d "0" /f
    Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d "0" /f
    Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f
    Reg.exe add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d "3" /f
    Reg.exe add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
    powershell write-host -fore Green Done. Press enter to go back to the menu.
    pause > nul
    GOTO TWEAKS
)
REM AUTOCLEANER
if %errorlevel%==5 (
    cls
    cd %appdata%\Microsoft\Windows\Start Menu\Programs\Startup
    echo:
    echo del /s /f /q c:\windows\temp\*.* >> autocleaner.bat
    echo del /s /f /q C:\WINDOWS\Prefetch >> autocleaner.bat
    echo del /s /f /q %temp%\*.* >> autocleaner.bat
    echo deltree /y c:\windows\tempor~1 >> autocleaner.bat
    echo deltree /y c:\windows\temp >> autocleaner.bat
    echo deltree /y c:\windows\tmp >> autocleaner.bat
    echo deltree /y c:\windows\ff*.tmp >> autocleaner.bat
    echo deltree /y c:\windows\history >> autocleaner.bat
    echo deltree /y c:\windows\cookies >> autocleaner.bat
    echo deltree /y c:\windows\recent >> autocleaner.bat
    echo deltree /y c:\windows\spool\printers >> autocleaner.bat
    powershell write-host -fore Green Auto-Cleaner created and scheduled at Windows Start.
    pause > nul
    GOTO TWEAKS
)

REM CHANGE MENU
if %errorlevel%==6 call :SETDNS
if %errorlevel%==7 call :MENU

REM SHORTCUTS
if %errorlevel%==8 (
    start control
    pause > nul
    GOTO TWEAKS
)
if %errorlevel%==9 (
    start taskschd.msc
    pause > nul
    GOTO TWEAKS
)
if %errorlevel%==10 (
    start ms-settings:
    pause > nul
    GOTO TWEAKS
)
if %errorlevel%==11 (
    start msconfig
    pause > nul
    GOTO TWEAKS
)
pause > nul

REM SETDNS MENU
:SETDNS
title Flick's Post-Install Utility
chcp 65001 > nul 
cls    
ECHO:
ECHO:
ECHO:
ECHO:
ECHO:
ECHO:
echo                           %ESC%[35m██████╗ ███╗   ██╗███████╗    ███████╗███████╗████████╗██╗   ██╗██████╗%ESC%[0m  
echo                           %ESC%[35m██╔══██╗████╗  ██║██╔════╝    ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗%ESC%[0m 
echo                           %ESC%[35m██║  ██║██╔██╗ ██║███████╗    ███████╗█████╗     ██║   ██║   ██║██████╔╝%ESC%[0m 
echo                           %ESC%[35m██║  ██║██║╚██╗██║╚════██║    ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝%ESC%[0m 
echo                           %ESC%[35m██████╔╝██║ ╚████║███████║    ███████║███████╗   ██║   ╚██████╔╝██║%ESC%[0m 
echo                           %ESC%[35m╚═════╝ ╚═╝  ╚═══╝╚══════╝    ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝%ESC%[0m         
echo:
echo:
echo                                                          %ESC%[31mDNS List%ESC%[0m
echo:  
echo                                                       %ESC%[35m1. %ESC%[0mGoogle DNS
echo:
echo                                                       %ESC%[35m2. %ESC%[0mCloudflare DNS
echo:
echo                                                       %ESC%[35m3. %ESC%[0mOpenDNS Home
echo:
echo                                                       %ESC%[35m4. %ESC%[0mQuad9 DNS
echo:
echo:
echo    	                                             %ESC%[31mEnter "Z" to go back.%ESC%[0m
chcp 437 > NUL
CHOICE /C 1234Z /n

REM GOOGLE DNS
if %errorlevel%==1 (
    powershell write-host -fore Red Configuring Google DNS as Default...
    netsh int ip reset
    netsh winsock reset
    netsh advfirewall reset
    ipconfig /release
    ipconfig /renew
    ipconfig /flushdns
    netsh interface ip set dns name="Ethernet" static 8.8.8.8
    netsh interface ip add dns name="Ethernet" 8.8.4.4 index=2
    powershell write-host -fore Green Google DNS Configured.
    pause>nul
    GOTO TWEAKS
)
REM CLOUDFLARE DNS
if %errorlevel%==2 (
    powershell write-host -fore Red Configuring Cloudflare DNS as Default...
    netsh int ip reset
    netsh winsock reset
    netsh advfirewall reset
    ipconfig /release
    ipconfig /renew
    ipconfig /flushdns
    netsh interface ip set dns name="Ethernet" static 1.1.1.1
    netsh interface ip add dns name="Ethernet" 1.0.0.1 index=2
    powershell write-host -fore Green Cloudflare DNS Configured.
    pause>nul
    GOTO TWEAKS
)
REM OPENDNS DNS
if %errorlevel%==3 (
    powershell write-host -fore Red Configuring  OpenDNS as Default...
    netsh int ip reset
    netsh winsock reset
    netsh advfirewall reset
    ipconfig /release
    ipconfig /renew
    ipconfig /flushdns
    netsh interface ip set dns name="Ethernet" static 208.67.222.222
    netsh interface ip add dns name="Ethernet" 208.67.220.220 index=2
    powershell write-host -fore Green OpenDNS Configured.
    pause>nul
    GOTO TWEAKS
)
REM QUAD9 DNS
if %errorlevel%==4 (
    powershell write-host -fore Red Configuring Quad9 DNS as Default...
    netsh int ip reset
    netsh winsock reset
    netsh advfirewall reset
    ipconfig /release
    ipconfig /renew
    ipconfig /flushdns
    netsh interface ip set dns name="Ethernet" static 9.9.9.9
    netsh interface ip add dns name="Ethernet" 149.112.112.112 index=2
    powershell write-host -fore Green Quad9 DNS Configured.
    pause>nul
    GOTO TWEAKS
)
if %errorlevel%==5 call :TWEAKS

pause > nul
GOTO TWEAKS


REM DRIVERS & LIBRARIES MENU
:LIBRARIES
title Flick's Post-Install Utility
chcp 65001 > nul 
cls      
ECHO:
ECHO:
ECHO:
ECHO:
ECHO:
ECHO:
echo                         %ESC%[35m██████╗ ███████╗███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗███████╗███████╗
echo                         %ESC%[35m██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
echo                         %ESC%[35m██████╔╝█████╗  ███████╗██║   ██║██║   ██║██████╔╝██║     █████╗  ███████╗
echo                         %ESC%[35m██╔══██╗██╔══╝  ╚════██║██║   ██║██║   ██║██╔══██╗██║     ██╔══╝  ╚════██║
echo                         %ESC%[35m██║  ██║███████╗███████║╚██████╔╝╚██████╔╝██║  ██║╚██████╗███████╗███████║
echo                         %ESC%[35m╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝%ESC%[0m
echo:
echo:
echo                                                           %ESC%[31mDrivers%ESC%[0m
echo:
echo                                       %ESC%[35m1. %ESC%[0mNVIDIA Drivers              %ESC%[35m4. %ESC%[0mAMD Drivers
echo                                       %ESC%[35m2. %ESC%[0mNVCleanstall                %ESC%[35m5. %ESC%[0mWagnard DDU
echo                                       %ESC%[35m3. %ESC%[0mC++ 2015-22 x64             %ESC%[35m6. %ESC%[0mC++ 2015-22 x32
echo:
echo:
echo                                                          %ESC%[31mUtilities%ESC%[0m
echo:
echo                                                     %ESC%[35mA. %ESC%[0mMSI Afterburner
echo                                                     %ESC%[35mB. %ESC%[0mProcessor Lasso
echo                                                     %ESC%[35mC. %ESC%[0mHW Monitor
echo:
echo:
echo    	                                             %ESC%[31mEnter "Z" to go back.%ESC%[0m
echo:
chcp 437 > NUL
CHOICE /C 123456ABCZ /n
if %errorlevel%==10 GOTO MENU

if %errorlevel%==9 (
winget install -e --id CPUID.HWMonitor
powershell write-host -fore Green Done. Press enter to go back to the menu.
pause>nul
goto libraries
)

if %errorlevel%==8 (
winget install -e --id BitSum.ProcessLasso
powershell write-host -fore Green Done. Press enter to go back to the menu.
pause>nul
goto libraries
)

if %errorlevel%==7 (
winget install -e --id Guru3D.Afterburner
powershell write-host -fore Green Done. Press enter to go back to the menu.
pause>nul
goto libraries
)

if %errorlevel%==6 (
winget install -e --id Microsoft.VCRedist.2015+.x86
powershell write-host -fore Green Done. Press enter to go back to the menu.
pause>nul
goto libraries
)

if %errorlevel%==5 (
winget install -e --id Wagnardsoft.DisplayDriverUninstaller
powershell write-host -fore Green Done. Press enter to go back to the menu.
pause>nul
goto libraries
)

if %errorlevel%==4 (
start https://www.amd.com/en/support
powershell write-host -fore Green Done. Press enter to go back to the menu.
pause>nul
goto libraries
)

if %errorlevel%==3 (
winget install -e --id Microsoft.VCRedist.2015+.x64
powershell write-host -fore Green Done. Press enter to go back to the menu.
pause>nul
goto libraries
)

if %errorlevel%==2 (
winget install -e --id TechPowerUp.NVCleanstall
powershell write-host -fore Green Done. Press enter to go back to the menu.
pause>nul
goto libraries
)

if %errorlevel%==1 (
start https://www.nvidia.com/download/index.aspx
powershell write-host -fore Green Done. Press enter to go back to the menu.
pause>nul
goto libraries
)

pause > nul
