function Get-DiscordConfig {
    [CmdletBinding()]
    param(
        [string] $Name = 'Primary'
    )
    [string] $Path = [IO.Path]::Combine($Env:USERPROFILE, '.psdiscord')
    [string] $PathXML = [IO.Path]::Combine($Path, "config.xml")

    if (Test-Path -Path $PathXML) {
        $Configuration = Import-Clixml -Path $PathXML
        if ($null -ne $Configuration.$Name) {
            return $Configuration.$Name
        }
    }
    return $null
}