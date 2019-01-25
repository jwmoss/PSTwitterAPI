function Send-TwitterSavedSearches_Create {

<#
.SYNOPSIS
    Manage account settings and profile

.DESCRIPTION
    POST saved_searches/create
    
    Create a new saved search for the authenticated user. A user may only have 25 saved searches.

.PARAMETER query
    The query of the search the user would like to save.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/manage-account-settings/api-reference/post-saved_searches-create

#>
    [CmdletBinding()]
    Param(
        [string]$query
    )
    Begin {

        [string]$Method      = 'POST'
        [string]$Resource    = '/saved_searches/create'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/saved_searches/create.json'

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
