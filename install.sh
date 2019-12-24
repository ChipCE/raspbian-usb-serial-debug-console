#!/bin/bash
echo "Raspberry serial debug interface installer v1.0"

# root check
FILE="/tmp/out.$$"
GREP="/bin/grep"

# Make sure only root can run this script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root! command：sudo ./install.sh" 1>&2
   exit 1
fi

echo "Setting udev rule for fixed USB uart device name (ttyDebugConsole)..."
yes |cp 99-usb-serial.rules.conf /etc/udev/rules.d/99-usb-serial.rules
echo "Making systemd service for USB debug console interface..."
yes | cp serial-getty@ttyDebugConsole.service /etc/systemd/system/serial-getty@ttyDebugConsole.service
echo "Enabling udev rule..."
udevadm trigger
echo "Enabling USB debug console service..."
systemctl daemon-reload
systemctl enable serial-getty@ttyDebugConsole.service
systemctl start serial-getty@ttyDebugConsole.service
systemctl status serial-getty@ttyDebugConsole.service
echo "Done!"