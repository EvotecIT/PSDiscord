param (
    $DiscordUrl = $Env:DiscordUrl
)
#Requires -Modules Pester
Import-Module $PSScriptRoot\..\PSDiscord.psd1 -Force #-Verbose

Describe 'Send-DiscordMessage - Should send messages properly' {
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

        $Section = New-DiscordSection -Title 'Everybody panic!' -Description '' -Facts $Fact1, $Fact2, $Fact3, $Fact4 -Color BlueViolet -Author $Author -Image $Image
        Send-DiscordMessage -WebHookUrl $DiscordUrl `
            -Sections $Section `
            -AvatarName 'Pester Tester' `
            -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"

    }
    It 'Given - Just 1 Author, 1 Fact, 1 Thumbnail, 1 Section, 1 Color - Should send message properly' {

        $Author = New-DiscordAuthor -Name 'Pester Tester' -IconUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
        $Fact1 = New-DiscordFact -Name '**PS Version**' -Value "$($PSVersionTable.PSVersion)" -Inline $true

        $Thumbnail = New-DiscordThumbnail -Url "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"

        $Section = New-DiscordSection -Title 'Everybody panic!' -Description '' -Facts $Fact1 -Color BlueViolet -Author $Author -Thumbnail $Thumbnail
        Send-DiscordMessage -WebHookUrl $DiscordUrl -Sections $Section -AvatarName 'Pester Tester' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png" -Verbose
    }
}
Describe 'Send-DiscordMessage - Invoke-RestMethod Test' {
    It 'Given basic data, things should be delivered to Discord' {
        # Discord message/notification configuration
        $Uri = $DiscordUrl
        $Author = New-DiscordAuthor -Name 'Name' -IconUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
        $Fact = New-DiscordFact -Name 'Test' -Value 'message' -Inline $false
        $Thumbnail = New-DiscordThumbnail -Url "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
        $Section = New-DiscordSection -Title 'message' -Description '' -Facts $Fact -Color Red -Author $Author -Thumbnail $Thumbnail -Image $Thumbnail
        Send-DiscordMessage -WebHookUrl $Uri -Sections $Section -AvatarName 'NoPixelChecker' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
    }
}