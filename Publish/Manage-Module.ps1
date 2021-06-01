Clear-Host
Import-Module "C:\Support\GitHub\PSPublishModule\PSPublishModule.psm1" -Force

$Configuration = @{
    Information = @{
        ModuleName        = 'PSDiscord'

        DirectoryProjects = 'C:\Support\GitHub'
        #DirectoryModules  = "C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules"
        DirectoryModules  = "$Env:USERPROFILE\Documents\WindowsPowerShell\Modules"

        FunctionsToExport = 'Public'
        AliasesToExport   = 'Public'

        Manifest          = @{
            # Script module or binary module file associated with this manifest.
            RootModule           = 'PSDiscord.psm1'
            # Version number of this module.
            ModuleVersion        = '0.2.X'
            # Minimum version of the Windows PowerShell engine required by this module
            PowerShellVersion    = '5.1'
            # Supported PSEditions
            CompatiblePSEditions = @('Desktop', 'Core')
            # ID used to uniquely identify this module
            GUID                 = 'd5ae39b1-56a4-4f43-b251-e402b0c3c485'
            # Author of this module
            Author               = 'Przemyslaw Klys'
            # Company or vendor of this module
            CompanyName          = 'Evotec'
            # Copyright statement for this module
            Copyright            = "(c) 2011 - $((Get-Date).Year) Przemyslaw Klys @ Evotec. All rights reserved."
            # Description of the functionality provided by this module
            Description          = 'Simple module to send messages to Discord'
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags                 = @('Discord', 'Messaging', 'Communication', 'Social')
            IconUri              = 'https://evotec.xyz/wp-content/uploads/2018/12/Discord-Logo-Color.png'
            ProjectUri           = 'https://github.com/EvotecIT/PSDiscord'
            #ReleaseNotes = ''
            RequiredModules      = @(
                @{ ModuleName = 'PSSharedGoods'; ModuleVersion = "Latest"; Guid = 'ee272aa8-baaa-4edf-9f45-b6d6f7d844fe' }
            )
        }
    }
    Options     = @{
        Merge             = @{
            Sort           = 'None'
            FormatCodePSM1 = @{
                Enabled           = $true
                RemoveComments    = $false
                FormatterSettings = @{
                    IncludeRules = @(
                        'PSPlaceOpenBrace',
                        'PSPlaceCloseBrace',
                        'PSUseConsistentWhitespace',
                        'PSUseConsistentIndentation',
                        'PSAlignAssignmentStatement',
                        'PSUseCorrectCasing'
                    )

                    Rules        = @{
                        PSPlaceOpenBrace           = @{
                            Enable             = $true
                            OnSameLine         = $true
                            NewLineAfter       = $true
                            IgnoreOneLineBlock = $true
                        }

                        PSPlaceCloseBrace          = @{
                            Enable             = $true
                            NewLineAfter       = $false
                            IgnoreOneLineBlock = $true
                            NoEmptyLineBefore  = $false
                        }

                        PSUseConsistentIndentation = @{
                            Enable              = $true
                            Kind                = 'space'
                            PipelineIndentation = 'IncreaseIndentationAfterEveryPipeline'
                            IndentationSize     = 4
                        }

                        PSUseConsistentWhitespace  = @{
                            Enable          = $true
                            CheckInnerBrace = $true
                            CheckOpenBrace  = $true
                            CheckOpenParen  = $true
                            CheckOperator   = $true
                            CheckPipe       = $true
                            CheckSeparator  = $true
                        }

                        PSAlignAssignmentStatement = @{
                            Enable         = $true
                            CheckHashtable = $true
                        }

                        PSUseCorrectCasing         = @{
                            Enable = $true
                        }
                    }
                }
            }
            FormatCodePSD1 = @{
                Enabled        = $true
                RemoveComments = $false
            }
            Integrate      = @{
                ApprovedModules = @('PSSharedGoods', 'PSWriteColor', 'Connectimo', 'PSUnifi', 'PSWebToolbox', 'PSMyPassword')
            }
        }
        Standard          = @{
            FormatCodePSM1 = @{

            }
            FormatCodePSD1 = @{
                Enabled = $true
                #RemoveComments = $true
            }
        }
        ImportModules     = @{
            Self            = $true
            RequiredModules = $false
            Verbose         = $false
        }
        PowerShellGallery = @{
            ApiKey   = 'C:\Support\Important\PowerShellGalleryAPI.txt'
            FromFile = $true
        }
        GitHub            = @{
            ApiKey   = 'C:\Support\Important\GithubAPI.txt'
            FromFile = $true
            UserName = 'EvotecIT'
            #RepositoryName = 'PSWriteHTML'
        }
        Documentation     = @{
            Path       = 'Docs'
            PathReadme = 'Docs\Readme.md'
        }
    }
    Steps       = @{
        BuildModule        = @{  # requires Enable to be on to process all of that
            Enable           = $true
            DeleteBefore     = $false
            Merge            = $true
            MergeMissing     = $true
            SignMerged       = $true
            Releases         = $true
            ReleasesUnpacked = $false
            RefreshPSD1Only  = $false
        }
        BuildDocumentation = $false
        ImportModules      = @{
            Self            = $true
            RequiredModules = $false
            Verbose         = $false
        }
        PublishModule      = @{  # requires Enable to be on to process all of that
            Enabled      = $true
            Prerelease   = ''
            RequireForce = $false
            GitHub       = $true
        }
    }
}

New-PrepareModule -Configuration $Configuration