; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "OpenJUMP"
!define PRODUCT_VERSION "1.4.0.2"
!define PRODUCT_PUBLISHER "Jump Pilot Project"
!define PRODUCT_WEB_SITE "http://www.openjump.org"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\AppMainExe.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

;The program check you have a recent JRE (actually, a JRE 1.5 should be sufficient)
!define JRE_VERSION "1.6"
;This URL loads JRE 1.6 Update 22 (version to be installed locally)
!define JRE_URL "http://javadl.sun.com/webapps/download/AutoDL?BundleId=42732"
;check JREDyna.nsh is in the same directory as this nsi file
;JREDyna.nsh has been found on
;http://nsis.sourceforge.net/Java_Runtime_Environment_Dynamic_Installer


; MUI 1.67 compatible ------
; MUI.nsh and nsDialogs are included with NSIS distribution
!include "MUI.nsh"
!include "nsDialogs.nsh"
; JREDyna has to be added in the same directory as this one
; it's a specific module to detect the JRE and load it if needed
; loaded at http://nsis.sourceforge.net/Java_Runtime_Environment_Dynamic_Installer
!include "JREDyna.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "..\icon\openjump_icon3.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!define MUI_LICENSEPAGE_CHECKBOX
!insertmacro MUI_PAGE_LICENSE "..\etc\licenses\gpl2_license.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Notification for JRE needs JREDyna.nsi
!insertmacro CUSTOM_PAGE_JREINFO
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\bin\OpenJUMP.exe"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\readme.txt"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "Czech"
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Finnish"
!insertmacro MUI_LANGUAGE "French"
!insertmacro MUI_LANGUAGE "German"
!insertmacro MUI_LANGUAGE "Italian"
!insertmacro MUI_LANGUAGE "Japanese"
!insertmacro MUI_LANGUAGE "Portuguese"
!insertmacro MUI_LANGUAGE "PortugueseBR"
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "Spanish"
!insertmacro MUI_LANGUAGE "TradChinese"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "openjump-installer.exe"
InstallDir "$PROGRAMFILES\OpenJUMP"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Section "MainSection" SEC01
  ;Call DetectJRE
  Call DownloadAndInstallJREIfNecessary
  SetOutPath "$INSTDIR"
