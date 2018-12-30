$DiscordUrl = '....'

Send-DiscordMessage -WebHookUrl $DiscordUrl -Content 'Testing Text to Speech option' -TextToSpeech -AvatarName 'Pester Tester' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
