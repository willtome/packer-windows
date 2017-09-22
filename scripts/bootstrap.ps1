# Disable IPv6
New-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\' -Name  'DisabledComponents' -Value '0xffffffff' -PropertyType 'DWord'

# Install VMware Tools
Write-Host "Installing VMware Tools"
Start-Process 'D:\setup64.exe' -ArgumentList '/S','/v','"/qn REBOOT=r"' -Wait

#Copy Scripts
Write-Host "Staging Scripts"
Copy-Item a:\ansible.ps1 c:\Windows\Temp\ansible.ps1
New-Item -Path 'C:\Windows\Setup\Scripts' -ItemType Directory -Force
Copy-Item a:\SetupComplete.cmd c:\Windows\Setup\Scripts\SetupComplete.cmd
