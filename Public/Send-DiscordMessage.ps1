function Send-DiscordMessage {
    [CmdletBinding()]
    param (
        [alias('Url', 'Uri')][Uri] $WebHookUrl,
        [alias('Embeds', 'Embed', 'Section')][System.Collections.IDictionary[]] $Sections,
        [alias('Content','Message')][string] $Text,
        [alias('Username')] [string] $AvatarName,
        [Uri] $AvatarUrl,
        [alias('TTS')][switch] $TextToSpeech,
        [switch] $CreateConfig,
        [string] $ConfigName
    )
    if (-not $WebHookUrl) {
        $WebHookUrl = Get-DiscordConfig -Name 'Primary'
    }
    if ($null -eq $WebHookUrl) {
        Write-Warning 'Send-DiscordMessage - WebhookUrl is not set. Either provide it as parameter or initialize it with config.'
    }
    if ($CreateConfig) {
        if (-not $ConfigName) {
            $ConfigName = 'Primary'
        }
        Initialize-DiscordConfig -ConfigName $ConfigName -URI $WebHookUrl
    }
    $FullMessage = New-DiscordMessage
    if ($null -ne $Sections) {
        foreach ($Section in $Sections) {
            $FullMessage.embeds += $Section
        }
    }
    if ($null -ne $Text) {
        if ($TextToSpeech) {
            # Applies only to Content
            $FullMessage.tts = $true
        }
        $FullMessage.content = $Text
    }
    if ($null -ne $AvatarName) {
        $FullMessage.username = $AvatarName
    }
    if ($null -ne $AvatarUrl) {
        $FullMessage.avatar_url = $AvatarUrl
    }

    $Body = ConvertTo-Json -Depth 6 -InputObject $FullMessage
    Write-Verbose -Message "Send-DiscordMessage - Body: `n$Body"
    Invoke-RestMethod -Uri $WebHookUrl -Body $Body -Method Post -ContentType "application/json" -Verbose:$false
}