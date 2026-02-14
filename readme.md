<p align="center">
  <a href="https://dev.azure.com/evotecpl/PSDiscord/_build/latest?definitionId=3"><img src="https://dev.azure.com/evotecpl/PSDiscord/_apis/build/status/EvotecIT.PSDiscord"></a>
  <a href="https://www.powershellgallery.com/packages/PSDiscord"><img src="https://img.shields.io/powershellgallery/v/PSDiscord.svg"></a>
  <a href="https://www.powershellgallery.com/packages/PSDiscord"><img src="https://img.shields.io/powershellgallery/v/PSDiscord.svg?label=powershell%20gallery%20preview&colorB=yellow&include_prereleases"></a>
  <a href="https://github.com/EvotecIT/PSDiscord"><img src="https://img.shields.io/github/license/EvotecIT/PSDiscord.svg"></a>
</p>

<p align="center">
  <a href="https://www.powershellgallery.com/packages/PSDiscord"><img src="https://img.shields.io/powershellgallery/p/PSDiscord.svg"></a>
  <a href="https://github.com/EvotecIT/PSDiscord"><img src="https://img.shields.io/github/languages/top/evotecit/PSDiscord.svg"></a>
  <a href="https://github.com/EvotecIT/PSDiscord"><img src="https://img.shields.io/github/languages/code-size/evotecit/PSDiscord.svg"></a>
  <a href="https://www.powershellgallery.com/packages/PSDiscord"><img src="https://img.shields.io/powershellgallery/dt/PSDiscord.svg"></a>
</p>

<p align="center">
  <a href="https://twitter.com/PrzemyslawKlys"><img src="https://img.shields.io/twitter/follow/PrzemyslawKlys.svg?label=Twitter%20%40PrzemyslawKlys&style=social"></a>
  <a href="https://evotec.xyz/hub"><img src="https://img.shields.io/badge/Blog-evotec.xyz-2A6496.svg"></a>
  <a href="https://www.linkedin.com/in/pklys"><img src="https://img.shields.io/badge/LinkedIn-pklys-0077B5.svg?logo=LinkedIn"></a>
</p>

# PSDiscord - PowerShell Module

[PSDiscord](https://evotec.xyz/hub/scripts/psdiscord-powershell-module/) is a **PowerShell Module** working on **Windows** / **Linux** and **Mac**. It allows to send notifications to *Discord*. It's pretty flexible and provides of easy to use cmdlets.

For description and **advanced** usage visit [PSDiscord](https://evotec.xyz/hub/scripts/psdiscord-powershell-module/) dedicated page.

## Updates

- 0.2.4 / 2021.06.06
  - Replaced [RGBColors] with [string] and defined 800+ colors in New-DiscordSection
- 0.2.3 / 2021.06.01
  - Supports UTF8 chars/emoji
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

$Author = New-DiscordAuthor -Name 'PSBlacklistChecker' -IconUrl "https://raw.githubusercontent.com/EvotecIT/PSDiscord/master/Links/Asset%20130.png"
$Fact = New-DiscordFact -Name 'Blacklisted IP 89.74.48.97' -Value 'Found on blacklist dnsbl.sorbs.net' -Inline $false
$Thumbnail = New-DiscordThumbnail -Url "https://raw.githubusercontent.com/EvotecIT/PSDiscord/master/Links/Asset%20130.png"
$Section = New-DiscordSection -Title 'Everybody panic!' -Description '' -Facts $Fact, $Fact, $Fact -Color BlueViolet -Author $Author -Thumbnail $Thumbnail -Image $Thumbnail
Send-DiscordMessage -WebHookUrl $Uri -Sections $Section -AvatarName 'PSBlackListChecker' -AvatarUrl "https://raw.githubusercontent.com/EvotecIT/PSDiscord/master/Links/Asset%20130.png"
```

## How does it look like?

![image](https://evotec.xyz/wp-content/uploads/2019/01/img_5c3089ad7e553.png)
