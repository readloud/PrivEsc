'Open Desktop Wallpaper File Location

Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
strCurWP =""

On Error Resume Next
strCurWP = WshShell.RegRead("HKCU\Software\Microsoft\Internet Explorer\Desktop\General\WallpaperSource")
On Error Goto 0

If Trim(strCurWP) = "" Then
	MsgBox "No Wallpaper selected for Desktop Slideshow"
Else
	If fso.FileExists(strCurWP) Then
		WshShell.run "explorer.exe" & " /select," & strCurWP
	Else
		MsgBox "Cannot find target for " & strCurWP
	End If
End If

'RIGHT-CLICK EXTENDER V2
'Created by: Lee Whittington (UntameDKreationZ) for The Windows Club
