#!/bin/bash
pause()
{
echo "Press any key to quit:"
read -n1 -s key
exit 1
}
echo "start to make update.img..."
if [ ! -f "Image/parameter" -a ! -f "Image/parameter.txt" ]; then
	echo "Error:No found parameter!"
	exit 1
fi
if [ ! -f "package-file-box" ]; then
	echo "Error:No found package-file-box!"
	exit 1
fi
PLATFORM=linux
if [ "$(uname)" == "Darwin" ]; then
	PLATFORM=mac
fi
./${PLATFORM}/afptool -pack ./ Image/update.img ./package-file-box || pause
./${PLATFORM}/rkImageMaker -RK322H Image/MiniLoaderAll.bin Image/update.img update.img -os_type:androidos || pause
echo "Making update.img OK."
#echo "Press any key to quit:"
#read -n1 -s key
exit $?
