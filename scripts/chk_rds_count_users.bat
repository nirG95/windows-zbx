@echo off
powershell -Command "Set-ExecutionPolicy Unrestricted -Force;$total=0;$servers = Get-WmiObject -Class Win32_SessionDirectoryServer;foreach ($server in $servers) { $total += $server.NumberOfSessions };write-host $total"
