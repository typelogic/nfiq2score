################################################################################
#
#   Builder environnement
#
################################################################################

FROM centos as builder
LABEL maintainer "Marco.DeDonno@unil.ch"

ADD NFIQ2.tgz /

RUN yum update -y
 
RUN yum group install -y "Development Tools" && \
    yum install -y cmake

RUN cd /NFIQ2/libOpenCV && \
    cmake -D CMAKE_MAKE_PROGRAM=make /NFIQ2/OpenCV/

RUN make -C /NFIQ2/libOpenCV \
    opencv_core opencv_ts opencv_imgproc opencv_highgui opencv_flann \
    opencv_features2d opencv_calib3d opencv_ml opencv_video opencv_objdetect \
    opencv_contrib opencv_nonfree opencv_gpu opencv_photo opencv_stitching opencv_videostab

RUN make -C /NFIQ2/NFIQ2/

ENV LD_LIBRARY_PATH=/NFIQ2/biomdi/common/lib:/NFIQ2/biomdi/fingerminutia/lib:/NFIQ2/libOpenCV/lib

################################################################################
#
#   Running environnement
#
################################################################################

FROM centos

COPY --from=builder /NFIQ2/NFIQ2/bin/ /NFIQ2/NFIQ2/bin/
COPY --from=builder /NFIQ2/biomdi/common/lib/ /NFIQ2/biomdi/common/lib/
COPY --from=builder /NFIQ2/biomdi/fingerminutia/lib/ /NFIQ2/biomdi/fingerminutia/lib/
COPY --from=builder /NFIQ2/libOpenCV/lib/ /NFIQ2/libOpenCV/lib/

COPY --from=builder /NFIQ2/complianceTestSet/ /NFIQ2/complianceTestSet/

ENV LD_LIBRARY_PATH=/NFIQ2/libOpenCV/lib:/NFIQ2/biomdi/common/lib:/NFIQ2/biomdi/fingerminutia/lib
