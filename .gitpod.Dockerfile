FROM gitpod/workspace-full:latest

RUN apt update && \
  apt install --yes zlib1g-dev libjpeg-dev gdal-bin libproj-dev \
  libgeos-dev libspatialite-dev libsqlite3-mod-spatialite \
  sqlite3 libsqlite3-dev openssl libssl-dev

RUN PYTHON_CONFIGURE_OPTS="--enable-loadable-sqlite-extensions --enable-optimizations --with-openssl=$(brew --prefix openssl@1.1)" LDFLAGS="-L/usr/local/opt/sqlite/lib" CPPFLAGS="-I/usr/local/opt/sqlite/include" pyenv install 3.7.5

RUN python -m pip install pip==20.2.4