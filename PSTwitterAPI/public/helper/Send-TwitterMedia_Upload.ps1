function Send-TwitterMedia_Upload {

<#
.SYNOPSIS
    Upload media

.DESCRIPTION
    POST media/upload
    
    Overview
    
    Use this endpoint to upload images to Twitter. It returns a media_id which can be used in most Twitter endpoints that accept images. For example, a media_id value can be used to create a Tweet with an attached photo using the POST statuses/update endpoint.
    
    This is a simple image upload endpoint, with a limited set of features. The preferred alternative is the chunked upload endpoint which supports both images and videos, provides better reliability, allows resumption of file uploads, and other important features. In the future, new features will only be supported for the chunked upload endpoint.
    
    See the Uploading media guide for constraints and requirements on media files.
    
    Use the media metadata endpoint to provide image alt text information.
    
    Ensure the POST is a multipart/form-data request. Either upload the raw binary (media parameter) of the file, or its base64-encoded contents (media_data parameter). Use raw binary when possible, because base64 encoding results in larger file sizes
    
    The response provides a media identifier in the media_id (64-bit integer) and media_id_string (string) fields. Use the media_id_string provided in the API response from JavaScript and other languages that cannot accurately represent a long integer.
    
    The returned media_id is only valid for expires_after_secs seconds. Any attempt to use media_id after this time period in other endpoints will result in an HTTP 4xx Bad Request.
    
    The additional_owners field enables media to be uploaded media as user A and then used to create Tweets as user B.
    
    Please note that for certain types of data (tweet_gif, tweet_video and amplify_video), you need to use the chunked upload end-point.
    
    Request
    
    Requests should be either multipart/form-data or application/x-www-form-urlencoded POST formats.
    
    Note: The domain for this endpoint is upload.twitter.com

.PARAMETER media
    The raw binary file content being uploaded. Cannot be used with media_data.

.PARAMETER media_data
    The base64-encoded file content being uploaded. Cannot be used with media.

.PARAMETER additional_owners
    A comma-separated list of user IDs to set as additional owners allowed to use the returned media_id in Tweets or Cards. Up to 100 additional owners may be specified.

.NOTES
    This helper function was generated by the information provided here:
    https://developer.twitter.com/en/docs/media/upload-media/api-reference/post-media-upload

#>
    [CmdletBinding()]
    Param(
        [string]$media,
        [string]$media_data,
        [string]$additional_owners
    )
    Begin {

        [string]$Method      = 'POST'
        [string]$Resource    = '/media/upload'
        [string]$ResourceUrl = 'https://upload.twitter.com/1.1/media/upload.json'

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
