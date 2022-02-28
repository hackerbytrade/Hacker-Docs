**Enumeration**
`net user` | Enumerate all local accounts
`net user /domain`| Adding the /domain flag will enumerate all users in the entire domain
`net user jeff_admin /domain` | query user
`net group /domain`| enumerate all groups in the domain

`Get-ADGroup -Identity "Schema Admins" -Properties *` | Members of "Schema Admins"
`whoami /priv` | User Rights Non-Elevated/Elevated

Once we have a foothold in an AD environment, we should start by gathering several key pieces of information, including but not limited to:

The domain functional level
The domain password policy
A full inventory of AD users
A full inventory of AD computers
A full inventory of AD groups and memberships
Domain trust relationships
Object ACLs
Group Policy Objects (GPO) information
Remote access rights

AD contains many groups that grant their members powerful rights and privileges. Many of these can be abused to escalate privileges within a domain and ultimately gain Domain Admin or SYSTEM privileges on a Domain Controller (DC). Some of these groups are listed below.
`Default Administrators` |	Domain Admins and Enterprise Admins "super" groups.
`Server Operators` | Members can modify services, access SMB shares, and backup files.
`Backup Operators` | Members are allowed to log onto DCs locally and should be considered Domain Admins. They can make shadow copies of the SAM/NTDS database, read the registry remotely, and access the file system on the DC via SMB. This group is sometimes added to the local Backup Operators group on non-DCs.
`Print Operators` |	Members are allowed to logon to DCs locally and "trick" Windows into loading a malicious driver.
`Hyper-V Administrators` |	If there are virtual DCs, any virtualization admins, such as members of Hyper-V Administrators, should be considered Domain Admins.
`Account Operators` | Members can modify non-protected accounts and groups in the domain.
`Remote Desktop Users`| Members are not given any useful permissions by default but are often granted additional rights such as Allow Login Through Remote Desktop Services and can move laterally using the RDP protocol.
`Remote Management Users` |	Members are allowed to logon to DCs with PSRemoting (This group is sometimes added to the local remote management group on non-DCs).
`Group Policy Creator Owners` |	Members can create new GPOs but would need to be delegated additional permissions to link GPOs to a container such as a domain or OU.
`Schema Admins`	| Members can modify the Active Directory schema structure and can backdoor any to-be-created Group/GPO by adding a compromised account to the default object ACL.
`DNS Admins` | Members have the ability to load a DLL on a DC but do not have the necessary permissions to restart the DNS server. They can load a malicious DLL and wait for a reboot as a persistence mechanism. Loading a DLL will often result in the service crashing. A more reliable way to exploit this group is to create a WPAD record.