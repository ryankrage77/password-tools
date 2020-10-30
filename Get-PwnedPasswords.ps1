Write-Host "DISCLAIMER: This script sends the first 5 characters of a SHA1 hash of the password you type below to the haveibeenpwned API."
Write-Host "The actual password you enter never leaves this computer."
Write-Host "It can still be intercepted by keyloggers, malware, or someone looking over your shoulder."

$Password  = Read-Host -Prompt "Password" -AsSecureString
$UPassword = $([PSCredential]::New("username", $Password)).GetNetworkCredential().Password

$UPasswordStringBuilder = New-Object System.Text.StringBuilder 
[System.Security.Cryptography.HashAlgorithm]::Create("SHA1").ComputeHash([System.Text.Encoding]::UTF8.GetBytes($UPassword)) | ForEach-Object { [void]$UPasswordStringBuilder.Append($_.ToString("x2")) }
$Hash = $UPasswordStringBuilder.ToString()
$Prefix = $Hash.SubString(0, 5)
$Suffix = $Hash.SubString($Hash.Length - 35)

$Request = Invoke-RestMethod -URI "https://api.pwnedpasswords.com/range/$Prefix"
$Data = $Request -split [Environment]::NewLine | ForEach-Object { $_ | ConvertFrom-String -Delimiter ":" -PropertyNames Hash,Count }
$Output = $Data | Where-Object Hash -eq $Suffix
if (-NOT $Output) {
  return "Your password ($UPassword`:$Hash) has not been found."
}
return "Your password ($UPassword`:$Hash) has been found $($Output.Count.ToString('N0')) times."
