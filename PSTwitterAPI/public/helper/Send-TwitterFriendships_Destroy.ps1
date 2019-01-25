function Send-TwitterFriendships_Destroy {

<#
.SYNOPSIS
    Follow, search, and get users

.DESCRIPTION
    POST friendships/destroy
    
    Allows the authenticating user to unfollow the user specified in the ID parameter.
    
    Returns the unfollowed user when successful. Returns a string describing the failure condition when unsuccessful.
    
    Actions taken in this method are asynchronous. Changes will be eventually consistent.

.PARAMETER screen_name
    The screen name of the user to unfollow.

.PARAMETER user_id
    The ID of the user to unfollow.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/post-friendships-destroy

#>
    [CmdletBinding()]
    Param(
        [string]$screen_name,
        [string]$user_id
    )
    Begin {

        [string]$Method      = 'POST'
        [string]$Resource    = '/friendships/destroy'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/friendships/destroy.json'

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
