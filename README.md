# fingerprint score server

```
git clone https://github.com/usnistgov/NFIQ2.git
wget http://www.cmake.org/files/v2.8/cmake-2.8.8.tar.gz
docker pull gcc:6.5.0
```

# Misc
- Do `mspaint.exe input.png` and `save-as` input256bit.bmp because `NFIQ2` prefers this format (graycale).
- throw NFIQ::NFIQException(NFIQ::e_Error_FeatureCalculationError, "Only 500 dpi fingerprint images are supported!");
