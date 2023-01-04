#Azure Active Directory
Connect-AzureAD
#Exchange Online
Connect-ExchangeOnline

$MailboxUsers = @()
$Mailboxes = Get-ExoMailbox -PropertySets 'Minimum','AddressList'
# Get the list of users with mailboxes

ForEach ( $mailbox in $Mailboxes ) {
	$user = Get-AzureADUser -Object $mailbox.ExternalDirectoryObjectId
	
	$MailboxUsers += @{
		'First Name'   = $user.GivenName;
		'Last Name'    = $user.Surname;
		'Display Name' = $mailbox.DisplayName;
		'Hidden'       = $mailbox.HiddenFromAddressListsEnabled;
		'Email'        = $mailbox.PrimarySmtpAddress;
		'License'      = $user.AssignedLicenses[0].SkuId
	}
}

# Display the list of users
$MailboxUsers | % { new-object PSObject -Property $_} | Format-Table