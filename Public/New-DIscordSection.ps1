function New-DiscordSection {
    [alias("New-DiscordEmbed")]
    [CmdletBinding()]
    param (
        [string] $Title,
        [string] $Description,
        [alias('Fields')][System.Collections.IDictionary[]] $Facts,
        [RGBColors] $Color,
        $Author,
        [System.Collections.IDictionary] $Thumbnail,
        [System.Collections.IDictionary] $Image
    )
    $Section = [ordered] @{
        title       = $Title
        description = $Description
        fields      = @()
    }
    $Section.fields = foreach ($Fact in $Facts) {
        $Fact
    }
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