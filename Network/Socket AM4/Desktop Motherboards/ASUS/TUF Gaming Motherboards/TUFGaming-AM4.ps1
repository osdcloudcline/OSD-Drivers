# Added commas between hashtable items
$NICDrivers = @(
    @{Name = "ASUS Socket AM4 TUF Gaming Motherboard Ethernet Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASUS/TUF%20Gaming%20Motherboards/TUFGaming-Intel-I255-I226-LANDrivers.zip"},
    @{Name = "ASUS Socket AM4 TUF Gaming Motherboard Ethernet Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASUS/TUF%20Gaming%20Motherboards/TUFGaming-Realtek1-LANDrivers.zip"},
    @{Name = "ASUS Socket AM4 TUF Gaming Motherboard Ethernet Network Card Drivers 3"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASUS/TUF%20Gaming%20Motherboards/TUFGaming-Realtek2-LANDrivers.zip"},
    @{Name = "ASUS Socket AM4 TUF Gaming Motherboard Ethernet Network Card Drivers 4"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASUS/TUF%20Gaming%20Motherboards/TUFGaming-Realtek3-LANDrivers.zip"}
   
)


$DriverFileNames = @(
    @{FileName = "TUFGaming-Intel-I255-I226-LANDrivers.zip"}, 
    @{FileName = "TUFGaming-Realtek1-LANDrivers.zipp"},
    @{FileName = "TUFGaming-Realtek2-LANDrivers.zip"},
    @{FileName = "TUFGaming-Realtek3-LANDrivers.zip"},
)

Import-Module -Name OSD -Force 
Import-Module -Name 7Zip4Powershell -Force

foreach($Driver in $NICDrivers){
    $destination = "C:\download\drivers\Socket AM4\ASUS\TUF Gaming\Ethernet"
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Write-Host
    # Use Save-WebFile (from OSD module) or Invoke-WebRequest
       Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    Write-Host "Completed: $($Driver.Name) download`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $parentdir = "C:\download\drivers\Socket AM4\ASUS\TUF Gaming\Ethernet"
    
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
