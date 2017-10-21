# https://docs.microsoft.com/en-us/azure/active-directory/msi-tutorial-windows-vm-access-nonaad

$response = Invoke-WebRequest -Uri http://localhost:50342/oauth2/token -Method GET -Body @{resource="https://vault.azure.net"} -Headers @{Metadata="true"}
$content = $response.Content | ConvertFrom-Json
$KeyVaultToken = $content.access_token
$KeyVaultSecret = (Invoke-WebRequest -Uri https://aad-dev-vault.vault.azure.net/secrets/LiveDemo?api-version=2016-10-01 -Method GET -Headers @{Authorization="Bearer $KeyVaultToken"}).content | ConvertFrom-Json
$secret = $KeyVaultSecret.value

Write-Host $secret