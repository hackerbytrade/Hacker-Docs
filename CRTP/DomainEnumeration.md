Dmoain Enumeration

Enumeration can be done using Native executables and .NET class

`$ADClass = [System.DirectoryServices.ActiveDirectory.Domain]`
`$ADClass::GetCurrentDomain()`


PowerView: (Retired) https://github.com/PowerShellMafia/PowerSploit
Alternative..is SharpView
https://github.com/tevora-threat/SharpView/

Use AD PowerShell Module by Installing RSAT:
https://docs.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps
https://docs.microsoft.com/en-US/troubleshoot/windows-server/system-management-components/remote-server-administration-tools

Alternative...is to use Import-Module:
https://github.com/samratashok/ADModule

Get Current Domain:
`Get-NetDomain` | SharpView/PowerView
`Get-ADDomain` | AD Module

Get Object of Another Domain:
`Get-NetDomain -Domain moneycorp.local` | SharpView/PowerView
`Get-ADDomain -Identity moneycorp.local ` | AD Module

Get Domain SID for the Current Domain:
`Get-DomainSID` | SharpView/PowerView
`(Get-ADDomain).DomainSID` | AD Module

Get Domain Controllers For The Current Domain:
`Get-NetDomainController` | SharpView/PowerView
`Get-ADDomainController` | AD Module

Get Domain Controller For Another Domain: 
`Get-NetDomainController -Domain moneycorp.local` | SharpView/PowerView
`Get-ADDomainController -DomainName moneycorp.local -Discover` | AD Module

Get A List Of Users In The Current Domain:
`Get-NetUser` | SharpView/PowerView
`Get-NetUser -Username student1` | SharpView/PowerView
`Get-NetUser -Filter * -Properties *` | SharpView/PowerView
`Get-NetUser -Identity student1 -Properties *` | SharpView/PowerView

Get List Of All Properties For Users In The Current Domain
`Get-UserProperty` | PowerView ONLY!!!
`Get-UserProperty -Properties pwdlastset` | PowerView ONLY!!!
`Get-ADUser -Filter * -Properties * | select -First 1 | Get-Member -MemberType *Property | select Name ` | AD Module
`Get-ADUser -Filter * -Properties * | select name,@{expression={[datetime]::fromFileTime($_.pwdlastset)}}` | AD Module

Search For A Particular String In A User's Attributes
`Find-UserField -SearchField Description -SearchTerm "built"` | PowerView ONLY!!! 
`Get-ADUser -Filter 'Description -like "*built*"' -Properties Description | select name,Description` | AD Module

Get List Of Computer In Current Domain:
`Get-NetComputer` | SharpView/PowerView
`Get-NetComputer -OperatingSystem "*Server 2016*"` | SharpView/PowerView
`Get-NetComputer -Ping` | SharpView/PowerView
`Get-NetComputer -FullData` | SharpView/PowerView
`Get-AD Computer -Filter * | select Name` | AD Module
`Get-AD Computer -Filter 'OperatingSystem -like "*Server 2016*"' -Properties OperatingSystem | select Name,OperatingSystem` | AD Module
`Get-AD Computer -Filter * -Properties DNSHostName | %{Test-Connection -Count 1 -ComputerName $_.DNSHostName}` | AD Module
`Get-AD Computer -Filter * -Properties *` | AD Module

Get List Of Groups In Current Domain:
`Get-NetGroup` | SharpView/PowerView
`Get-NetGroup -Domain <targetdomain>` | SharpView/PowerView
`Get-NetGroup -FullData` | SharpView/PowerView
`Get-ADGroup -Filter * | select Name` | AD Module
`Get-ADGroup -Filter 'Name -like "*admin*"' select Name` | AD Module

Get All Groups Containing Word "admin" In Group Name:
`Get-NetGroup *admin*` | SharpView/PowerView
`Get-ADGroup -Filter 'Name -like "*admin"' | select Name` | AD Module

Get All Members Of Domain Admins Group:
`Get-NetGroupMember -GroupName "Domain Admins" -Recurse` | SharpView/PowerView
`Get-ADGroupMember -Identity "Domain Admins" -Recursive` | AD Module

Get Group Membership For User:
`Get-NetGroup -UserName "student1"` | SharpView/PowerView
`Get-ADPrincipalGroupMembership -Identity student1` | AD Module

List ALL Local Groups On Machine (Need Administartor Priveleges on Non-DC Servers):
`Get-NetLocalGroup -ComputerName dcorp-dc.dollarcorp.moneycorp.local -ListGroups` | SharpView/PowerView

Get Members All Local Groups On Machine (Need Administartor Priveleges on Non-DC Servers):
`Get-NetLocalGroup -ComputerName dcorp-dc.dollarcorp.moneycorp.local -Recurse` | SharpView/PowerView

Get Actively Logged In Users On Computer (Need Local Admin Rights On Target):
`Get-NetLoggedon -ComputerName <servername>` | SharpView/PowerView

Get Locally Logged Users On Computer (Need Remote Registry On The Target.  Started by default on Server OS)
`Get-NetLoggedonLocal -ComputerName dcorp-dc.dollarcorp.moneycorp.local` | SharpView/PowerView

Get Last Logged User On A Computer (Need admin rights and regsitry on the target):
`Get-LastLoggedon -ComputerName <servername>`

