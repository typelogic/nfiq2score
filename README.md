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

```
wget http://biometrics.nist.gov/cs_links/quality/NFIQ_2/NFIQ2.tgz
docker build -t nfiq2_centos .
```

Will compare `NFIQ2.tgz` codebase versus in `https://github.com/usnistgov/NFIQ2.git` just curious.

His `Dockerfile` failed but in a trivial way, below:
```
make[1]: Leaving directory `/NFIQ2/NFIQ2/NFIQ2Algorithm'
make: Leaving directory `/NFIQ2/NFIQ2'
Removing intermediate container c8082d81ff73
 ---> fca6483a11ed
Step 9/16 : ENV LD_LIBRARY_PATH=/NFIQ2/biomdi/common/lib:/NFIQ2/biomdi/fingerminutia/lib:/NFIQ2/libOpenCV/lib
 ---> Running in fabda9f04d1e
Removing intermediate container fabda9f04d1e
 ---> 75d1bdca97e1
Step 10/16 : FROM centos
 ---> 67fa590cfc1c
Step 11/16 : COPY --from=builder /NFIQ2/NFIQ2/bin/ /NFIQ2/NFIQ2/bin/
 ---> ce9431576867
Step 12/16 : COPY --from=builder /NFIQ2/biomdi/common/lib/ /NFIQ2/biomdi/common/lib/
 ---> 56d91d8aa389
Step 13/16 : COPY --from=builder /NFIQ2/biomdi/fingerminutia/lib/ /NFIQ2/biomdi/fingerminutia/lib/
 ---> 9062e7823be7
Step 14/16 : COPY --from=builder /NFIQ2/libOpenCV/lib/ /NFIQ2/libOpenCV/lib/
 ---> f5901bd4872e
Step 15/16 : COPY --from=builder /NFIQ2/complianceTestSet/ /NFIQ2/complianceTestSet/
COPY failed: stat /var/lib/docker/overlay2/8a35cc5a402f375d8887fe48c03cd08cd9cd4537c71d1612fda59f3ba80405a8/merged/NFIQ2/complianceTestSet: no such file or directory
```

Anyway, while in transit was able to poke inside container layer and saw:
```
vagrant@ubuntu-bionic:~/nfiq/docker-NFIQ2$ docker exec -it c8082 gcc --version
gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39)
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

vagrant@ubuntu-bionic:~/nfiq/docker-NFIQ2$ docker exec -it c8082 cmake --version
cmake version 2.8.12.2
```

So, indeed we share same constraints being that of `gcc` version and `cmake`. 
- 
