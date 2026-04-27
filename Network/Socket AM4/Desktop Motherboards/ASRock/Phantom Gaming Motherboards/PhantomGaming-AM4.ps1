$NICDrivers = @ (
@{Name = "ASRock Socket AM4 Phantom Gaming Motherboard Ethernet Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Phantom%20Gaming%20Motherboards/ASRock-PhantomGaming-Intel-LANDrivers1.zip"},
@{Name = "ASRock Socket AM4 Phantom Gaming Motherboard Ethernet Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Phantom%20Gaming%20Motherboards/ASRock-PhantomGaming-Intel-LANDrivers2.zip"},
@{Name = "ASRock Socket AM4 Phantom Gaming Motherboard Ethernet Network Card Drivers 3"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Phantom%20Gaming%20Motherboards/ASRock-PhantomGaming-Realtek-LANDriver1.zip"},
@{Name = "ASRock Socket AM4 Phantom Gaming Motherboard Ethernet Network Card Drivers 4"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Phantom%20Gaming%20Motherboards/ASRock-PhantomGaming-Realtek-LANDriver2.zip"},
@{Name = "ASRock Socket AM4 Phantom Gaming Motherboard Ethernet Network Card Drivers 5"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Phantom%20Gaming%20Motherboards/ASRock-PhantomGaming-Realtek-LANDrivers3.zip"}
)

$DriverFileNames = @(
    @{FileName = "ASRock-PhantomGaming-Intel-LANDrivers1.zip"}, 
    @{FileName = "ASRock-PhantomGaming-Intel-LANDrivers2.zip"},
    @{FileName = "ASRock-PhantomGaming-Realtek-LANDriver1.zip"},
    @{FileName = "ASRock-PhantomGaming-Realtek-LANDriver2.zip"},
    @{FileName = "ASRock-PhantomGaming-Realtek-LANDrivers3.zip"}
)
Import-Module -Name OSD -Force

foreach($Driver in $NICDrivers){
$destination = "C:\download\drivers\Socket AM4\ASRock\Phantom Gaming\Ethernet"
Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
Write-Host
  Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}
