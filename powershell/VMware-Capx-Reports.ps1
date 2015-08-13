###########################################################################
#
# NAME: Reports-VMware.ps1
#
# AUTHOR:  Satyajit Roy
#
# COMMENT: Get Capacity Report from ALL DCs - VMware
#
# VERSION HISTORY:
# 1.0 11/20/2013 - Initial release
#
###########################################################################

# Variables
$dt=Get-Date -uformat %b-%d-%Y
$ChartType = "xlBar"
$xlAutomatic = -4105
$xlBottom = -4107
$xlCenter = -4108
$xlContext = -5002
$xlContinuous = 1
$xlDiagonalDown = 5
$xlDiagonalUp = 6
$xlEdgeBottom = 9
$xlEdgeLeft = 7
$xlEdgeRight = 10
$xlEdgeTop = 8
$xlInsideHorizontal = 12
$xlInsideVertical = 11
$xlNone = -4142
$xlThin = 2 

$DCs = ('m1vc001.ops.saba', 'm3vc001.ops.saba', 'm5vc001.ops.saba')
$xlXLS = 56
$xlsfile = "C:\Temp\SABA-VMware-Capx-Report-$dt.xls"

$Excel = New-Object -ComObject Excel.Application
$Excel.visible = $false
$Excel = $Excel.Workbooks.Add()

$Sheet = $Excel.Worksheets.Item(1)
$Sheet.Cells.Item(4,1) = "No. Of vHost"
$Sheet.Cells.Item(5,1) = "No. Of VMs"
$Sheet.Cells.Item(6,1) = "No. of Templates"
$Sheet.Cells.Item(7,1) = "No. of Clusters"
$Sheet.Cells.Item(8,1) = "No. of Datastores"
$Sheet.Cells.Item(9,1) = "No. of Active VMs"
$Sheet.Cells.Item(10,1) = "No. of Inactive VMs"

$introw = 3
$intcol = 2

$Sheet.Cells.Item(1,1)= 'VMware Capacity Report'
$range = $Sheet.Range("a1","g2")
$range.Style = 'Title'
$range.Select()
$range.MergeCells = $true
$range.HorizontalAlignment = $xlCenter

$WorkBook = $Sheet.UsedRange
$WorkBook.Interior.ColorIndex = 19
$WorkBook.Font.ColorIndex = 11
$WorkBook.Font.Bold = $True
$WorkBook.Borders.Item($xlInsideHorizontal).Weight = $xlThin
$WorkBook.Borders.Item($xlInsideVertical).Weight = $xlThin
$WorkBook.Borders.Item($xlInsideHorizontal).LineStyle = $xlContinuous
$WorkBook.Borders.Item($xlInsideVertical).LineStyle = $xlContinuous
$WorkBook.Borders.Item($xlEdgeLeft).LineStyle = $xlContinuous
$WorkBook.Borders.Item($xlEdgeBottom).LineStyle = $xlContinuous

$Sheet.Cells.Item(3, 1) = 'vCenters'
# For WT, SAC, Sydney DC

foreach ($vCenter in $DCs) {
	Connect-VIServer $vCenter -User Username -Password Password
		$Sheet.Cells.Item(3, $intcol) = $vCenter 
		$vhost = (Get-VMHost | measure)
		$Sheet.Cells.Item(4, $intcol) = $vhost.Count
		$VMs = (Get-VM | measure)
		$Sheet.Cells.Item(5, $intcol) = $VMs.Count
		$vTemplate = (Get-Template | measure)
		$Sheet.Cells.Item(6, $intcol) = $vTemplate.Count
		$vCluster = (Get-Cluster | measure)
		$Sheet.Cells.Item(7, $intcol) = $vCluster.Count
		$vDatastore = (Get-Datastore | measure)
		$Sheet.Cells.Item(8, $intcol) = $vDatastore.Count
		$ActiveVMs = (Get-VM | Where-Object { $_.PowerState -eq "PoweredOn" }| measure )
		$Sheet.Cells.Item(9, $intcol) = $ActiveVMs.Count
		$InactiveVMs = (Get-VM | Where-Object { $_.PowerState -eq "PoweredOff" }| measure )
		$Sheet.Cells.Item(10, $intcol) = $InactiveVMs.Count
	Disconnect-VIServer -Server $vCenter -Confirm:$false
$intcol = $intcol + 1 }

#For Carpathia Dallus, AMS

