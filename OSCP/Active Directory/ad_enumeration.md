**Enumeration**
`net user` | Enumerate all local accounts
`net user /domain`| Adding the /domain flag will enumerate all users in the entire domain
`net user jeff_admin /domain` | query user
`net group /domain`| enumerate all groups in the domain


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