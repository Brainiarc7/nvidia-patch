# nvidia-patch

Binary patch for Nvidia Linux Display Driver which removes NVENC parallel sessions restriction and allows to have more than two simultaneous NVENC encoding processes. NVENC is a hardware H.264/H.265 encoder, see docs for details.

## Usage

```
user@host:~/nvidia-patch# ./patch.sh 
Usage: ./patch.sh <path to original libnvidia-encode.so.xxx.yy> <destination for patched libnvidia-encode.so.xxx.yy>
```

## Steps:

```

mkdir ~/nvenc_backup

cd ~/nvenc_backup

cp /usr/lib/nvidia-390/libnvidia-encode.so.390.30 ~/nvenc_backup/

wget https://raw.githubusercontent.com/Brainiarc7/nvidia-patch/master/patch.sh

chmod +x patch.sh

./patch.sh ~/nvenc_backup/libnvidia-encode.so.390.30 /usr/lib/nvidia-390/libnvidia-encode.so.390.30

sudo systemctl reboot

```

## See also

If you experience `CreateBitstreamBuffer failed: out of memory (10)`, then you have to lower buffers number used for every encoding session. If you are using `ffmpeg`, consider using this [patch](https://gist.github.com/Snawoot/70ae403716c698cb86ab015626d72bd4).
