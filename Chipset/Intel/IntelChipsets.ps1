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