;  SetOverwrite ifnewer
;  SetOutPath "$INSTDIR\bin"
  SetOverwrite try
  File "openjump-1.4.0.2forwin\bin\default-plugins.xml"
  File "openjump-1.4.0.2forwin\bin\log4j.xml"
  File "openjump-1.4.0.2forwin\bin\oj_linux.sh"
  File "openjump-1.4.0.2forwin\bin\oj_macosx.command"
  File "openjump-1.4.0.2forwin\bin\oj_windows.bat"
  SetOutPath "$INSTDIR\bin\OpenJUMP.app\Contents"
  File "openjump-1.4.0.2forwin\bin\OpenJUMP.app\Contents\Info.plist"
  SetOutPath "$INSTDIR\bin\OpenJUMP.app\Contents\MacOS"
  File "openjump-1.4.0.2forwin\bin\OpenJUMP.app\Contents\MacOS\oj.sh"
  SetOutPath "$INSTDIR\bin\OpenJUMP.app\Contents\Resources"
  File "openjump-1.4.0.2forwin\bin\OpenJUMP.app\Contents\Resources\oj.icns"
  SetOutPath "$INSTDIR\bin"
  File "openjump-1.4.0.2forwin\bin\OpenJUMP.exe"
  CreateDirectory "$SMPROGRAMS\OpenJUMP"
  CreateShortCut "$SMPROGRAMS\OpenJUMP\OpenJUMP.lnk" "$INSTDIR\bin\OpenJUMP.exe"
  CreateShortCut "$DESKTOP\OpenJUMP.lnk" "$INSTDIR\bin\OpenJUMP.exe"
  File "openjump-1.4.0.2forwin\bin\OpenJUMP.ini"
  File "openjump-1.4.0.2forwin\bin\openjump_icon3.ico"
  File "openjump-1.4.0.2forwin\bin\workbench-properties.xml"
  SetOutPath "$INSTDIR"
  File "openjump-1.4.0.2forwin\Changes.txt"
  SetOutPath "$INSTDIR\lib"
  File "openjump-1.4.0.2forwin\lib\.project"
  File "openjump-1.4.0.2forwin\lib\batik-all.jar"
  File "openjump-1.4.0.2forwin\lib\bsh-2.0b4.jar"
  File "openjump-1.4.0.2forwin\lib\Buoy.jar"
  File "openjump-1.4.0.2forwin\lib\ermapper.jar"
  SetOutPath "$INSTDIR\lib\ext\BeanTools"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\0-Help.bsh"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\1-HelloWorld.bsh"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\2-NewLayer.bsh"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\3-Populate.bsh"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\4-AddAttribute.bsh"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\5-ChangeAttributeValue.bsh"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\6-PushPinPoints.bsh"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\7-AddXYAsAttributes.bsh"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\8-GetInvalidShapefileRings.bsh"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\RefreshScriptsMenu.bsh"
  File "openjump-1.4.0.2forwin\lib\ext\BeanTools\SaveViewAsBeanTool.bsh"
  SetOutPath "$INSTDIR\lib\ext\jython"
  File "openjump-1.4.0.2forwin\lib\ext\jython\AlignSelected.py"
  File "openjump-1.4.0.2forwin\lib\ext\jython\ArcTool.py"
  File "openjump-1.4.0.2forwin\lib\ext\jython\CircleTool.py"
  File "openjump-1.4.0.2forwin\lib\ext\jython\DistributeSelected.py"
  SetOutPath "$INSTDIR\lib\ext\jython\images"
  File "openjump-1.4.0.2forwin\lib\ext\jython\images\DrawArc.gif"
  File "openjump-1.4.0.2forwin\lib\ext\jython\images\DrawCircle.gif"
  File "openjump-1.4.0.2forwin\lib\ext\jython\images\DrawCorner.gif"
  File "openjump-1.4.0.2forwin\lib\ext\jython\images\DrawOval.gif"
  File "openjump-1.4.0.2forwin\lib\ext\jython\images\DrawPoint.gif"
  File "openjump-1.4.0.2forwin\lib\ext\jython\images\DrawRoad.gif"
  File "openjump-1.4.0.2forwin\lib\ext\jython\images\DrawRotRect.gif"
  SetOutPath "$INSTDIR\lib\ext\jython"
  File "openjump-1.4.0.2forwin\lib\ext\jython\OvalTool.py"
  File "openjump-1.4.0.2forwin\lib\ext\jython\RightAngleTool.py"
  File "openjump-1.4.0.2forwin\lib\ext\jython\RoadTool.py"
  File "openjump-1.4.0.2forwin\lib\ext\jython\RotatedRectangleTool.py"
  File "openjump-1.4.0.2forwin\lib\ext\jython\SetASHSLabel.py"
  File "openjump-1.4.0.2forwin\lib\ext\jython\startup.py"
  File "openjump-1.4.0.2forwin\lib\ext\jython\UnionSelected.py"
  SetOutPath "$INSTDIR\lib\ext"
  File "openjump-1.4.0.2forwin\lib\ext\NCScnet.dll"
  File "openjump-1.4.0.2forwin\lib\ext\NCSEcw.dll"
  File "openjump-1.4.0.2forwin\lib\ext\NCSUtil.dll"
  File "openjump-1.4.0.2forwin\lib\ext\readme.txt"
  SetOutPath "$INSTDIR\lib"
  File "openjump-1.4.0.2forwin\lib\jai_codec.jar"
  File "openjump-1.4.0.2forwin\lib\jai_core.jar"
  File "openjump-1.4.0.2forwin\lib\Jama-1.0.1.jar"
  File "openjump-1.4.0.2forwin\lib\jdom.jar"
  File "openjump-1.4.0.2forwin\lib\jmatharray-20070905.jar"
  File "openjump-1.4.0.2forwin\lib\jmathplot-20070905.jar"
  File "openjump-1.4.0.2forwin\lib\jts-1.11.jar"
  File "openjump-1.4.0.2forwin\lib\jython.jar"
  File "openjump-1.4.0.2forwin\lib\log4j-1.2.16.jar"
  File "openjump-1.4.0.2forwin\lib\openjump-api-1.4.0.2.jar"
  File "openjump-1.4.0.2forwin\lib\openjump-workbench-1.4.0.2.jar"
  File "openjump-1.4.0.2forwin\lib\postgis_1_0_0.jar"
  File "openjump-1.4.0.2forwin\lib\postgresql-9.0-801.jdbc3.jar"
  File "openjump-1.4.0.2forwin\lib\xercesImpl.jar"
  File "openjump-1.4.0.2forwin\lib\xml-apis-ext.jar"
  File "openjump-1.4.0.2forwin\lib\xml-apis.jar"
  SetOutPath "$INSTDIR\licenses"
  File "openjump-1.4.0.2forwin\licenses\apache_license.txt"
  File "openjump-1.4.0.2forwin\licenses\gpl2_license.txt"
  File "openjump-1.4.0.2forwin\licenses\jmath_license.txt"
  File "openjump-1.4.0.2forwin\licenses\jython_license.txt"
  SetOutPath "$INSTDIR"
  File "openjump-1.4.0.2forwin\readme.txt"
  File "openjump-1.4.0.2forwin\workbench-state.xml"
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\OpenJUMP\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\OpenJUMP\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\bin\OpenJUMP.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\bin\OpenJUMP.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

