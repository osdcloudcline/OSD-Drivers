$NICDrivers = @ (
@{Name = "ASRock Socket AM4 PRO Motherboard Ethernet Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/PRO%20Motherboards/ASRock-PRO-Intel-LANDrivers.zip"},
@{Name = "ASRock Socket AM4 PRO Motherboard Ethernet Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/PRO%20Motherboards/ASRock-PRO-Realtek-LANDrivers1.zip"},
@{Name = "ASRock Socket AM4 PRO Motherboard Ethernet Network Card Drivers 3"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/PRO%20Motherboards/ASRock-PRO-Realtek-LANDrivers2.zip"},
@{Name = "ASRock Socket AM4 PRO Motherboard Ethernet Network Card Drivers 4"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/PRO%20Motherboards/ASRock-PRO-Realtek-LANDrivers3.zip"},
@{Name = "ASRock Socket AM4 PRO Motherboard Ethernet Network Card Drivers 5"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/PRO%20Motherboards/ASRock-PRO-Realtek-LANDrivers4.zip"}
)

$DriverFileNames = @(
    @{FileName = "ASRock-PRO-Intel-LANDrivers.zip"}, 
    @{FileName = "ASRock-PRO-Realtek-LANDrivers1.zip"},
    @{FileName = "ASRock-PRO-Realtek-LANDrivers2.zip"},
    @{FileName = "ASRock-PRO-Realtek-LANDrivers3.zip"},
    @{FileName = "ASRock-PRO-Realtek-LANDrivers4.zip"}
)

Import-Module -Name OSD -Force
foreach($Driver in $NICDrivers){
$destination = "C:\download\drivers\Socket AM4\ASRock\PRO\Ethernet"
Write-Host "`nProcessing: $($Driver.Name) -ForegroundColor Cyan
Write-Host
  Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
Write-Host "Completed: $($Driver.Name) download`n" -ForegroundColor Green
}
