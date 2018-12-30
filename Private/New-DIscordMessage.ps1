function New-DiscordMessage {
    [CmdletBinding()]
    param ()
    $Message = [ordered] @{
        "embeds" = @()
    }
    return , $Message
}