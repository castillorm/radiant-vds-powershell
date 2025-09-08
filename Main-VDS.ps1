# ========== Configuration ==========
$VdsUrl    = "https://your-vds-host:7443/radiantone/rest"
$Username  = "cn=admin,ou=globalusers,dc=example,dc=com"
$Password  = "SuperSecret123!"  # ⚠️ Only embed if you trust your environment

# ========== Load Child Scripts ==========
. "$PSScriptRoot\Connect-VDS.ps1"
. "$PSScriptRoot\Query-VDS.ps1"
. "$PSScriptRoot\Search-VDS.ps1"

# ========== Connect to VDS ==========
$AuthHeaders = Connect-VDS -VdsUrl $VdsUrl -Username $Username -Password $Password

if ($null -eq $AuthHeaders) {
    Write-Error "Failed to connect to VDS. Exiting."
    exit 1
}

# ========== Run a Basic Query ==========
Invoke-VDSQuery -BaseUrl $VdsUrl -Headers $AuthHeaders -BaseDN "ou=people,dc=example,dc=com"

# ========== Optional: Run Custom Searches ==========
Search-VDSUsers -BaseUrl $VdsUrl -Headers $AuthHeaders
