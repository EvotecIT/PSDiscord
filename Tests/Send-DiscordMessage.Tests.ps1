param (
    $DiscordUrl = $Env:DiscordUrl
)
#Requires -Modules Pester
Import-Module $PSScriptRoot\..\PSDiscord.psd1 -Force #-Verbose

Describe 'Send-TeamsMessage - Should send messages properly' {
    It 'Given - url, content and avatar name with url - Should send message properly' {

        Send-DiscordMessage -WebHookUrl $DiscordUrl -Content 'My pester tests - Starting up' -AvatarName 'Pester Tester' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
    }
    It 'Given - url, content and avatar name with url and Text To Speech - Should send message properly' {

        Send-DiscordMessage -WebHookUrl $DiscordUrl -Content 'Testing Text to Speech option' -TextToSpeech -AvatarName 'Pester Tester' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
    }
    It 'Given - Author, Fact, Thumbnail, Section, Color - Should send message properly' {

        $Author = New-DiscordAuthor -Name 'Pester Tester' -IconUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
        $Fact1 = New-DiscordFact -Name '**PS Version**' -Value "$($PSVersionTable.PSVersion)" -Inline $true
        $Fact2 = New-DiscordFact -Name '**PS Edition**' -Value "$($PSVersionTable.PSEdition)" -Inline $true
        $Fact3 = New-DiscordFact -Name '**OS**' -Value "$($PSVersionTable.OS)" -Inline $true
        $Fact4 = New-DiscordFact -Name '**Computer Name**' -Value "$($Env:COMPUTERNAME)" -Inline $true

        $Thumbnail = New-DiscordThumbnail -Url "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"

        $Section = New-DiscordSection -Title 'Everybody panic!' -Description '' -Facts $Fact1, $Fact2, $Fact3, $Fact4 -Color BlueViolet -Author $Author -Thumbnail $Thumbnail
        Send-DiscordMessage -WebHookUrl $DiscordUrl -Sections $Section -AvatarName 'Pester Tester' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png" -Verbose
    }
    It 'Given - Author, 3 facts, 1 image, 1 section, Avatar Name and URL - Should send message properly' {

        $Author = New-DiscordAuthor -Name 'Pester Tester' -IconUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
        $Fact1 = New-DiscordFact -Name '**PS Version**' -Value "$($PSVersionTable.PSVersion)" -Inline $true
        $Fact2 = New-DiscordFact -Name '**PS Edition**' -Value "$($PSVersionTable.PSEdition)" -Inline $true
        $Fact3 = New-DiscordFact -Name '**OS**' -Value "$($PSVersionTable.OS)" -Inline $true
        $Fact4 = New-DiscordFact -Name '**Computer Name**' -Value "$($Env:COMPUTERNAME)" -Inline $true

        $Image = New-DiscordImage -Url "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"

        $Section = New-DiscordSection -Title 'Everybody panic!' -Description '' -Facts $Fact1, $Fact2, $Fact3,$Fact4 -Color BlueViolet -Author $Author -Image $Image
        Send-DiscordMessage -WebHookUrl $DiscordUrl `
            -Sections $Section `
            -AvatarName 'Pester Tester' `
            -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"

    }
}