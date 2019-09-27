# fingerprint score server

```
git clone https://github.com/usnistgov/NFIQ2.git
wget http://www.cmake.org/files/v2.8/cmake-2.8.8.tar.gz
docker pull gcc:6.5.0
```

# Misc
- Do `mspaint.exe input.png` and `save-as` input256bit.bmp because `NFIQ2` prefers this format (graycale).
- throw NFIQ::NFIQException(NFIQ::e_Error_FeatureCalculationError, "Only 500 dpi fingerprint images are supported!");

# Current Bugs in NFIQ2
[This](https://github.com/usnistgov/NFIQ2/issues/29) current bug in NFIQ2 BMP type is nasty. 
I did `convert 86_1.png -colorspace Gray -compress None -depth 8 BMP2:image.bmp` and feed this into `NFIQ2`
and finally a valid score is given 

https://asciinema.org/a/ZwkRdytjUJFiC4tOvubN5Nlrn

# Found others
https://github.com/mdedonno1337/docker-NFIQ2
