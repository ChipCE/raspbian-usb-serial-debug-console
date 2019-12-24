# Raspbian USB-UART debug console
Debug console for Raspberry using USB-serial----serial-USB adapter(null modem adapter)
This program enable serial console interface for raspberry using USB-serial connection instead of using GPIO rx-tx header.

## Install
- Connect USB-serial adapter to Raspberry USB port.
- Run <code>bash config.sh</code> and enter USB-serial adapter vendor Id and product Id.
- Run <code>sudo bash install.sh</code>

## Null modem adapter wiring

5V -nc- 5V
RX --- TX
TX --- RX
GND --- GND