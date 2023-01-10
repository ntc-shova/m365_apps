﻿Connect-ExchangeOnline
$UserName = Read-Host -Prompt "Enter the email address of the mailbox you want to check".Trim()
clear

While ($true)
{
$MailBox=Get-EXOMailboxStatistics -Identity $UserName
$Archive=Get-EXOMailboxStatistics -Identity $UserName -Archive

Write-Progress -Id 3 -Activity "Mailbox Size" -Status $MailBox.TotalItemSize -PercentComplete -1
Write-Progress -Id 1 -Activity "Mailbox Count" -Status $MailBox.ItemCount -PercentComplete -1 

Write-Progress -Id 4 -Activity "Archive Size" -Status $Archive.TotalItemSize -PercentComplete -1
Write-Progress -Id 2 -Activity "Archive Count" -Status $Archive.ItemCount -PercentComplete -1


# Write-Progress(Get-EXOMailboxStatistics -Identity $UserName -Archive | Select TotalItemSize, ItemCount)
Start-Sleep -Milliseconds 5000
}