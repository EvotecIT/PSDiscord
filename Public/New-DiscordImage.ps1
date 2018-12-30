function New-DiscordImage {
    [alias('New-DiscordThumbnail')]
    [CmdletBinding()]
    param (
        [Uri] $Url,
        [int] $Width,
        [int] $Height
    )
    $Thumbnail = [ordered] @{
        "url"    = $Url
        "width"  = $Width
        "height" = $Height
    }
    return $Thumbnail
}