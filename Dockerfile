FROM amazonlinux:2 as build
WORKDIR /

RUN yum -y update && yum install -y git automake autoconf libtool pkgconfig make gcc-c++ zlib-devel wget xz libcurl-devel && \
    wget https://mediaarea.net/download/binary/mediainfo/19.04/MediaInfo_CLI_19.04_GNU_FromSource.tar.xz && \
    unxz MediaInfo_CLI_19.04_GNU_FromSource.tar.xz && \
    tar -xf MediaInfo_CLI_19.04_GNU_FromSource.tar && \
    cd MediaInfo_CLI_GNU_FromSource && \
    ./CLI_Compile.sh --with-libcurl

FROM amazonlinux:2

COPY --from=build /MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI/mediainfo /usr/local/bin/
CMD [ "mediainfo" ]