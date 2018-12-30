function Send-DiscordMessage {
    [CmdletBinding()]
    param (
        [alias('Url', 'Uri')][Uri] $WebHookUrl,
        [System.Collections.IDictionary] $Author,
        [alias('Embeds', 'Embed', 'Section')][System.Collections.IDictionary[]] $Sections
    )
    $Message = New-DiscordMessage
    if ($null -ne $Sections) {
        foreach ($Section in $Sections) {
            $Message.embeds += $Section
        }
    }
    if ($null -ne $Author) {
        #  $Message.author = $Author
    }
    $Body = ConvertTo-Json -Depth 6 -InputObject $Message
    Write-Verbose -Message "Send-DiscordMessage - Body: `n$Body"
    Invoke-RestMethod -Uri $WebHookUrl -Body $Body -Method Post -ContentType "application/json" #-Verbose
}