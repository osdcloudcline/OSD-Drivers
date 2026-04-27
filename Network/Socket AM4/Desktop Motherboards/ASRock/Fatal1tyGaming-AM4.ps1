$NICDrivers = @ (
{Name = "ASRock Fatal1ty Gaming Motherboard Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Fatal1ty%20Gaming%20Motherboards/ASRock-Fatal1tyGaming-Realtek-LANDrivers1.zip"}
{Name = "ASRock Fatal1ty Gaming Motherboard Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Fatal1ty%20Gaming%20Motherboards/ASRock-Fatal1tyGaming-Realtek-LANDrivers2.zip"}
)

foreach($DriverFileName in $NICDrivers){
$destination = "C:\download\drivers\Socket AM4\ASRock\Fatal1ty Gaming\Ethernet"
Write-Host "`nProcessing: $($Driver.Name) -ForegroundColor Cyan
  Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
Write-Host "Completed: $($Driver.Name) download`n" -ForegroundColor Green
}
