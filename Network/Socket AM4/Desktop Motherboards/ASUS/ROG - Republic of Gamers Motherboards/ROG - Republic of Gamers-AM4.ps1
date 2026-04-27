# Added commas between hashtable items
$NICDrivers = @(
    @{Name = "ASUS Socket AM4 ROG - Republic of Gamers Motherboard Ethernet Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASUS/ROG%20-%20Republic%20of%20Gamers%20Motherboards/ROG-Intel-i211-LANDrivers.zip"},
    @{Name = "ASUS Socket AM4 ROG - Republic of Gamers Motherboard Ethernet Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASUS/ROG%20-%20Republic%20of%20Gamers%20Motherboards/ROG-Intel-i225-LANDrivers.zip"},
    @{Name = "ASUS Socket AM4 ROG - Republic of Gamers Motherboard Ethernet Network Card Drivers 3"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASUS/ROG%20-%20Republic%20of%20Gamers%20Motherboards/ROG-Intel-i225-i226-LANDrivers.zip"},
    @{Name = "ASUS Socket AM4 ROG - Republic of Gamers Motherboard Ethernet Network Card Drivers 4"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASUS/ROG%20-%20Republic%20of%20Gamers%20Motherboards/ROG-Realtek1-LANDrivers.zip"},
    @{Name = "ASUS Socket AM4 ROG - Republic of Gamers Motherboard Ethernet Network Card Drivers 5"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASUS/ROG%20-%20Republic%20of%20Gamers%20Motherboards/ROG-Realtek2-LANDrivers.zip"}
)


$DriverFileNames = @(
    @{FileName = "ROG-Intel-i211-LANDrivers.zip"}, 
    @{FileName = "ROG-Intel-i225-LANDrivers.zip"},
    @{FileName = "ROG-Intel-i225-i226-LANDrivers.zip"},
    @{FileName = "ROG-Realtek1-LANDrivers.zip"},
    @{FileName = "ROG-Realtek2-LANDrivers.zip"}
)

Import-Module -Name OSD -Force 
Import-Module -Name 7Zip4Powershell -Force

foreach($Driver in $NICDrivers){
    $destination = "C:\download\drivers\Socket AM4\ASUS\ROG - Republic of Gamers\Ethernet"
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Write-Host
    # Use Save-WebFile (from OSD module) or Invoke-WebRequest
       Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    Write-Host "Completed: $($Driver.Name) download`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $parentdir = "C:\download\drivers\Socket AM4\ASUS\ROG - Republic of Gamers\Ethernet"
    
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
