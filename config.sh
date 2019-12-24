#!/bin/bash
echo "Raspberry serial debug interface installer config tool v1.0"

VENDOR_ID=""
PRODUCT_ID=""

echo "Listing USB devices..."
lsusb
echo ""

read -p "Enter target device Vendor_ID : " VENDOR_ID
while [[ "$VENDOR_ID" == "" ]]
do
    echo "Error : invalid Vendor_ID! $VENDOR_ID"
    read -p "Enter target device Vendor_ID : " VENDOR_ID
done

echo ""

read -p "Enter target device Product_ID : " PRODUCT_ID
while [[ "$PRODUCT_ID" == "" ]]
do
    echo "Error : invalid Product_ID! $PRODUCT_ID"
    read -p "Enter target device Product_ID : " PRODUCT_ID
done

echo ""
echo "Making config profile for $VENDOR_ID:$PRODUCT_ID..."


yes | cp -vrf 99-usb-serial.rules.template 99-usb-serial.rules.conf
sed -i 's,'"@#VENDOR_ID"','"$VENDOR_ID"',' 99-usb-serial.rules.conf
sed -i 's,'"@#PRODUCT_ID"','"$PRODUCT_ID"',' 99-usb-serial.rules.conf
cat 99-usb-serial.rules.conf
echo ""

echo "Config completed! Run sudo ./install.sh to install Serial-USB debug console interface"