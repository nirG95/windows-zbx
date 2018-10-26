Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
Set PathOrg = objWMIService.Get("Win32_Service.Name='Zabbix Agent'")

PathAbs = Split(PathOrg.PathName, """")
Path = Split(PathAbs(1), "\")

For i = lbound(Path) to ubound(Path)-3 
  ZabbixFolder = ZabbixFolder & Path(i) & "\"
next

FileVersion = ZabbixFolder & "version"

Set fso = CreateObject("Scripting.FileSystemObject")
If (fso.FileExists(FileVersion)) Then
   Set xmlhttp = createobject("msxml2.xmlhttp.3.0")
   xmlhttp.open "GET", FileVersion, false
   xmlhttp.send
   Version = xmlhttp.responseText
Else
   Version = "N/A"
End If

Wscript.Echo Version
