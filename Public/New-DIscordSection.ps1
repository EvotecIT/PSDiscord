function New-DiscordSection {
    [alias("New-DiscordEmbed")]
    [CmdletBinding()]
    param (
        [string] $Title,
        [string] $Description,
        [alias('Fields')][System.Collections.IDictionary[]] $Facts,
        [RGBColors] $Color,
        [System.Collections.IDictionary] $Author,
        [System.Collections.IDictionary] $Thumbnail,
        [System.Collections.IDictionary] $Image
    )
    $Section = [ordered] @{
        title       = $Title
        description = $Description
        fields      = @()
    }
    $Field = foreach ($Fact in $Facts) {
        if ($null -ne $Fact) {
            $Fact
        }
    }
    $Section.fields = @($Field)
    if ($null -ne $Color) {
        $Section.color = ConvertFrom-Color -Color $Color -AsDecimal
    }
    if ($null -ne $Author) {
        $Section.author = $Author
    }
    if ($null -ne $Image) {
        $Section.image = $Image
    }
    if ($null -ne $Thumbnail) {
        $Section.thumbnail = $Thumbnail
    }
    return $Section
}