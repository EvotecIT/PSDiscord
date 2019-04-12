function Initialize-DiscordConfig {
    [CmdletBinding()]
    param(
        [string] $Name = 'Primary',
        [Uri] $URI
    )
    [string] $Path = [IO.Path]::Combine($Env:USERPROFILE, '.psdiscord')
    [string] $PathXML = [IO.Path]::Combine($Path, "config.xml")
    # Creates required folder

    $Configuration = @{}
    $Configuration.$Name = $URI

    $null = New-Item -Path $Path -ItemType Directory -Force
    Export-Clixml -Path $PathXML -InputObject $Configuration -Force
}