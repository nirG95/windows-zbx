@echo off
powershell -Command "Set-ExecutionPolicy Unrestricted -Force;Add-PSSnapin Citrix*;(Get-XASession | Select-Object AccountName -Unique).count"
