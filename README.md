# Ventuno Q camera setup

Camera capture on the Arduino Ventuno Q (Ubuntu 24.04) with two IMX219 cameras (Arducam 8MP). Part of my humanoid robot build.

## How the cameras work on this board

The Ventuno Q uses Qualcomm's camera stack, not libcamera. Capture goes through the GStreamer plugin `qtiqmmfsrc`.

Connect cameras with the power off. They must be plugged in when the board boots. To confirm they were detected:

```
sudo dmesg | grep -i "probe success"
```

Each working camera shows a line like `Probe success for rpi_imx219`.

## Taking a picture

```
chmod +x capture.sh
./capture.sh 0 myphoto
```

The first argument is the camera number (0 or 1). The second is the file name. The picture is saved to `~/Pictures` at 1280x720.

## Stereo pair

Capture from both cameras, then join the pictures side by side:

```
sudo apt install imagemagick
convert left.jpg right.jpg +append stereo-pair.jpg
```

## Notes

- Tested November 2026.
- Warnings about MESA-LOADER at startup are harmless.
