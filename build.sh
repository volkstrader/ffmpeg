cd /usr/local/src

# libfdk-aac
wget -O fdk-aac.zip https://github.com/mstorsjo/fdk-aac/zipball/master
unzip fdk-aac.zip
cd mstorsjo-fdk-aac*
autoreconf -fiv
./configure --prefix="/usr/local/lib/ffmpeg_build" --disable-shared
make
make install
make distclean

# libvpx
cd /usr/local/src
wget http://webm.googlecode.com/files/libvpx-v1.3.0.tar.bz2
tar xjvf libvpx-v1.3.0.tar.bz2
cd libvpx-v1.3.0
PATH="/usr/local/bin:$PATH" ./configure --prefix="/usr/local/lib/ffmpeg_build" --disable-examples
PATH="/usr/local/bin:$PATH" make
make install
make clean

# ffmpeg
cd /usr/local/src
wget http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
PATH="/usr/local/bin:$PATH" PKG_CONFIG_PATH="/usr/local/lib/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="/usr/local/lib/ffmpeg_build" \
  --extra-cflags="-I/usr/local/lib/ffmpeg_build/include" \
  --extra-ldflags="-L/usr/local/lib/ffmpeg_build/lib" \
  --bindir="/usr/local/bin" \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-nonfree
PATH="/usr/local/bin:$PATH" make
make install
make distclean
hash -r
