<#
.Name  : Deploy-VM.ps1
.Author: Satyajit Roy Choudhury
.Date  : 27.06.2013
.Usage : Script will deploy VMs from a csv file list.
#>

$VMDatastore = "DATAStore"
$VMLocation = "Puppet"
$VMDeployTemplate = "CentOS6.4_TMPL_Prod"
$vmHost = "esxi.example.com"
$netmask1 = "255.255.252.0"
$eth0 = "eth0"
$eth1 = "eth1"
$eth2 = "eth2"
$eth3 = "eth3"
$gateway = "10.10.10.10"

#Connect to vCenter
Connect-VIserver vCenter.example.com

Import-Csv C:\tmp\testvm.csv |

Foreach {
	Write-Host "Creating VM "$_.VMName
	New-VM -Name $_.VMName -VMHost $vmHost -Template $VMDeployTemplate -Datastore $VMDatastore -Location $VMLocation
			
	Write-Host "Now starting VM "$_.VMName
        
    Start-VM -VM $_.VMName
	
	Write-Host "STARTing VLAN configuration......"
	
	sleep -Seconds 60
	
	Write-host "Waiting For VM Configuration To Update Within VC"
	
	sleep -Seconds 60
	
	# Identify the right Interface
	$ethernet0 = Get-VMGuestNetworkInterface -VM $_.VMName -HostUser root -HostPassword S@b@R00t2012! -GuestUser root -GuestPassword Password | where-object { $_.Name -eq "eth0"}
	$ethernet1 = Get-VMGuestNetworkInterface -VM $_.VMName -HostUser root -HostPassword S@b@R00t2012! -GuestUser root -GuestPassword Password | where-object { $_.Name -eq "eth1"}
	$ethernet2 = Get-VMGuestNetworkInterface -VM $_.VMName -HostUser root -HostPassword S@b@R00t2012! -GuestUser root -GuestPassword Password | where-object { $_.Name -eq "eth2"}
	$ethernet3 = Get-VMGuestNetworkInterface -VM $_.VMName -HostUser root -HostPassword S@b@R00t2012! -GuestUser root -GuestPassword Password | where-object { $_.Name -eq "eth3"}
	
	Remove-NetworkAdapter -NetworkAdapter $ethernet2 -Confirm:$false
	Remove-NetworkAdapter -NetworkAdapter $ethernet3 -Confirm:$false
	
	Set-VMGuestNetworkInterface -VMGuestNetworkInterface $ethernet0 -HostUser root -HostPassword S@b@R00t2012! -GuestUser root -GuestPassword Password -IP $_.eth0 -Netmask $netmask1
	Set-VMGuestNetworkInterface -VMGuestNetworkInterface $ethernet1 -HostUser root -HostPassword S@b@R00t2012! -GuestUser root -GuestPassword Password -IP $_.eth1 -Netmask $netmask1 -Gateway $gateway
	#Set-VMGuestNetworkInterface -VMGuestNetworkInterface $ethernet2 -HostUser root -HostPassword S@b@R00t2012! -GuestUser root -GuestPassword Password -IP $_.eth2 -Netmask $netmask1
	#Set-VMGuestNetworkInterface -VMGuestNetworkInterface $ethernet3 -HostUser root -HostPassword S@b@R00t2012! -GuestUser root -GuestPassword Password -IP $_.eth3 -Netmask $netmask1
	
	$hostname = 'echo ' + '"' + 'HOSTNAME=' + $_.VMName + '"' + ' >> /etc/sysconfig/network'
	
	# Invoking local scripts to complete the deployments
	Invoke-VMScript -ScriptText $hostname -GuestPassword Password -GuestUser root -VM $_.VMName
    # Stop increasing the Eth numbers
	Invoke-VMScript -ScriptText "rm -rf /etc/udev/rules.d/70-persistent-net.rules" -GuestPassword Password -GuestUser root -VM $_.VMName
	Invoke-VMScript -ScriptText "rm -rf /etc/sysconfig/network-scripts/route-eth*" -GuestPassword Password -GuestUser root -VM $_.VMName
    # Remove the library
    Invoke-VMScript -ScriptText "rm -rf /usr/lib/vmware-tools/plugins32/vmsvc/libtimeSync.so" -GuestPassword $@b@atW0rk! -GuestUser root -VM $_.VMName
	Invoke-VMScript -ScriptText "rm -rf /usr/lib/vmware-tools/plugins64/vmsvc/libtimeSync.so" -GuestPassword $@b@atW0rk! -GuestUser root -VM $_.VMName
	Invoke-VMScript -ScriptText "/bin/sed -i -e 's/1024/unlimited/' /etc/security/limits.d/90-nproc.conf" -GuestPassword $@b@atW0rk! -GuestUser root -VM $_.VMName
	Invoke-VMScript -ScriptText "/sbin/route add -net default gw X.X.X.X" -VM $_.VMName -GuestPassword Password -GuestUser root -RunAsync
	Invoke-VMScript -ScriptText "/sbin/service network restart" -VM $_.VMName -GuestPassword Password -GuestUser root -RunAsync
	Invoke-VMScript -ScriptText "/sbin/reboot" -VM $_.VMName -GuestPassword Password -GuestUser root -RunAsync
	
	}