$NICDrivers = @ (
{Name = "ASRock Extreme Motherboard Intel Network Card Drivers"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Extreme%20Motherboards/ASRock-Extreme-Intel-NetworkDrivers.zip"}

)

foreach($Driver in $NICDrivers){
$destination = "C:\download\drivers\Socket AM4\ASRock\Extreme\Ethernet"
Write-Host "`nProcessing: $($Driver.Name) -ForegroundColor Cyan
  Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
Write-Host "Completed: $($Driver.Name) download`n" -ForegroundColor Green
}
