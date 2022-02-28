Dmoain Enumeration

Enumeration can be done using Native executables and .NET class

`$ADClass = [System.DirectoryServices.ActiveDirectory.Domain]`
`$ADClass::GetCurrentDomain()`


PowerView: (Retired) https://github.com/PowerShellMafia/PowerSploit
Alternative..is SharpView
https://github.com/tevora-threat/SharpView


Consier using Empire:
https://github.com/EmpireProject/Empire


Use AD PowerShell Module by Installing RSAT:
https://docs.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps
https://docs.microsoft.com/en-US/troubleshoot/windows-server/system-management-components/remote-server-administration-tools

Alternative...is to use Import-Module Provided by instructor:
https://github.com/samratashok/ADModule


Get Current Domain:
`Get-NetDomain` | SharpView
`Get-ADDomain` | AD Module

Get Object of Another Domain:
`Get-NetDomain -Domain moneycorp.local` | SharpView
`Get-ADDomain -Identity moneycorp.local ` | AD Module

Get Domain SID for the Current Domain:
`Get-DomainSID` | SharpView
`(Get-ADDomain).DomainSID` | AD Module

Get Domain Controllers For The Current Domain:
`Get-NetDomainController` | SharpView
`Get-ADDomainController` | AD Module

Get Domain Controller For Another Domain: 
`Get-NetDomainController -Domain moneycorp.local` | SharpView
`Get-ADDomainController -DomainName moneycorp.local -Discover` | AD Module

Get A List Of Users In The Current Domain:
`Get-NetUser` | SharpView
`Get-NetUser -Username student1` | SharpView
`Get-NetUser -Filter * -Properties *` | SharpView
`Get-NetUser -Identity student1 -Properties *` | SharpView

Get List Of All Properties For Users In The Current Domain
`Get-UserProperty` | PowerView ONLY!!!
`Get-UserProperty -Properties pwdlastset` | PowerView ONLY!!!
`Get-ADUser -Filter * -Properties * | select -First 1 | Get-Member -MemberType *Property | select Name ` | AD Module
`Get-ADUser -Filter * -Properties * | select name,@{expression={[datetime]::fromFileTime($_.pwdlastset)}}` | AD Module

Search For A Particular String In A User's Attributes
`Find-UserField -SearchField Description -SearchTerm "built"` | PowerView ONLY!!! 
`Get-ADUser -Filter 'Description -like "*built*"' -Properties Description | select name,Description` | AD Module