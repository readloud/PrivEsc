'Hide Hidden Files
Option Explicit
 Dim dblHiddenData, strHidden, strHiddenSystem, strHiddenFileExt
Dim strHide, strRefresh, WshShell
 On Error Resume Next

strHide = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
 strHidden = strHide & "\Hidden"
strHiddenSystem = strHide & "\ShowHiddenSystem"
 strHiddenFileExt = strHide & "\HideFileExt"

Set WshShell = WScript.CreateObject("WScript.Shell")
 dblHiddenData = WshShell.RegRead(strHidden)

     If dblHiddenData = 1 Then
	WshShell.RegWrite strHidden, 2, "REG_DWORD"
	  WshShell.RegWrite strHiddenSystem, 0, "REG_DWORD"
	    WshShell.RegWrite strHiddenFileExt, 1, "REG_DWORD"

              Set WSHShell = WScript.CreateObject("WScript.Shell") 
            strRefresh = WSHShell.SpecialFolders("Desktop") 
          WSHShell.AppActivate strDesktop 
        WSHShell.SendKeys "{F5}"
     End If

'RIGHT-CLICK EXTENDER V2
'Created by: Lee Whittington (UntameDKreationZ) for The Windows Club

