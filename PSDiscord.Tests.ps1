param (
    $DiscordURL = $Env:DISCORDURL
)
$PSVersionTable.PSVersion

$ModuleName = (Get-ChildItem $PSScriptRoot\*.psd1).BaseName
$ModuleVersion = (Get-Content -Raw $PSScriptRoot\*.psd1)  | Invoke-Expression | ForEach-Object ModuleVersion

$Pester = (Get-Module -ListAvailable pester)
if ($Pester -eq $null -or ($Pester[0].Version.Major -le 4 -and $Pester[0].Version.Minor -lt 4)) {
    Write-Warning "$ModuleName - Downloading Pester from PSGallery"
    Install-Module -Name Pester -Repository PSGallery -Force -SkipPublisherCheck -Scope CurrentUser
}
#if ((Get-Module -ListAvailable PSSharedGoods) -eq $null) {
#    Write-Warning "$ModuleName - Downloading PSSharedGoods from PSGallery"
#    Install-Module -Name PSSharedGoods -Repository PSGallery -Force -Scope CurrentUser
#}

$result = Invoke-Pester -Script @{ Path = "$($PSScriptRoot)\Tests"; Parameters = @{ DiscordURL = $DiscordURL }; } -EnableExit

if ($result.FailedCount -gt 0) {
    throw "$($result.FailedCount) tests failed."
}