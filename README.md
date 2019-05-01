These are a set of functions to interact with the Meraki cloud via the REST API.

You will need to generate an API key on the Meraki Dashboard. Each function prompts for this key.

1. Get-MerakiOrganizations function will output each Organization name and ID in your dashboard.
2. Get-MerakiNetworks and Get-MerakiVPNPeers functions require an Organization ID and output the list of Networks and third party VPN peers registered to that organization, respectively.
3. Get-MerakiDevices requires a Network ID (found using Get-MerakiNetworks) and lists devices (APs, switches, etc) in that network.
