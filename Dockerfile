FROM ubuntu:latest

MAINTAINER HC Softech Inc. <hcsoftech@gmail.com>

# set locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
RUN apt-get update
RUN apt-get -y --force-yes install autoconf automake build-essential libass-dev libfreetype6-dev libgpac-dev libsdl1.2-dev libtheora-dev libtool libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texi2html zlib1g-dev yasm libx264-dev unzip libmp3lame-dev libopus-dev wget

ADD build.sh /build.sh
RUN ["/bin/bash", "/build.sh"]

CMD ["/bin/bash"]
