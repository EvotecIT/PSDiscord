@{
    AliasesToExport      = @('New-DiscordField', 'New-DiscordThumbnail', 'New-DiscordEmbed')
    Author               = 'Przemyslaw Klys'
    CmdletsToExport      = @()
    CompanyName          = 'Evotec'
    CompatiblePSEditions = @('Desktop', 'Core')
    Copyright            = '(c) 2011 - 2021 Przemyslaw Klys @ Evotec. All rights reserved.'
    Description          = 'Simple module to send messages to Discord'
    FunctionsToExport    = @('New-DiscordAuthor', 'New-DiscordFact', 'New-DiscordImage', 'New-DiscordSection', 'Send-DiscordMessage')
    GUID                 = 'd5ae39b1-56a4-4f43-b251-e402b0c3c485'
    ModuleVersion        = '0.2.3'
    PowerShellVersion    = '5.1'
    PrivateData          = @{
        PSData = @{
            Tags       = @('Discord', 'Messaging', 'Communication', 'Social')
            ProjectUri = 'https://github.com/EvotecIT/PSDiscord'
            IconUri    = 'https://evotec.xyz/wp-content/uploads/2018/12/Discord-Logo-Color.png'
        }
    }
    RequiredModules      = @(@{
            ModuleVersion = '0.0.201'
            ModuleName    = 'PSSharedGoods'
            Guid          = 'ee272aa8-baaa-4edf-9f45-b6d6f7d844fe'
        })
    RootModule           = 'PSDiscord.psm1'
}