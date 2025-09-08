# Radiant Logic VDS PowerShell Toolkit

This toolkit provides modular PowerShell scripts to connect to and interact with Radiant Logic Virtual Directory Server (VDS) using the REST API.

---

## 📂 Folder Structure

```
VDS-PowerShell-Toolkit/
│
├── Main-VDS.ps1             # Master script to run VDS calls
├── Connect-VDS.ps1          # Handles auth using embedded or secure credentials
├── Query-VDS.ps1            # Performs search queries via the REST API
├── Search-VDS.ps1           # Advanced search (e.g. filter by objectClass)
├── .gitignore
└── README.md
```

---

## 🚀 Quick Start

1. **Clone this repository**
2. **Edit `Main-VDS.ps1`**
   - Set your `VdsUrl`, `Username`, and `Password` in the config section
3. **Run the script**

```powershell
cd path\to\repo
.\Main-VDS.ps1
```

---

## 🔐 Security Options

### Option A: Hardcoded Credentials (Simple)
In `Main-VDS.ps1`, embed:
```powershell
$Username = "cn=admin,..."
$Password = "SuperSecret123"
```

> **Warning:** Only use in trusted/dev environments.

---

### Option B: Secure Credential Prompt (Recommended)

Update `Connect-VDS.ps1` to:
```powershell
$cred = Get-Credential
Connect-VDS -VdsUrl $VdsUrl -Username $cred.UserName -Password ($cred.GetNetworkCredential().Password)
```

---

## ✅ Endpoints Used

- `/radiantone/rest/version` → confirms API availability
- `/radiantone/rest/search` → performs LDAP-style search

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).
