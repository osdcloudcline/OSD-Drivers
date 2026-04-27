$NICDrivers = @ (
@{Name = "ASRock Socket AM4 Steel Legend Motherboard Ethernet Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Steel%20Legend%20Motherboards/ASRock-SteelLegend-Intel-LANDrivers.zip"},
@{Name = "ASRock Socket AM4 Steel Legend Motherboard Ethernet Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Steel%20Legend%20Motherboards/ASRock-SteelLegend-Realtek-LANDrivers1.zip"},
@{Name = "ASRock Socket AM4 Steel Legend Motherboard Ethernet Network Card Drivers 3"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Steel%20Legend%20Motherboards/ASRock-SteelLegend-Realtek-LANDrivers2.zip"},
@{Name = "ASRock Socket AM4 Steel Legend Motherboard Ethernet Network Card Drivers 4"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Steel%20Legend%20Motherboards/ASRock-SteelLegend-Realtek-LANDrivers3.zip"}
)

$DriverFileNames = @(
    @{FileName = "ASRock-SteelLegend-Intel-LANDrivers.zip"}, 
    @{FileName = "ASRock-SteelLegend-Realtek-LANDrivers1.zip"},
    @{FileName = "ASRock-SteelLegend-Realtek-LANDrivers2.zip"},
    @{FileName = "ASRock-SteelLegend-Realtek-LANDrivers3.zip"}
)

Import-Module -Name OSD -Force
Import-Module -Name 7Zip4Powershell -Force

foreach($Driver in $NICDrivers){
$destination = "C:\download\drivers\Socket AM4\ASRock\Steel Legend\Ethernet"
Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
Write-Host
  Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $parentdir = "C:\download\drivers\Socket AM4\ASRock\Steel Legend\Ethernet"
    
    # Construct the full path to the ZIP file
    $zipPath = Join-Path -Path $parentdir -ChildPath $FileItem.FileName
    
    # Extract to a subfolder named after the ZIP (prevents file mixing)
    $extractPath = Join-Path -Path $parentdir -ChildPath ([System.IO.Path]::GetFileNameWithoutExtension($zipPath))

    if (Test-Path -Path $zipPath) {
        Write-Host "Processing: $($FileItem.FileName) extraction" -ForegroundColor Cyan
        
        # Extract using 7Zip4Powershell
        Expand-7Zip -ArchiveFileName $zipPath -TargetPath $extractPath
        
        Write-Host "Completed: $($FileItem.FileName) extracted to $extractPath`n" -ForegroundColor Green
    } else {
        Write-Warning "File not found: $zipPath"
    }
}
