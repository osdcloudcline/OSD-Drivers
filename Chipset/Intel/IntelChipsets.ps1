# Define the Intel Chipsets Software using Hash Tables @{ }
$IntelChipsets = @(
   @{ Name = "CPUID ROG CPU-Z"; ID = "CPUID.CPU-Z.ROG" },
   @{ Name = "Intel Extreme Tuning Utility"; ID = "Intel.IntelExtremeTuningUtility" }, 
   @{ Name = "Intel Driver and Support Assistant"; ID = "Intel.IntelDriverAndSupportAssistant" },
   @{ Name = "Intel Processor Diagnostics Tool"; ID = "Intel.ProcessorDiagnosticTool" }, 
   @{ Name = "Intel Processor Identification Tool"; ID = "Intel.ProcessorIdentificationUtility" },
   @{ Name = "Intel System Support Utility"; ID = "Intel.SystemSupportUtility" }
)

# Process WinGet Items
foreach ($App in $IntelChipsets) {
    Write-Host "`nProcessing install for: $($App.Name)" -ForegroundColor Cyan
    
    # Use -ErrorAction SilentlyContinue if you want to handle failures gracefully
    winget install --id $($App.ID) --exact --silent --accept-package-agreements --accept-source-agreements --force --source winget
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Completed: $($App.Name) install" -ForegroundColor Green
    } else {
        Write-Host "Failed: $($App.Name) installation (Exit Code: $LASTEXITCODE)" -ForegroundColor Red
    }
}

Import-Module -Name OSD -Force

$IntelChipsetDownloads = @(
 @{Name = "Intel Chipset Setup Utility"; FileDownloadURL = "https://github.com/osdcloudcline/OSD-Drivers/raw/refs/heads/main/Chipset/Intel/SetupChipset.exe"}
 )
 

$destination = "C:\download\drivers\CPU\Intel"

foreach($FileItem in $IntelChipsetDownloads){
    Write-Host "`nProcessing: $($FileItem.Name)" -ForegroundColor Cyan
    Write-Host
    Save-WebFile -SourceUrL $($FileItem.FileDownloadURL) -DestinationDirectory $destination
    Write-Host "Completed: $($FileItem.Name) downloaded`n" -ForegroundColor Green
}
