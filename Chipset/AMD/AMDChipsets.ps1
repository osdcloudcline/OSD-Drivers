# Define the AMD Chipsets Software using Hash Tables @{ }
$AMDChipsets = @(
   @{ Name = "AMD Ryzen Chipset Drivers"; ID = "amd-ryzen-chipset" },
   @{ Name = "AMD Ryzen Master Utility"; ID = "amd-ryzen-master" },
   @{ Name = "AMD Software Adrenalin Edition 26.3.1"; ID = "amd-software-adrenalin-edition" }
   
)

# Process Choco Items
foreach ($App in $AMDChipsets) {
    Write-Host "`nProcessing install for: $($App.Name)" -ForegroundColor Cyan
    Write-Host
    choco install --id $($App.ID) -y
    Write-Host
    Write-Host "Completed: $($App.Name) install" -ForegroundColor Green
}
