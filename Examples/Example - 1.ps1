Import-Module .\PSDiscord.psd1

$DiscordUrl = '....'

Send-DiscordMessage -WebHookUrl $DiscordUrl -Content 'My pester tests - Starting up' -AvatarName 'Pester Tester' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
