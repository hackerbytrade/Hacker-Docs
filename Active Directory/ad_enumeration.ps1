<#
Query the network for the name of the Primary domain controller emulator and the domain, 
search Active Directory and filter the output to display user accounts, 
and then clean up the output for readability.
#>

<#discover the hostname of the domain controller and the components of the DistinguishedName 
$domainObj will store the entire domain object, 
$PDC will store the Name of the PDC 
$SearchString will build the provider path for output. 

powershell -ExecutionPolicy Bypass -File script.ps1
#>
$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()

$PDC = ($domainObj.PdcRoleOwner).Name

$SearchString = "LDAP://"

$SearchString += $PDC + "/"

#DistinguishedName is the full LDAP provider path needed to perform LDAP queries against the domain controller
$DistinguishedName = "DC=$($domainObj.Name.Replace('.', ',DC='))"

$SearchString += $DistinguishedName

$SearchString

<#
We can now instantiate the DirectorySearcher class with the LDAP provider path. 
To use the DirectorySearcher class, we have to specify a SearchRoot, 
which is the node in the Active Directory hierarchy where searches start.

The search root takes the form of an object instantiated from the DirectoryEntry class. 
When no arguments are passed to the constructor, 
the SearchRoot will indicate that every search should return results from the entire Active Directory. 
#>
$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)

$objDomain = New-Object System.DirectoryServices.DirectoryEntry($SearchString, "corp.com\offsec", "lab")

$Searcher.SearchRoot = $objDomain

<#
One way to set up a filter is through the samAccountType attribute,
which is an attribute that all user, computer, and group objects have.
samAccountType=805306368 is just an example...

samAccountType filter through the .filter property of our $Searcher object 
and then invoked the FindAll method15 to conduct a search and find all results given the configured filter
#>
$Searcher.filter="samAccountType=805306368"

$Searcher.FindAll()

Foreach($obj in $Result)
{
    Foreach($prop in $obj.Properties)
    {
        $prop
    }
    
    Write-Host "------------------------"
}

