# Define the AMD Chipsets Software using Hash Tables @{ }
$AMDChipsets = @(
   @{ Name = "AMD Ryzen Chipset Drivers"; ID = "amd-ryzen-chipset" }
   
)

# Process Choco Items
foreach ($App in $AMDChipsets) {
    Write-Host "`nProcessing install for: $($App.Name)" -ForegroundColor Cyan
    Write-Host
    choco install --id $($App.ID) -y
    Write-Host
}
