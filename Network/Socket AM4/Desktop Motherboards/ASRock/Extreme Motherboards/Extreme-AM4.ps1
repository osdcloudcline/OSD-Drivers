$NICDrivers = @(
    # Added '@' before the curly brace to properly define the hashtable
    @{Name = "ASRock Socket AM4 Extreme Motherboard Intel Ethernet Network Card Drivers"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Extreme%20Motherboards/ASRock-Extreme-Intel-NetworkDrivers.zip"}
)

$DriverFileNames = @(
@{FileName = "ASRock-Extreme-Intel-NetworkDrivers.zip")
)

Import-Module -Name OSD -Force
Import-Module -Name 7Zip4Powershell -Force

foreach($Driver in $NICDrivers){
    $destination = "C:\download\drivers\Socket AM4\ASRock\Extreme\Ethernet"
    
    # Added the missing closing double-quote after $($Driver.Name)
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    Write-Host
    # Note: Save-WebFile requires the OSD module to be installed/imported
    Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    
    Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}


foreach($FileName in $DriverFileNames){
    $expanddir = "C:\download\drivers\Socket AM4\ASRock\Extreme\Ethernet\extract"
    Write-Host "`nProcessing: $($Driver.Name) extraction" -ForegroundColor Cyan
    Write-Host
    Expand-7Zip -ArchiveFileName "$destination\$($FileName.FileName)"  -TargetPath $expanddir

    Write-Host "Completed: $($FileName.FileName) extracted`n" -ForegroundColor Green
    }
