# Radiant Logic VDS PowerShell Toolkit

This repository contains PowerShell script examples for interacting with Radiant Logic Virtual Directory Server (VDS) using its REST API. These scripts are designed to help engineers connect, authenticate, and query VDS programmatically.

## 🔧 Prerequisites

- PowerShell 5.1+ or PowerShell Core
- VDS credentials (DN and password)
- VDS REST API endpoint (e.g., `https://<host>:<port>/radiantone/rest`)

## 📂 Contents

- `Connect-VDS.ps1`: Authenticate and generate REST headers.
- `Query-VDS.ps1`: Perform a basic LDAP-style query via REST API.
- `Search-VDS.ps1`: More advanced search options with filter and attributes.

## 🔐 Authentication

Basic authentication is used. Your credentials will be Base64 encoded in the headers. Ensure HTTPS is used to protect credentials.

## 🚀 Usage

```powershell
# Set credentials
$dn = "cn=admin,ou=globalusers,dc=example,dc=com"
$password = "MySecretPassword"
$baseUrl = "https://my-vds-host:7443/radiantone/rest"

# Import scripts
. .\Connect-VDS.ps1
. .\Query-VDS.ps1

# Get authentication headers
$headers = Get-VDSAuthHeader -DN $dn -Password $password

# Perform a search
Invoke-VDSQuery -BaseUrl $baseUrl -Headers $headers -BaseDN "ou=people,dc=example,dc=com"
