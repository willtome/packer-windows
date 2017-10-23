# Prepare ESX

## Enable GuestIPHack
```
esxcli system settings advanced set -o /Net/GuestIPHack -i 1
```

## Enable VNC
```
chmod 644 /etc/vmware/firewall/service.xml
chmod +t /etc/vmware/firewall/service.xml
```

Append the below section to the file
```
<service id="1000">
  <id>packer-vnc</id>
  <rule id="0000">
    <direction>inbound</direction>
    <protocol>tcp</protocol>
    <porttype>dst</porttype>
    <port>
      <begin>5900</begin>
      <end>6000</end>
    </port>
  </rule>
  <enabled>true</enabled>
  <required>true</required>
</service>
```

Change file permissions back
```
chmod 444 /etc/vmware/firewall/service.xml
esxcli network firewall refresh
```

# Set Packer variables
At the top of `win2016.json` set the variables for your environment.
This template was used to provision on a standard portgroup. To use a distributed portgroup, the portgroup type must be'Ephemeral' for the VM to connect. Copy the `ethernet0.dvs.switchId` and `ethernet0.dvs.portgroupId` from the vmx file of an existing VM. If you are using a standard switch, set the portgroup name with `"ethernet0.networkName": "VM Network"`. Finally, make sure that the iso name and path match the location and name of your ISO.
