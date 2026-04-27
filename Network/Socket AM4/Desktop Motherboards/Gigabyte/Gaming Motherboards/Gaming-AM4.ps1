# Added commas between hashtable items
$NICDrivers = @(
    @{Name = "Gigabyte Socket AM4 Gaming Motherboard Ethernet Network Card Drivers 1 - B350 "; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/Gigabyte/Gaming%20Motherboards/Gigabyte-Gaming-EthernetDrivers-B350-Win10.zip"},
    @{Name = "Gigabyte Socket AM4 Gaming Motherboard Ethernet Network Card Drivers 2 - B450"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/Gigabyte/Gaming%20Motherboards/Gigabyte-Gaming-EthernetDrivers-B450-Win10.zip"},
    @{Name = "Gigabyte Socket AM4 Gaming Motherboard Ethernet Network Card Drivers 3 - B450"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/Gigabyte/Gaming%20Motherboards/Gigabyte-Gaming-EthernetDrivers-B450-Win11.zip"},
    @{Name = "Gigabyte Socket AM4 Gaming Motherboard Ethernet Network Card Drivers 4 - B550"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/Gigabyte/Gaming%20Motherboards/Gigabyte-Gaming-EthernetDrivers-B550-Win10.zip"},
    @{Name = "Gigabyte Socket AM4 Gaming Motherboard Ethernet Network Card Drivers 5 - B550"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/Gigabyte/Gaming%20Motherboards/Gigabyte-Gaming-EthernetDrivers-B550-Win11.zip"},
    @{Name = "Gigabyte Socket AM4 Gaming Motherboard Ethernet Network Card Drivers 6 - X370"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/Gigabyte/Gaming%20Motherboards/Gigabyte-Gaming-EthernetDrivers-X370-Win10-Killer.zip"},
    @{Name = "Gigabyte Socket AM4 Gaming Motherboard Ethernet Network Card Drivers 7 - X370"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/Gigabyte/Gaming%20Motherboards/Gigabyte-Gaming-EthernetDrivers-X370-Win10.zip"},
    @{Name = "Gigabyte Socket AM4 Gaming Motherboard Ethernet Network Card Drivers 8 - X570"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/Gigabyte/Gaming%20Motherboards/Gigabyte-Gaming-EthernetDrivers-X570-Win10.zip"},
    @{Name = "Gigabyte Socket AM4 Gaming Motherboard Ethernet Network Card Drivers 9 - X570"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/Gigabyte/Gaming%20Motherboards/Gigabyte-Gaming-EthernetDrivers-X570-Win11.zip"}

)


$DriverFileNames = @(
    @{FileName = "Gigabyte-Gaming-EthernetDrivers-B350-Win10.zip"}, 
    @{FileName = "Gigabyte-Gaming-EthernetDrivers-B450-Win10.zip"},
    @{FileName = "Gigabyte-Gaming-EthernetDrivers-B450-Win11.zip"},
    @{FileName = "Gigabyte-Gaming-EthernetDrivers-B550-Win10.zip"},
    @{FileName = "Gigabyte-Gaming-EthernetDrivers-B550-Win11.zip"},
    @{FileName = "Gigabyte-Gaming-EthernetDrivers-X370-Win10-Killer.zip"}, 
    @{FileName = "Gigabyte-Gaming-EthernetDrivers-X370-Win10.zip"},
    @{FileName = "Gigabyte-Gaming-EthernetDrivers-X570-Win10.zip"},
    @{FileName = "Gigabyte-Gaming-EthernetDrivers-X570-Win11.zip"}
  
)

Import-Module -Name OSD -Force 
Import-Module -Name 7Zip4Powershell -Force

foreach($Driver in $NICDrivers){
    $destination = "C:\download\drivers\Socket AM4\Gigabyte\Gaming\Ethernet"
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Write-Host
    # Use Save-WebFile (from OSD module) or Invoke-WebRequest
       Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    Write-Host "Completed: $($Driver.Name) download`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $parentdir = "C:\download\drivers\Socket AM4\Gigabyte\Gaming\Ethernet"
    
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
