<# -----------------------------------------------------------------------------

 meraki_api_functions.psm1

 .Synopsis
    A helpful module to bridge PowerShell to and wrap the Meraki API endpoints.

----------------------------------------------------------------------------- #>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

<# -----------------------------------------------------------------------------
 Get-MerakiDevices()

 .Description
    List Devices in a given Meraki network.
----------------------------------------------------------------------------- #>
function Get-MerakiDevices {
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key,
    
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $networkID
)

    $api = @{
        "endpoint" = 'https://api.meraki.com/api/v0'
    }

    $header = @{
        "X-Cisco-Meraki-API-Key" = $api_key
        "Content-Type" = 'application/json'
    }
    
    $api.url = "/networks/$networkID/devices"
    $uri = $api.endpoint + $api.url
    $request = Invoke-RestMethod -Method GET -Uri $uri -Headers $header
    return $request
} Export-ModuleMember -Function Get-MerakiDevices

<# -----------------------------------------------------------------------------
 Get-MerakiVPNPeers()

 .Description
    List third party VPN peers configured in a given Meraki organization.
----------------------------------------------------------------------------- #>
function Get-MerakiVPNPeers {
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key,
        
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $orgID
)
    $api = @{
        "endpoint" = 'https://api.meraki.com/api/v0'
    }

    $header = @{
        "X-Cisco-Meraki-API-Key" = $api_key
        "Content-Type" = 'application/json'
    }

    $api.url = "/organizations/$orgID/thirdPartyVPNPeers"
    $uri = $api.endpoint + $api.url
    $request = Invoke-RestMethod -Method GET -Uri $uri -Headers $header
    return $request
} Export-ModuleMember -Function Get-MerakiVPNPeers

<# -----------------------------------------------------------------------------
 Get-MerakiNetworks()

 .Description
    List networks for a given Meraki organization.
----------------------------------------------------------------------------- #>
function Get-MerakiNetworks {
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key,
    
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $orgID
)
    $api = @{
        "endpoint" = 'https://api.meraki.com/api/v0'
    }

    $header = @{
        "X-Cisco-Meraki-API-Key" = $api_key
        "Content-Type" = 'application/json'
    }

    $api.url = "/organizations/$orgID/networks"
    $uri = $api.endpoint + $api.url
    $request = Invoke-RestMethod -Method GET -Uri $uri -Headers $header
    return $request
} Export-ModuleMember -Function Get-MerakiNetworks

<# -----------------------------------------------------------------------------
 Get-MerakiOrganizations()

 .Description
    List organizations available to your Meraki API key.
----------------------------------------------------------------------------- #>
function Get-MerakiOrganizations {
param (
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [String]
    $api_key
)
    $api = @{
        "endpoint" = 'https://api.meraki.com/api/v0'
    }

    $header = @{
        "X-Cisco-Meraki-API-Key" = $api_key
        "Content-Type" = 'application/json'
    }

    $api.url = '/organizations'
    $uri = $api.endpoint + $api.url
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $request = Invoke-RestMethod -Method GET -Uri $uri -Headers $header
    return $request
 
} Export-ModuleMember -Function Get-MerakiOrganizations
