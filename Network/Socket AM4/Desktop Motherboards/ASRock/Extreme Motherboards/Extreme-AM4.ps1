$NICDrivers = @(
    # Added '@' before the curly brace to properly define the hashtable
    @{Name = "ASRock Socket AM4 Extreme Motherboard Intel Network Card Drivers"; DriverFileURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Network/Socket%20AM4/Desktop%20Motherboards/ASRock/Extreme%20Motherboards/ASRock-Extreme-Intel-NetworkDrivers.zip"}
)

Import-Module -Name OSD -Force

foreach($Driver in $NICDrivers){
    $destination = "C:\download\drivers\Socket AM4\ASRock\Extreme\Ethernet"
    
    # Added the missing closing double-quote after $($Driver.Name)
    Write-Host "`nProcessing: $($Driver.Name)" -ForegroundColor Cyan
    
    # Note: Save-WebFile requires the OSD module to be installed/imported
    Save-WebFile -SourceUrL $($Driver.DriverFileURL) -DestinationDirectory $destination
    
    Write-Host "Completed: $($Driver.Name) downloaded`n" -ForegroundColor Green
}
