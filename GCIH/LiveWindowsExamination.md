# Network Examination

`netstat -na` | -n : no name resoltion | -a : all tcp/udp

`netstat -nao` | -o:  process ic

`netstat -naob` | -b: program name (requires admin)


# Process Examination

`wmic process list brief` | running processes

`wmic process list full` | running processes more info

`wmic process where name="nssm.exe" list full` | specify process processes
 
`wmic process where processid=600 list full` | specify process id

`wmic process where processid=600 get name,commandline,processid,parentprocessid` | select attributes of process

`wmic process where name="nssm.exe" get name,commandline,processid,parentprocessid` 
&&
`wmic process where parentprocessid=2068 get name,commandline,processid,parentprocessid` | select process of parent process


`wmic process where name="nssm.exe" get name,commandline,processid,parentprocessid`  
&&
`wmic process where parentprocessid=2068 get name,commandline,processid,parentprocessid` | select child process of parent process

# Services Examination

`services.msc` | GUI

`sc query | more`

`tasklist /svc`

# Registry

### Check For Programs that are automatically invoked by machine on bootup or when user logs in ###

HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run

HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce

HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnceEx

`req query HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run`

`reg query HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce`

`req query HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnceEx`

OR 

`wmic startup`

# Unscheduled Tasks

`taskschd.msc` | Task Scheduler GUI

Select `Create Basic Task` | Autowizard to run a task at a given time

### View this or other scheduled tasks with schtasks ###

`schtasks | more ` | View scheduled tasks

`schtasks /delete /tn Test` | Delete scheduled task named "Test"

# Unusual Accounts

`lusrmgr.msc` | Local Users and Groups GUI

