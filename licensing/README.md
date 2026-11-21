# Licensing Scripts

## Get-WindowsKey.ps1

Reads `DigitalProductId` from `HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion` and decodes the 25-character Windows product key stored in the registry.

### Usage

Run the script in PowerShell:

```powershell
.\Get-WindowsKey.ps1
```

Or copy and paste the contents of `Get-WindowsKey.ps1` directly into a PowerShell window and press Enter.

### Output

- **Retail key:** Prints your 25-character Windows product key.
- **Generic placeholder key** (such as `YTMG3-N6DKC-DKB77-7M9GH-8HVX7` or `VK7JG-NPHTM-C97JM-9MPGT-3V66T`): Your PC uses a digital license linked to your hardware or Microsoft Account, so there is no unique 25-character key stored locally.
