$NICDrivers = @ (
@{Name = "ASRock Socket AM4 Steel Legend Motherboard Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Steel%20Legend%20Motherboards/ASRock-SteelLegend-Intel-LANDrivers.zip"},
@{Name = "ASRock Socket AM4 Steel Legend Motherboard Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Steel%20Legend%20Motherboards/ASRock-SteelLegend-Realtek-LANDrivers1.zip"},
@{Name = "ASRock Socket AM4 Steel Legend Motherboard Network Card Drivers 3"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Steel%20Legend%20Motherboards/ASRock-SteelLegend-Realtek-LANDrivers2.zip"},
@{Name = "ASRock Socket AM4 Steel Legend Motherboard Network Card Drivers 4"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Steel%20Legend%20Motherboards/ASRock-SteelLegend-Realtek-LANDrivers3.zip"}
)

Import-Module -Name OSD -Force

foreach($Driver in $NICDrivers){
$destination = "C:\download\drivers\Socket AM4\ASRock\Steel Legend\Ethernet"
Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
Write-Host
  Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}
