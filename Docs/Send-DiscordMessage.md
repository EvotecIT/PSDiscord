---
external help file: PSDiscord-help.xml
Module Name: PSDiscord
online version:
schema: 2.0.0
---

# Send-DiscordMessage

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

```
Send-DiscordMessage [[-WebHookUrl] <Uri>] [[-Sections] <IDictionary[]>] [[-Text] <String>]
 [[-AvatarName] <String>] [[-AvatarUrl] <Uri>] [-TextToSpeech] [-CreateConfig] [[-ConfigName] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AvatarName
{{Fill AvatarName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: Username

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AvatarUrl
{{Fill AvatarUrl Description}}

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ConfigName
{{Fill ConfigName Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CreateConfig
{{Fill CreateConfig Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sections
{{Fill Sections Description}}

```yaml
Type: IDictionary[]
Parameter Sets: (All)
Aliases: Embeds, Embed, Section

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Text
{{Fill Text Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: Content, Message

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TextToSpeech
{{Fill TextToSpeech Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: TTS

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WebHookUrl
{{Fill WebHookUrl Description}}

```yaml
Type: Uri
Parameter Sets: (All)
Aliases: Url, Uri

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