Find Shares On Host In Current Domain:
`Invoke-ShareFinder -Verbose` | PowerView

Find Sensitive Files On Host In Current Domain:
`Invoke-FileFinder -Verbose` | PowerView

Get All File Server Of Domain:
`Get-NetFileServer` | SharpView/PowerView

====================================================
=======================GPOs=========================
====================================================

Get List Of GPO Current Domain:
`Get-NetGPO` | SharpView/PowerView
`Get-NetGPO -ComputerName dcorp-student1.dollarcorp.moneycorp.local` | SharpView/PowerView
`Get-GPO -All` | GPO Module
`Get-GPResultantSetOfPolicy -ReportType Html -Path C:\Users\Administrator\report.html` | Provides RSoP Resultant Set of Policy | GPO Module

Get GPO(s) Which Use Restricted Groups or groups.xml for interesting users
`Get-NetGPOGroup` | SharpView/PowerView

Get Users In Local Group Of A Machine Using GPO:
`Find-GPOComputerAdmin -Computername dcorp-student1.dollarcorp.moneycorp.local` | SharpView/PowerView
`Find-GPOLocation -UserName student1 -Verbose` | SharpView/PowerView

Get OUs In A Domain:
`Get-NetOU -FullData` | SharpView/PowerView
`Get-ADOrganizationalUnit -Filter * -Properties *` | AD Module

Get GPO Applied On An OU. Read GPOname from gplink attribute from Get-NetOU
`Get-NetGPO -GPOname "{AB306569-220D-43FF-B03B-83E8F4EF8081}"` | SharpView/PowerView
`Get-GPO -GUID AB306569-220D-43FF-B03B-83E8F4EF8081` | GPO Module

Get ACLs Associated With Specific Object:
`Get-ObjectAcl -SamAccountName student1 -ResolveGUIDs` | SharpView/PowerView
`Get-ObjectAcl -ADSprefix 'CN=Administartor,CN=Users'  -Verbose` | SharpView/PowerView
`(Get-ACL 'AD:\CN=Administrator,CN=Users,DC=dollarcorp,DC=money,DC=local').Access` | Doesn't Resolve GUIDs | AD Module

Get ACLs Associated With Specified LDAP Path To Be Used For Search:
`Get-ObjectAcl -ADSpath "LDAP://CN=Domain Admins,CN=Users,DC=dollarcorp,DC=money,DC=local" -ResolveGUIDs -Verbose` | SharpView/PowerView

Search For Interesting ACEs
`Invoke-ACLScanner -ResolveGUIDs` | SharpView/PowerView

Get ACLs Associated With Specified Path:
`Get-PathAcl -Path "\\dcorp-dc.dollarcorp.moneycorp.local\sysvol"` | SharpView/PowerView

====================================================
=================Domain Trust=======================
====================================================

Get List Of All Domain Trusts For Current Domain
`Get-NetDomainTrust` | SharpView/PowerView
`Get-NetDomainTrust -Domain us.dollarcorp.moneycorp.local` | SharpView/PowerView
`Get-ADTrust` | AD Module
`Get-ADTrust -Identity us.dollarcorp.moneycorp.local` | AD Module

**Forest Mapping**
Get All Global Catalogs For Current Forest:
`Get-NetForestCatalog` | SharpView/PowerView
`Get-NetForestCatalog -Forest eurocorp.local` | SharpView/PowerView
`Get-ADForest | select -ExpandProperty GlobalCatalogs` | AD Module

Map Trust Of A Forest:
`Get-NetForestTrust` | SharpView/PowerView
`Get-NetForestTrust -Forest eurocorp.local` | SharpView/PowerView
`Get-ADTrust -Filter 'msDS-TrustForestTrustInfo -ne "$null"'` | AD Module

Find All Machine In Current Domain Where Current User Has Local Admin Access:
`Find-LocalAdminAccess -Verbose` | SharpView/PowerView

Function Queries The DC of Current Or Provided Domain For List Of Computers:
`Get-NetComputer` Then use multi-threaded `Invoke-CheckLocalAdminAccess` on each machine

Find Computers Where Domain Admin (or specified user/group) has sessions:
`Invoke-UserHunter` | SharpView/PowerView
`Invoke-UserHunter -GroupName "RDPUsers"` | SharpView/PowerView
Query DC Of Current Or Provided Domain For Members Of The Given Group (Domain Admins by default) using `Get-NetGroupMember`, gets a list of computers (`Get-NetComputer`) and lists session and logged on users (`Get-NetSession/Get-NetLoggedon`) from each machine

Confirm Admin Access:
`Invoke-UserHunter -CheckAccess` | SharpView/PowerView 

Find Computers Where Domain Admin Is Logged In:
`Invoke-UserHunter -Stealth`
Query Gets DC of Current Or Provided Domain for members of given group (Domain Admins by default) using `Get-NetGroupMember`, gets a list_only_of high traffice servers (DC, File Servers and Distributed File Server) for less traffic generation and list sessions and logged on users (`Get-NetSession/Get-NetLoggedon`) from each machine.

NetCease.ps1 (`Install-Module -Name NetCease`)
Script that changes permissions on the NetSessionEnum method by removing permission for Authenticated Users Group
This fails many of the attacker's session enumeration and hence user hunting capabilities