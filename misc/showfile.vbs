'Show Hidden Files
Option Explicit
Dim dblHiddenData, strHiddenKey, strHiddenSystem, strHiddenFileExt
Dim strHide, strRefresh, WshShell
On Error Resume Next

strHide = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
strHiddenKey = strHide & "\Hidden"
strHiddenSystem = strHide & "\ShowSuperHidden"
strHiddenFileExt = strHide & "\HideFileExt"

Set WshShell = WScript.CreateObject("WScript.Shell")
dblHiddenData = WshShell.RegRead(strHiddenKey)

     If dblHiddenData = 2 Then
       WshShell.RegWrite strHiddenKey, 1, "REG_DWORD"
	 WshShell.RegWrite strHiddenSystem, 1, "REG_DWORD"
	   WshShell.RegWrite strHiddenFileExt, 0, "REG_DWORD"
                      
             Set WSHShell = WScript.CreateObject("WScript.Shell") 
           strRefresh = WSHShell.SpecialFolders("Desktop") 
         WSHShell.AppActivate strDesktop 
       WSHShell.SendKeys "{F5}"
     End If

'RIGHT-CLICK EXTENDER V2
'Created by: Lee Whittington (UntameDKreationZ) for The Windows Club