$DCs = ('vCenter1', 'vCenter2', 'vCenter3')
$intcol = 5
foreach ($vCenter in $DCs) {
#Variable
	Connect-VIServer $vCenter -User Username -Password 'Password'
		$Sheet.Cells.Item(3, $intcol) = $vCenter 
		$vhost = (Get-VMHost | measure)
		$Sheet.Cells.Item(4, $intcol) = $vhost.Count
		$VMs = (Get-VM | measure)
		$Sheet.Cells.Item(5, $intcol) = $VMs.Count
		$vTemplate = (Get-Template | measure)
		$Sheet.Cells.Item(6, $intcol) = $vTemplate.Count
		$vCluster = (Get-Cluster | measure)
		$Sheet.Cells.Item(7, $intcol) = $vCluster.Count
		$vDatastore = (Get-Datastore | measure)
		$Sheet.Cells.Item(8, $intcol) = $vDatastore.Count
		$ActiveVMs = (Get-VM | Where-Object { $_.PowerState -eq "PoweredOn" }| measure )
		$Sheet.Cells.Item(9, $intcol) = $ActiveVMs.Count
		$InactiveVMs = (Get-VM | Where-Object { $_.PowerState -eq "PoweredOff" }| measure )
		$Sheet.Cells.Item(10, $intcol) = $InactiveVMs.Count
	Disconnect-VIServer -Server $vCenter -Confirm:$false
$intcol = $intcol + 1 }

# Statically Providing the Vcenter Name
$Sheet.Cells.Item(3, 2) = 'DC1'
$Sheet.Cells.Item(3, 3) = 'DC2'
$Sheet.Cells.Item(3, 4) = 'DC3'
$Sheet.Cells.Item(3, 5) = 'DC4'
$Sheet.Cells.Item(3, 6) = 'DC5'
$Sheet.Cells.Item(3, 7) = 'DC6'
# Autofitting the Excel Sheet
$WorkBook.EntireColumn.AutoFit()
$WorkBook.Name = 'Inventory'

# Header for Chart

$Sheet.Cells.Item(18,1)= 'Graphical Representation'
$range = $Sheet.Range("a18","g20")
$range.Style = 'Title'
$range.Select()
$range.MergeCells = $true
$range.HorizontalAlignment = $xlCenter
$chart = $Sheet.Shapes.addChart().chart
$chart.hasTitle = $true
$chart.chartTitle.text = "VMware Capacity Chart"
$chartType = [Microsoft.Office.Interop.Excel.XlChartType]::xlBar
$chart.chartType = $chartType
$startCell + ", " + $endCell
$datarange = $Sheet.Range("A3:F10")
$chart.SetSourceData($datarange)
$chart.SeriesCollection().NewSeries.Invoke()
$Sheet.shapes.item("Chart 1").top=340
$Sheet.shapes.item("Chart 1").left=100
$Sheet.SaveAs($xlsfile)
$Excel.Close($xlsfile)
Stop-Process -Name "Excel"

[System.Runtime.InteropServices.Marshal]::ReleaseComObject([System.__ComObject]$Excel) | Out-Null

if ($xlsfile -ne ""){
    $SmtpClient = New-Object system.net.mail.smtpClient
    $SmtpClient.host = "m1smtp001.ops.saba"   #Change to a SMTP server in your environment
    $MailMessage = New-Object Net.mail.mailmessage
	$MailAttachment = New-Object Net.Mail.Attachment($xlsfile)
    $MailMessage.from = "System.Automation@example.com"   #Change to email address you want emails to be coming from
    $MailMessage.To.add("admin@example.com")    #Change to email address you would like to receive emails.
    $MailMessage.IsBodyHtml = 1
    $MailMessage.Subject = "VMware Capacity Report"
	$MailMessage.Attachments.Add($MailAttachment)
    $MailMessage.Body = "Please find the vCenter Capacity Report from ALL DCs"
    $SmtpClient.Send($MailMessage)}
else {
	$SmtpClient = New-Object system.net.mail.smtpClient
    $SmtpClient.host = "smtp001.example.com"   #Change to a SMTP server in your environment
    $MailMessage = New-Object system.net.mail.mailmessage
	$MailMessage.from = "System.Automation@example.com"
	$MailMessage.To.add("admin@example.com")    #Change to email address you would like to receive emails.
    $MailMessage.IsBodyHtml = 1
    $MailMessage.Subject = "VMware Capacity Report"
	$MailMessage.Body = "Report is not generated, Please verify"
    $SmtpClient.Send($MailMessage)}