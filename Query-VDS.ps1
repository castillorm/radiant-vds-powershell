function Invoke-VDSQuery {
    param (
        [string]$BaseUrl,
        [hashtable]$Headers,
        [string]$BaseDN,
        [string]$Scope = "subtree",
        [string]$Filter = "(objectClass=*)",
        [string[]]$Attributes = @("*")
    )

    $body = @{
        baseDN = $BaseDN
        scope = $Scope
        filter = $Filter
        attributes = $Attributes
    } | ConvertTo-Json -Depth 3

    $uri = "$BaseUrl/search"
    Invoke-RestMethod -Method Post -Uri $uri -Headers $Headers -Body $body -ContentType "application/json"
}
