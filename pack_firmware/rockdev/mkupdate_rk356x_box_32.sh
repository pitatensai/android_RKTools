#!/bin/bash
pause() {
	echo "Press any key to quit:"
	read -n1 -s key
	exit 1
}
echo "start to make update.img..."
if [ ! -f "Image/parameter.txt" ]; then
	echo "Error:No found parameter!"
#	pause
fi
if [ ! -f "package-file-rk356x" ]; then
	echo "Error:No found package-file!"
#	pause
fi
PLATFORM=linux
if [ "$(uname)" == "Darwin" ]; then
	PLATFORM=mac
fi
./${PLATFORM}/afptool -pack ./ Image/update.img ./package-file-rk356x-box || pause
./${PLATFORM}/rkImageMaker -RK3568 Image/MiniLoaderAll.bin Image/update.img update.img -os_type:androidos || pause
echo "Making update.img OK."
#echo "Press any key to quit:"
#read -n1 -s key
exit 0
