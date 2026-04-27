# Added commas between hashtable items
$NICDrivers = @(
    @{Name = "ASRock Socket AM4 Fatal1ty Gaming Motherboard Ethernet Network Card Drivers 1"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Fatal1ty%20Gaming%20Motherboards/ASRock-Fatal1tyGaming-Realtek-LANDrivers1.zip"},
    @{Name = "ASRock Socket AM4 Fatal1ty Gaming Motherboard Ethernet Network Card Drivers 2"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Fatal1ty%20Gaming%20Motherboards/ASRock-Fatal1tyGaming-Realtek-LANDrivers2.zip"}
)


$DriverFileNames = @(
    @{FileName = "ASRock Socket AM4 Fatal1ty Gaming Motherboard Ethernet Network Card Drivers 1 - ASRock-Fatal1tyGaming-Realtek-LANDrivers1.zip"}, 
    @{FileName = "ASRock Socket AM4 Fatal1ty Gaming Motherboard Ethernet Network Card Drivers 2 - ASRock-Fatal1tyGaming-Realtek-LANDrivers2.zip"}
)

Import-Module -Name OSD -Force 
Import-Module -Name 7Zip4Powershell -Force

foreach($Driver in $NICDrivers){
    $destination = "C:\download\drivers\Socket AM4\ASRock\Fatal1ty Gaming\Ethernet"
    
    # Ensure the directory exists before downloading
    if (!(Test-Path $destinationDir)) { New-Item -ItemType Directory -Path $destinationDir -Force }

    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Write-Host
    # Use Save-WebFile (from OSD module) or Invoke-WebRequest
       Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    Write-Host "Completed: $($Driver.Name) download`n" -ForegroundColor Green
}

foreach($FileItem in $DriverFileNames){
    $parentdir = "C:\download\drivers\Socket AM4\ASRock\Fatal1ty Gaming\Ethernet"
    
    # Construct the full path to the ZIP file
    $zipPath = Join-Path -Path $parentdir -ChildPath $FileItem.FileName
    
    # Extract to a subfolder named after the ZIP (prevents file mixing)
    $extractPath = Join-Path -Path $parentdir -ChildPath ([System.IO.Path]::GetFileNameWithoutExtension($FileItem.FileName))

    if (Test-Path -Path $zipPath) {
        Write-Host "Processing: $($FileItem.FileName) extraction" -ForegroundColor Cyan
        
        # Ensure extraction folder exists
        if (!(Test-Path $extractPath)) { New-Item -ItemType Directory -Path $extractPath -Force | Out-Null }

        # Extract using 7Zip4Powershell
        Expand-7Zip -ArchiveFileName $zipPath -TargetPath $extractPath
        
        Write-Host "Completed: $($FileItem.FileName) extracted to $extractPath`n" -ForegroundColor Green
    } else {
        Write-Warning "File not found: $zipPath"
    }
}
