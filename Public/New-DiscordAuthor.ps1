function New-DiscordAuthor {
    [CmdletBinding()]
    param (
        [string] $Name,
        [Uri] $Url,
        [Uri] $IconUrl,
        [Uri] $ProxyUrlIcon
    )
    $Author = [ordered] @{
        name           = $Name
        url            = $Url
        icon_url       = $IconUrl
        proxy_icon_url = $ProxyUrlIcon
    }
    return $Author
}