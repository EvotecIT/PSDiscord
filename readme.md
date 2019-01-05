# PSDiscord - PowerShell Module
[![Build Status](https://dev.azure.com/evotecpl/PSDiscord/_apis/build/status/EvotecIT.PSDiscord?branchName=master)](https://dev.azure.com/evotecpl/PSDiscord/_build/latest?definitionId=5?branchName=master)


[PSDiscord](https://evotec.xyz/hub/scripts/psdiscord-powershell-module/) is a **PowerShell Module** working on **Windows** / **Linux** and **Mac**. It allows to send notifications to *Discord*. It's pretty flexible and provides of easy to use cmdlets.

For description and **advanced** usage visit [PSDiscord](https://evotec.xyz/hub/scripts/psdiscord-powershell-module/) dedicated page.

## Updates
- 0.0.6 / 2019.01.01
    - small improvements
- 0.0.5 / 2018.12.30
    - first release

## Installing on Windows / Linux / MacOS

```powershell
Install-Module PSDiscord
#Install-Module PSPSDiscord -Scope CurrentUser
```

## Updating on Windows / Linux / MacOS

```powershell
Update-Module PSDiscord
```

## Usage

```powershell
$Uri = 'https://discordapp.com/api/webhooks/5083323013'

$Author = New-DiscordAuthor -Name 'PSBlacklistChecker' -IconUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
$Fact = New-DiscordFact -Name 'Blacklisted IP 89.74.48.97' -Value 'Found on blacklist dnsbl.sorbs.net' -Inline $false
$Thumbnail = New-DiscordThumbnail -Url "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
$Section = New-DiscordSection -Title 'Everybody panic!' -Description '' -Facts $Fact, $Fact, $Fact -Color BlueViolet -Author $Author -Thumbnail $Thumbnail -Image $Thumbnail
Send-DiscordMessage -WebHookUrl $Uri -Sections $Section -AvatarName 'PSBlackListChecker' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSTeams/master/Links/Asset%20130.png"
```

## How does it look like?

![image](https://evotec.xyz/wp-content/uploads/2019/01/img_5c3089ad7e553.png)