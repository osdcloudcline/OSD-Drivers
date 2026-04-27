$NICDrivers = @ (
{Name = "ASRock Socket AM4 Phantom Gaming Motherboard Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Phantom%20Gaming%20Motherboards/ASRock-PhantomGaming-Intel-LANDrivers1.zip"}
{Name = "ASRock Socket AM4 Phantom Gaming Motherboard Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Phantom%20Gaming%20Motherboards/ASRock-PhantomGaming-Intel-LANDrivers2.zip"}
{Name = "ASRock Socket AM4 Phantom Gaming Motherboard Network Card Drivers 3"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Phantom%20Gaming%20Motherboards/ASRock-PhantomGaming-Realtek-LANDriver1.zip"}
{Name = "ASRock Socket AM4 Phantom Gaming Motherboard Network Card Drivers 4"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Phantom%20Gaming%20Motherboards/ASRock-PhantomGaming-Realtek-LANDriver2.zip"}
{Name = "ASRock Socket AM4 Phantom Gaming Motherboard Network Card Drivers 5"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Phantom%20Gaming%20Motherboards/ASRock-PhantomGaming-Realtek-LANDrivers3.zip"}
)

foreach($Driver in $NICDrivers){
$destination = "C:\download\drivers\Socket AM4\ASRock\Phantom Gaming\Ethernet"
Write-Host "`nProcessing: $($Driver.Name) -ForegroundColor Cyan
  Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
Write-Host "Completed: $($Driver.Name) download`n" -ForegroundColor Green
}
