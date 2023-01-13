[CmdletBinding(DefaultParameterSetName="Default")]
param(
  [Parameter(
    Mandatory = $true,
    HelpMessage = "Enter a single UserPrincipalName"
    )]
  [string[]]$UserName
)
Connect-ExchangeOnline

$User = $UserName[0]
clear

While ($true)
{
$MailBox=Get-EXOMailboxStatistics -Identity $User
$Archive=Get-EXOMailboxStatistics -Identity $User -Archive

Write-Progress -Id 3 -Activity "Mailbox Size" -Status $MailBox.TotalItemSize -PercentComplete -1
Write-Progress -Id 1 -Activity "Mailbox Count" -Status $MailBox.ItemCount -PercentComplete -1 

Write-Progress -Id 4 -Activity "Archive Size" -Status $Archive.TotalItemSize -PercentComplete -1
Write-Progress -Id 2 -Activity "Archive Count" -Status $Archive.ItemCount -PercentComplete -1


# Write-Progress(Get-EXOMailboxStatistics -Identity $User -Archive | Select TotalItemSize, ItemCount)
Start-Sleep -Milliseconds 5000
}