;Function DetectJRE
;  ReadRegStr $2 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment" \
;             "CurrentVersion"
;  StrCmp $2 ${JRE_VERSION} done
;  Call GetJRE
;  done:
;FunctionEnd

;Function GetJRE
;        MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION "${PRODUCT_NAME} uses Java ${JRE_VERSION}, it will now \
;                         be downloaded and installed (click Cancel to continue without downloading)"  IDCANCEL NoDownloadJava
;
;        StrCpy $2 "$TEMP\JavaRuntimeEnvironment.exe"
;        NSISdl::download /TIMEOUT=30000 ${JRE_URL} $2
;        Pop $R0 ;Get the return value
;                StrCmp $R0 "success" +3
;                MessageBox MB_OK "Download failed: $R0"
;                ;Quit ;we dont want to quit
;        ExecWait $2
;        Delete $2
;        NoDownloadJava:
;FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\workbench-state.xml"
  Delete "$INSTDIR\readme.txt"
  Delete "$INSTDIR\licenses\jython_license.txt"
  Delete "$INSTDIR\licenses\jmath_license.txt"
  Delete "$INSTDIR\licenses\gpl2_license.txt"
  Delete "$INSTDIR\licenses\apache_license.txt"
  Delete "$INSTDIR\lib\xml-apis.jar"
  Delete "$INSTDIR\lib\xml-apis-ext.jar"
  Delete "$INSTDIR\lib\xercesImpl.jar"
  Delete "$INSTDIR\lib\postgresql-9.0-801.jdbc3.jar"
  Delete "$INSTDIR\lib\postgis_1_0_0.jar"
  Delete "$INSTDIR\lib\openjump-workbench-1.4.0.2.jar"
  Delete "$INSTDIR\lib\openjump-api-1.4.0.2.jar"
  Delete "$INSTDIR\lib\log4j-1.2.16.jar"
  Delete "$INSTDIR\lib\jython.jar"
  Delete "$INSTDIR\lib\jts-1.11.jar"
  Delete "$INSTDIR\lib\jmathplot-20070905.jar"
  Delete "$INSTDIR\lib\jmatharray-20070905.jar"
  Delete "$INSTDIR\lib\jdom.jar"
  Delete "$INSTDIR\lib\Jama-1.0.1.jar"
  Delete "$INSTDIR\lib\jai_core.jar"
  Delete "$INSTDIR\lib\jai_codec.jar"
  Delete "$INSTDIR\lib\ext\readme.txt"
  Delete "$INSTDIR\lib\ext\NCSUtil.dll"
  Delete "$INSTDIR\lib\ext\NCSEcw.dll"
  Delete "$INSTDIR\lib\ext\NCScnet.dll"
  Delete "$INSTDIR\lib\ext\jython\UnionSelected.py"
  Delete "$INSTDIR\lib\ext\jython\startup.py"
  Delete "$INSTDIR\lib\ext\jython\SetASHSLabel.py"
  Delete "$INSTDIR\lib\ext\jython\RotatedRectangleTool.py"
  Delete "$INSTDIR\lib\ext\jython\RoadTool.py"
  Delete "$INSTDIR\lib\ext\jython\RightAngleTool.py"
  Delete "$INSTDIR\lib\ext\jython\OvalTool.py"
  Delete "$INSTDIR\lib\ext\jython\images\DrawRotRect.gif"
  Delete "$INSTDIR\lib\ext\jython\images\DrawRoad.gif"
  Delete "$INSTDIR\lib\ext\jython\images\DrawPoint.gif"
  Delete "$INSTDIR\lib\ext\jython\images\DrawOval.gif"
  Delete "$INSTDIR\lib\ext\jython\images\DrawCorner.gif"
  Delete "$INSTDIR\lib\ext\jython\images\DrawCircle.gif"
  Delete "$INSTDIR\lib\ext\jython\images\DrawArc.gif"
  Delete "$INSTDIR\lib\ext\jython\DistributeSelected.py"
  Delete "$INSTDIR\lib\ext\jython\CircleTool.py"
  Delete "$INSTDIR\lib\ext\jython\ArcTool.py"
  Delete "$INSTDIR\lib\ext\jython\AlignSelected.py"
  Delete "$INSTDIR\lib\ext\BeanTools\SaveViewAsBeanTool.bsh"
  Delete "$INSTDIR\lib\ext\BeanTools\RefreshScriptsMenu.bsh"
  Delete "$INSTDIR\lib\ext\BeanTools\8-GetInvalidShapefileRings.bsh"
  Delete "$INSTDIR\lib\ext\BeanTools\7-AddXYAsAttributes.bsh"
  Delete "$INSTDIR\lib\ext\BeanTools\6-PushPinPoints.bsh"
  Delete "$INSTDIR\lib\ext\BeanTools\5-ChangeAttributeValue.bsh"
  Delete "$INSTDIR\lib\ext\BeanTools\4-AddAttribute.bsh"
  Delete "$INSTDIR\lib\ext\BeanTools\3-Populate.bsh"
  Delete "$INSTDIR\lib\ext\BeanTools\2-NewLayer.bsh"
  Delete "$INSTDIR\lib\ext\BeanTools\1-HelloWorld.bsh"
  Delete "$INSTDIR\lib\ext\BeanTools\0-Help.bsh"
  Delete "$INSTDIR\lib\ermapper.jar"
  Delete "$INSTDIR\lib\Buoy.jar"
  Delete "$INSTDIR\lib\bsh-2.0b4.jar"
  Delete "$INSTDIR\lib\batik-all.jar"
  Delete "$INSTDIR\lib\.project"
  Delete "$INSTDIR\Changes.txt"
  Delete "$INSTDIR\bin\workbench-properties.xml"
  Delete "$INSTDIR\bin\openjump_icon3.ico"
  Delete "$INSTDIR\bin\OpenJUMP.ini"
  Delete "$INSTDIR\bin\OpenJUMP.exe"
  Delete "$INSTDIR\bin\OpenJUMP.app\Contents\Resources\oj.icns"
  Delete "$INSTDIR\bin\OpenJUMP.app\Contents\MacOS\oj.sh"
  Delete "$INSTDIR\bin\OpenJUMP.app\Contents\Info.plist"
  Delete "$INSTDIR\bin\oj_windows.bat"
  Delete "$INSTDIR\bin\oj_macosx.command"
  Delete "$INSTDIR\bin\oj_linux.sh"
  Delete "$INSTDIR\bin\log4j.xml"
  Delete "$INSTDIR\bin\default-plugins.xml"
;  Delete "$INSTDIR\Example.file"
;  Delete "$INSTDIR\AppMainExe.exe"

  Delete "$SMPROGRAMS\OpenJUMP\Uninstall.lnk"
  Delete "$SMPROGRAMS\OpenJUMP\Website.lnk"
  Delete "$DESKTOP\OpenJUMP.lnk"
  Delete "$SMPROGRAMS\OpenJUMP\OpenJUMP.lnk"

  RMDir "$SMPROGRAMS\OpenJUMP"
  RMDir "$INSTDIR\licenses"
  RMDir "$INSTDIR\lib\ext\jython\images"
  RMDir "$INSTDIR\lib\ext\jython"
  RMDir "$INSTDIR\lib\ext\BeanTools"
  RMDir "$INSTDIR\lib\ext"
  RMDir "$INSTDIR\lib"
  RMDir "$INSTDIR\bin\OpenJUMP.app\Contents\Resources"
  RMDir "$INSTDIR\bin\OpenJUMP.app\Contents\MacOS"
  RMDir "$INSTDIR\bin\OpenJUMP.app\Contents"
  RMDir "$INSTDIR\bin\OpenJUMP.app"
  RMDir "$INSTDIR\bin"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd