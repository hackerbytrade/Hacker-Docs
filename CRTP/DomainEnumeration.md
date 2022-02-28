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

Get List Of Computer In Current Domain:
`Get-NetComputer` | SharpView
`Get-NetComputer -OperatingSystem "*Server 2016*"` | SharpView
`Get-NetComputer -Ping` | SharpView
`Get-NetComputer -FullData` | SharpView
`Get-AD Computer -Filter * | select Name` | AD Module
`Get-AD Computer -Filter 'OperatingSystem -like "*Server 2016*"' -Properties OperatingSystem | select Name,OperatingSystem` | AD Module
`Get-AD Computer -Filter * -Properties DNSHostName | %{Test-Connection -Count 1 -ComputerName $_.DNSHostName}` | AD Module
`Get-AD Computer -Filter * -Properties *` | AD Module

Get List Of Groups In Current Domain:
`Get-NetGroup` | SharpView
`Get-NetGroup -Domain <targetdomain>` | SharpView
`Get-NetGroup -FullData` | SharpView
`Get-ADGroup -Filter * | select Name` | AD Module
`Get-ADGroup -Filter 'Name -like "*admin*"' select Name` | AD Module

Get All Groups Containing Word "admin" In Group Name:
`Get-NetGroup *admin*` | SharpView
`Get-ADGroup -Filter 'Name -like "*admin"' | select Name` | AD Module

Get All Members Of Domain Admins Group:
`Get-NetGroupMember -GroupName "Domain Admins" -Recurse` | SharpView
`Get-ADGroupMember -Identity "Domain Admins" -Recursive` | AD Module

Get Group Membership For User:
`Get-NetGroup -UserName "student1"` | SharpView
`Get-ADPrincipalGroupMembership -Identity student1` | AD Module

List ALL Local Groups On Machine (Need Administartor Priveleges on Non-DC Servers):
`Get-NetLocalGroup -ComputerName dcorp-dc.dollarcorp.moneycorp.local -ListGroups` | SharpView

Get Members All Local Groups On Machine (Need Administartor Priveleges on Non-DC Servers):
`Get-NetLocalGroup -ComputerName dcorp-dc.dollarcorp.moneycorp.local -Recurse` | SharpView

Get Actively Logged In Users On Computer (Need Local Admin Rights On Target):
`Get-NetLoggedon -ComputerName <servername>` | SharpView

Get Locally Logged Users On Computer (Need Remote Registry On The Target.  Started by default on Server OS)
`Get-NetLoggedonLocal -ComputerName dcorp-dc.dollarcorp.moneycorp.local` | SharpView

Get Last Logged User On A Computer (Need admin rights and regsitry on the target):
`Get-LastLoggedon -ComputerName <servername>`

Find Shares On Host In Current Domain:
`Invoke-ShareFinder -Verbose` | PowerView

Find Sensitive Files On Host In Current Domain:
`Invoke-FileFinder -Verbose` | PowerView

Get All File Server Of Domain:
`Get-NetFileServer` | SharpView

====================================================
=======================GPOs=========================
====================================================

Get List Of GPO Current Domain:
`Get-NetGPO` | SharpView
`Get-NetGPO -ComputerName dcorp-student1.dollarcorp.moneycorp.local` | SharpView
`Get-GPO -All` | GPO Module
`Get-GPResultantSetOfPolicy -ReportType Html -Path C:\Users\Administrator\report.html` | Provides RSoP Resultant Set of Policy | GPO Module

Get GPO(s) Which Use Restricted Groups or groups.xml for interesting users
`Get-NetGPOGroup` | SharpView

Get Users In Local Group Of A Machine Using GPO:
`Find-GPOComputerAdmin -Computername dcorp-student1.dollarcorp.moneycorp.local` | SharpView
`Find-GPOLocation -UserName student1 -Verbose` | SharpView

Get OUs In A Domain:
`Get-NetOU -FullData` | SharpView
`Get-ADOrganizationalUnit -Filter * -Properties *` | AD Module

Get GPO Applied On An OU. Read GPOname from gplink attribute from Get-NetOU
`Get-NetGPO -GPOname "{AB306569-220D-43FF-B03B-83E8F4EF8081}"` | SharpView
`Get-GPO -GUID AB306569-220D-43FF-B03B-83E8F4EF8081` | GPO Module

Get ACLs Associated With Specific Object:
`Get-ObjectAcl -SamAccountName student1 -ResolveGUIDs` | SharpView
`Get-ObjectAcl -ADSprefix 'CN=Administartor,CN=Users'  -Verbose` | SharpView
`(Get-ACL 'AD:\CN=Administrator,CN=Users,DC=dollarcorp,DC=money,DC=local').Access` | Doesn't Resolve GUIDs | AD Module

Get ACLs Associated With Specified LDAP Path To Be Used For Search:
`Get-ObjectAcl -ADSpath "LDAP://CN=Domain Admins,CN=Users,DC=dollarcorp,DC=money,DC=local" -ResolveGUIDs -Verbose` | SharpView

Search For Interesting ACEs
`Invoke-ACLScanner -ResolveGUIDs` | SharpView

Get ACLs Associated With Specified Path:
`Get-PathAcl -Path "\\dcorp-dc.dollarcorp.moneycorp.local\sysvol"` | SharpView