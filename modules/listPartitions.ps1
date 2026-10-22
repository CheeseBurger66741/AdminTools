using namespace System.Management.Automation

[CmdletBinding()]
param(
  [Switch][Alias("PassThru")]$EmitObject = $false
)

# List partitions and sort them by disk number and partition number
$PartitionList = Get-Partition | Sort-Object -Property DiskNumber, PartitionNumber

# Index partitions
$i = 0
$PartitionList | ForEach-Object {
  $i++
  $PSItem | Add-Member -NotePropertyName Index -NotePropertyValue $i
}

# Produce output
$OutputCmdletParams = @{
  Property = "Index", "DiskNumber", "PartitionNumber", "Size", "AccessPaths"
}
if ($EmitObject) {
  $PartitionList | Select-Object @OutputCmdletParams
} else {
  $PartitionList | Format-Table @OutputCmdletParams -AutoSize
}

# === Logging ===
$logPath = "..\logs"

# Create log folder if missing
if (-not (Test-Path $logPath)) {
    New-Item -ItemType Directory -Path $logPath | Out-Null
}

# Log file name based on module
$moduleName = $MyInvocation.MyCommand.Name
$logFile = Join-Path $logPath ($moduleName + ".log")

# Write log entry
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$entry = "$timestamp - Ran module: $moduleName - User: $env:USERNAME"

Add-Content -Path $logFile -Value $entry
