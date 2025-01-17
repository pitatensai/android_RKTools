#!/bin/bash
pause()
{
echo "Press any key to quit:"
read -n1 -s key
exit 1
}
echo "start to unpack update.img..."
if [ ! -d "output" ]; then
	mkdir output
fi
if [ ! -f "update.img" ]; then
	echo "Error:No found update.img!"
	pause
fi
PLATFORM=linux
if [ "$(uname)" == "Darwin" ]; then
	PLATFORM=mac
fi
./${PLATFORM}/rkImageMaker -unpack update.img output || pause
./${PLATFORM}/afptool -unpack output/firmware.img output || pause
rm -f output/firmware.img
rm -f output/boot.bin
echo "Unpacking update.img OK."
echo "Press any key to quit:"
read -n1 -s key
exit 0