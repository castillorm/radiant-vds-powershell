function Connect-VDS {
    param (
        [string]$VdsUrl,
        [string]$Username,
        [string]$Password
    )

    $pair = "$Username`:$Password"
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($pair)
    $base64 = [Convert]::ToBase64String($bytes)
    $headers = @{ Authorization = "Basic $base64" }

    try {
        $response = Invoke-RestMethod -Uri "$VdsUrl/version" -Headers $headers
        Write-Host "✅ Connected to VDS (Version: $($response.version))"
        return $headers
    }
    catch {
        Write-Error "❌ Connection failed: $_"
        return $null
    }
}
