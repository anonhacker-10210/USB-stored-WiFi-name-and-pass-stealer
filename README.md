# USB Wi-Fi Password Extractor

This repository contains a PowerShell script and associated files to automatically extract Wi-Fi passwords from a Windows system and save them to a hidden directory on a USB drive. The script is designed to run silently when the USB drive is inserted into a Windows 10/11 machine.

**Disclaimer:** This tool is for educational and authorized testing purposes only. Unauthorized use is illegal and unethical. Always ensure you have explicit permission before using this tool on any system.

---

## Features
- Automatically extracts Wi-Fi names and passwords from the target system.
- Saves the data to a hidden directory (`_usb`) on the USB drive.
- Runs silently without displaying any output or errors.
- Compatible with Windows 10 and Windows 11.

---

## How It Works
1. When the USB drive is inserted, the `autorun.inf` file triggers the `autorun.vbs` script.
2. The `autorun.vbs` script runs the `wifi_extractor.ps1` PowerShell script in a hidden window.
3. The PowerShell script:
   - Creates a hidden directory (`_usb`) on the USB drive.
   - Extracts Wi-Fi profiles and passwords using the `netsh` command.
   - Saves the data to a file (`wifi_passwords.txt`) in the hidden directory.

---

## Files in the Repository
- `autorun.inf`: Autorun configuration file to trigger the script.
- `autorun.vbs`: VBScript to run the PowerShell script silently.
- `wifi_extractor.ps1`: PowerShell script to extract Wi-Fi passwords.
- `README.md`: This file.

---

## Setup Instructions

### 1. Prepare the USB Drive
- Format the USB drive (if necessary) and ensure it is empty.
- Copy the following files to the **root of the USB drive**:
  - `autorun.inf`
  - `autorun.vbs`
  - `wifi_extractor.ps1`

### 2. Insert the USB Drive
- Insert the USB drive into a Windows 10/11 machine.
- The script will run automatically and save the Wi-Fi passwords to a hidden directory (`_usb`) on the USB drive.

### 3. Retrieve the Data
- After the script runs, safely eject the USB drive.
- On another system, open the USB drive and navigate to the hidden `_usb` directory to view the `wifi_passwords.txt` file.
---

## File Structure

USB Drive (E:)

│

├── autorun.inf

├── autorun.vbs

├── wifi_extractor.ps1

└── _usb (hidden) ──> wifi_passwords.txt

---

## Ethical Use
This tool is intended for **educational purposes** and **authorized penetration testing**. Unauthorized use is illegal and unethical. Always ensure you have explicit permission before using this tool on any system.

---

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contributing
Contributions are welcome! If you have suggestions or improvements, please open an issue or submit a pull request.

---

## Author
anonhacker-10210  
https://github.com/anonhacker-10210 

---

## Acknowledgments
- Inspired by various Wi-Fi password extraction techniques.
- Thanks to the open-source community for tools and resources.
