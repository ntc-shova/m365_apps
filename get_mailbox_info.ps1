$acctName=Read-Host "<UPN of the account, such as belindan@litwareinc.onmicrosoft.com>" -AsSecureString

#Azure Active Directory
Connect-AzureAD
#Exchange Online
Connect-ExchangeOnline

# Get the list of users with mailboxes
$MailboxUsers = Get-ExoMailbox | Select-Object @{Name="First Name"; Expression={(Get-AzureADUser -Object $_.ExternalDirectoryObjectId).GivenName}}, @{Name="Last Name"; Expression={(Get-AzureADUser -Object $_.ExternalDirectoryObjectId).Surname}}, DisplayName, HiddenFromAddressListsEnabled, PrimarySmtpAddress, @{Name="License"; Expression={(Get-AzureADUser -Object $_.ExternalDirectoryObjectId).Licenses[0].AccountSkuId}} | Format-Table

# Display the list of users
$MailboxUsers | Format-Table

