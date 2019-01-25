function Send-TwitterAccount_UpdateProfile {

<#
.SYNOPSIS
    Manage account settings and profile

.DESCRIPTION
    POST account/update_profile
    
    Sets some values that users are able to set under the "Account" tab of their settings page. Only the parameters specified will be updated.

.PARAMETER url
    URL associated with the profile. Will be prepended with http:// if not present.

.PARAMETER location
    The city or country describing where the user of the account is located. The contents are not normalized or geocoded in any way.

.PARAMETER description
    A description of the user owning the account.

.PARAMETER profile_link_color
    Sets a hex value that controls the color scheme of links used on the authenticating user's profile page on twitter.com. This must be a valid hexadecimal value, and may be either three or six characters (ex: F00 or FF0000). This parameter replaces the deprecated (and separate) update_profile_colors API method.

.PARAMETER include_entities
    The entities node will not be included when set to false .

.PARAMETER skip_status
    When set to either true , t or 1 statuses will not be included in the returned user object.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/accounts-and-users/manage-account-settings/api-reference/post-account-update_profile

#>
    [CmdletBinding()]
    Param(
        [string]$url,
        [string]$location,
        [string]$description,
        [string]$profile_link_color,
        [string]$include_entities,
        [string]$skip_status
    )
    Begin {

        [string]$Method      = 'POST'
        [string]$Resource    = '/account/update_profile'
        [string]$ResourceUrl = 'https://api.twitter.com/1.1/account/update_profile.json'

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
