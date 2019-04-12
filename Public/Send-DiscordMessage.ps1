function Send-DiscordMessage {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [alias('Url', 'Uri')][Uri] $WebHookUrl,
        [alias('Embeds', 'Embed', 'Section')][System.Collections.IDictionary[]] $Sections,
        [alias('Content', 'Message')][string] $Text,
        [alias('Username')] [string] $AvatarName,
        [Uri] $AvatarUrl,
        [alias('TTS')][switch] $TextToSpeech,
        [switch] $CreateConfig,
        [string] $ConfigName,
        [switch] $OutputJSON
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
    $FullMessage = [ordered] @{
        "embeds" = @()
    }
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
    if ($PSCmdlet.ShouldProcess("$([System.Environment]::NewLine)$Body", 'Invoke-RestMethod')) {
        Invoke-RestMethod -Uri $WebHookUrl -Body $Body -Method Post -ContentType "application/json" -Verbose:$false
    }
    if ($OutputJSON) {
        return $Body
    }
}