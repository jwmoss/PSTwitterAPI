function Send-TwitterLists_Members_Destroy {

<#
.SYNOPSIS
    Create and manage lists

.DESCRIPTION
    POST lists/members/destroy
    
    Removes the specified member from the list. The authenticated user must be the list's owner to remove members from the list.

.PARAMETER list_id
    The numerical id of the list.

.PARAMETER slug
    You can identify a list by its slug instead of its numerical id. If you decide to do so, note that you'll also have to specify the list owner using the owner_id or owner_screen_name parameters.

.PARAMETER user_id
    The ID of the user to remove from the list. Helpful for disambiguating when a valid user ID is also a valid screen name.

.PARAMETER screen_name
    The screen name of the user for whom to remove from the list. Helpful for disambiguating when a valid screen name is also a user ID.

.PARAMETER owner_screen_name
    The screen name of the user who owns the list being requested by a slug .

.PARAMETER owner_id
    The user ID of the user who owns the list being requested by a slug .

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy

#>
    [CmdletBinding()]
    Param(
        [string]$list_id,
        [string]$slug,
        [string]$user_id,
        [string]$screen_name,
        [string]$owner_screen_name,
        [string]$owner_id
    )
    Begin {

        [string]$Method      = 'POST'
        [string]$Resource    = '/lists/members/destroy'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/lists/members/destroy.json'

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
