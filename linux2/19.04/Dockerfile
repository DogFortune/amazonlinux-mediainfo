FROM amazonlinux:2 as build
LABEL maintainer "DogFortune<long.gate.snow@gmail.com>"

ENV MEDIAINFO_VERSITON=19.04

WORKDIR /
RUN yum -y update && yum install -y git automake autoconf libtool pkgconfig make gcc-c++ zlib-devel wget xz libcurl-devel && \
    wget https://mediaarea.net/download/binary/mediainfo/${MEDIAINFO_VERSITON}/MediaInfo_CLI_${MEDIAINFO_VERSITON}_GNU_FromSource.tar.xz && \
    unxz MediaInfo_CLI_${MEDIAINFO_VERSITON}_GNU_FromSource.tar.xz && \
    tar -xf MediaInfo_CLI_${MEDIAINFO_VERSITON}_GNU_FromSource.tar && \
    cd MediaInfo_CLI_GNU_FromSource && \
    ./CLI_Compile.sh --with-libcurl

FROM amazonlinux:2

COPY --from=build /MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI/mediainfo /usr/local/bin/
CMD [ "mediainfo" ]