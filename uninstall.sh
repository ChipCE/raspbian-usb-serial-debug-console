#!/bin/bash
echo "Raspberry serial debug interface uninstaller v1.0"

# root check
FILE="/tmp/out.$$"
GREP="/bin/grep"

# Make sure only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root! command：sudo ./uninstall.sh" 1>&2
   exit 1
fi

echo "Removing udev rule for fixed USB uart device name (ttyDebugConsole)..."
rm /etc/udev/rules.d/99-usb-serial.rules
echo "Reload udev rule..."
udevadm trigger
echo "Removing systemd service for USB debug console interface..."
systemctl stop serial-getty@ttyDebugConsole.service
systemctl disable serial-getty@ttyDebugConsole.service
rm serial-getty@ttyDebugConsole.service /etc/systemd/system/serial-getty@ttyDebugConsole.service
echo "Done!"