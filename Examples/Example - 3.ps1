$DiscordUrl = '....'

$Author = New-DiscordAuthor -Name 'Pester Tester' -IconUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
$Fact1 = New-DiscordFact -Name '**PS Version**' -Value "$($PSVersionTable.PSVersion)" -Inline $true
$Fact2 = New-DiscordFact -Name '**PS Edition**' -Value "$($PSVersionTable.PSEdition)" -Inline $true
$Fact3 = New-DiscordFact -Name '**OS**' -Value "$($PSVersionTable.OS)" -Inline $true
$Fact4 = New-DiscordFact -Name '**Computer Name**' -Value "$($Env:COMPUTERNAME)" -Inline $true

$Thumbnail = New-DiscordThumbnail -Url "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"

$Section = New-DiscordSection -Title 'Everybody panic!' -Description '' -Facts $Fact1, $Fact2, $Fact3, $Fact4 -Color BlueViolet -Author $Author -Thumbnail $Thumbnail
Send-DiscordMessage -WebHookUrl $DiscordUrl -Sections $Section -AvatarName 'Pester Tester' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png" -Verbose