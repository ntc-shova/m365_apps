Connect-ExchangeOnline
$UserName = Read-Host -Prompt "Enter the email address of the mailbox you want to check".Trim()

While ($true)
{
$MailBox=Get-MailboxStatistics -Identity $UserName
$Archive=Get-MailboxStatistics -Identity $UserName -Archive

Write-Progress -Id 3 -Activity "Mailbox Size" -Status $MailBox.TotalItemSize -PercentComplete -1
Write-Progress -Id 1 -Activity "Mailbox Count" -Status $MailBox.ItemCount -PercentComplete -1 

Write-Progress -Id 4 -Activity "Archive Size" -Status $Archive.TotalItemSize -PercentComplete -1
Write-Progress -Id 2 -Activity "Archive Count" -Status $Archive.ItemCount -PercentComplete -1


# Write-Progress(Get-MailboxStatistics -Identity $UserName -Archive | Select TotalItemSize, ItemCount)
Start-Sleep -Milliseconds 5000
}