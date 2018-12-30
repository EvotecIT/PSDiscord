param (
    $DiscordUrl = $Env:DiscordUrl
)
#Requires -Modules Pester
Import-Module $PSScriptRoot\..\PSDiscord.psd1 -Force #-Verbose

Describe 'Send-TeamsMessage - Should send messages properly' {
    It 'Given - Author, Fact, Thumbnail, Section, Color - Should send message properly' {

        $Author = New-DiscordAuthor -Name 'PSBlacklistChecker' -IconUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
        $Fact = New-DiscordFact -Name 'Blacklisted IP 89.74.48.97' -Value 'Found on blacklist dnsbl.sorbs.net' -Inline $false
        $Thumbnail = New-DiscordThumbnail -Url "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"


        $Section = New-DiscordSection -Title 'Everybody panic!' -Description '' -Facts $Fact, $Fact, $Fact -Color BlueViolet -Author $Author -Thumbnail $Thumbnail #-Image $Thumbnail
        Send-DiscordMessage -WebHookUrl $DiscordUrl -Sections $Section -AvatarName 'PSBlackListChecker' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
    }
    It 'Given - url, content and avatar name with url - Should send message properly' {

        Send-DiscordMessage -WebHookUrl $DiscordUrl -Content 'My test' -AvatarName 'PSBlackListChecker' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
    }
}