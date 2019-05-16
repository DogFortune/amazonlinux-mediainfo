FROM amazonlinux:2

WORKDIR /usr/local/scripts

RUN yum -y update && yum install -y git automake autoconf libtool pkgconfig make gcc-c++ zlib-devel wget xz libcurl-devel && \
    wget https://mediaarea.net/download/binary/mediainfo/19.04/MediaInfo_CLI_19.04_GNU_FromSource.tar.xz && \
    unxz MediaInfo_CLI_19.04_GNU_FromSource.tar.xz && \
    tar -xf MediaInfo_CLI_19.04_GNU_FromSource.tar && \
    cd MediaInfo_CLI_GNU_FromSource && \
    ./CLI_Compile.sh --with-libcurl && \
    cp MediaInfo/Project/GNU/CLI/mediainfo ../mediainfo

CMD [ "./mediainfo" ]