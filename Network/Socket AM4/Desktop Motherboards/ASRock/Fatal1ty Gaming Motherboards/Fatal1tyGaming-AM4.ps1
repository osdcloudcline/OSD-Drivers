# Added commas between hashtable items
$NICDrivers = @(
    @{Name = "ASRock Socket AM4 Fatal1ty Gaming Motherboard Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Fatal1ty%20Gaming%20Motherboards/ASRock-Fatal1tyGaming-Realtek-LANDrivers1.zip"},
    @{Name = "ASRock Socket AM4 Fatal1ty Gaming Motherboard Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Fatal1ty%20Gaming%20Motherboards/ASRock-Fatal1tyGaming-Realtek-LANDrivers2.zip"}
)

Import-Module -Name OSD -Force 

foreach($Driver in $NICDrivers){
    $destinationDir = "C:\download\drivers\Socket AM4\ASRock\Fatal1ty Gaming\Ethernet"
    
    # Ensure the directory exists before downloading
    if (!(Test-Path $destinationDir)) { New-Item -ItemType Directory -Path $destinationDir -Force }

    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    
    # Use Save-WebFile (from OSD module) or Invoke-WebRequest
    $fileName = Split-Path $Driver.DriverFileURL -Leaf
    $destFile = Join-Path $destinationDir $fileName
    
    Invoke-WebRequest -Uri $Driver.DriverFileURL -OutFile $destFile
    
    Write-Host "Completed: $($Driver.Name) download`n" -ForegroundColor Green
}
