# https://github.com/SharePoint/PnP-PowerShell/wiki/How-to-use-the-Windows-Credential-Manager-to-ease-authentication-with-PnP-PowerShell

Connect-PnPOnline -Url https://scdevtenant.sharepoint.com -Credentials FirstTest

$title = (Get-PnPWeb).title

Write-Host $title