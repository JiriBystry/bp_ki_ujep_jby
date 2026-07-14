@echo off

# parameter pro nasazeni verzi agenta nebo update
set agent=%1
set ip=%2
set zarazeni=%3

# SERVICES
NET STOP WazuhSvc
NET START RpcLocator
NET START RpcEptMapper
NET START RpcSs
NET START DcomLaunch

if exist C:\Temp (
  echo Yes
  cd C:\temp 
) else (
  mkdir C:\Temp
  cd C:\temp
)

powershell -ep bypass -command "Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/%agent% -OutFile %agent%; ./%agent% /q WAZUH_MANAGER=%ip% WAZUH_AGENT_GROUP='WINDOWS-%zarazeni%'"

timeout 30

# SERVICES
NET STOP WazuhSvc
NET START WazuhSvc

del "C:\temp\%agent%"