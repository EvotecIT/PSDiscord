function New-DiscordFact {
    [alias("New-DiscordField")]
    [CmdletBinding()]
    param (
        [string] $Name,
        [string] $Value,
        [bool] $Inline
    )
    $Fact = [ordered] @{
        name  = "$Name"
        value = "$Value"
        inline = $inline
    }
    return $Fact
}