# nvidia-patch

Binary patch for Nvidia Linux Display Driver which removes NVENC parallel sessions restriction and allows to have more than two simultaneous NVENC encoding processes. NVENC is a hardware H.264/H.265 encoder, see docs for details.

## Usage

```
user@host:~/nvidia-patch# ./patch.sh 
Usage: ./patch.sh <path to original libnvidia-encode.so.xxx.yy> <destination for patched libnvidia-encode.so.xxx.yy>
```

## See also

If you experience `CreateBitstreamBuffer failed: out of memory (10)`, then you have to lower buffers number used for every encoding session. If you are using `ffmpeg`, consider using this [patch](https://gist.github.com/Snawoot/70ae403716c698cb86ab015626d72bd4).
