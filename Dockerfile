FROM gcc:6.5.0
MAINTAINER typelogic@pm.me

WORKDIR /root/
EXPOSE 8000

COPY exercise.patch nfiq2.py /root/
COPY samples/ /root/samples/

RUN apt-get update && apt-get install -y --no-install-recommends python3-pip python3-PIL && \
    cd /root/ mkdir samples && \
    wget http://www.cmake.org/files/v2.8/cmake-2.8.8.tar.gz && \
    tar xvzf cmake-2.8.8.tar.gz && \
    cd /root/cmake-2.8.8/ && \
    ./configure && make && make install && cd /root/ && \
    git clone https://github.com/usnistgov/NFIQ2.git && cp /root/exercise.patch NFIQ2 && \
    cd /root/NFIQ2/ && git apply exercise.patch && mkdir libOpenCV && cd libOpenCV && \
    cmake -D CMAKE_MAKE_PROGRAM=make ../OpenCV && \
    make opencv_core opencv_ts opencv_imgproc opencv_highgui opencv_flann opencv_features2d \
        opencv_calib3d opencv_ml opencv_video opencv_objdetect opencv_contrib opencv_nonfree \
        opencv_gpu opencv_photo opencv_stitching opencv_videostab && make install && \
    cd /root/NFIQ2/ && make && make install && ldconfig
