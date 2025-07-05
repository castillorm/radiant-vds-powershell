function Search-VDSUsers {
    param (
        [string]$BaseUrl,
        [hashtable]$Headers
    )

    Invoke-VDSQuery -BaseUrl $BaseUrl -Headers $Headers `
        -BaseDN "ou=people,dc=example,dc=com" `
        -Filter "(objectClass=person)" `
        -Attributes @("cn", "uid", "mail")
}
