function Get-TwitterWelcome_Message {

<#
.SYNOPSIS
    Welcome Messages

.DESCRIPTION
    GET direct_messages/welcome_messages/show
    
    Returns a Welcome Message by the given id.

.PARAMETER id (required)
    

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/direct-messages/welcome-messages/api-reference/get-welcome-message

#>
    [CmdletBinding()]
    Param(
        [string]$id
    )
    Begin {

        [string]$Method      = 'GET'
        [string]$Resource    = '/direct_messages/welcome_messages/show'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/direct_messages/welcome_messages/show.json'

        [hashtable]$Parameters = $PSBoundParameters
                   $CmdletBindingParameters | ForEach-Object { $Parameters.Remove($_) }

    }
    Process {

        If (-Not $OAuthSettings) { $OAuthSettings = Get-TwitterOAuthSettings -Resource $Resource }
        Invoke-TwitterAPI -Resource $Resource -Method $Method -Parameters $Parameters -OAuthSettings $OAuthSettings

    }
    End {

    }
}
