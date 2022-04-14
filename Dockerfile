FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y cmake libgtest-dev libboost-test-dev g++ build-essential python-dev autotools-dev libicu-dev libbz2-dev libtcmalloc-minimal4 gfortran libboost-all-dev && rm -rf /var/lib/apt/lists/* 

# https://github.com/mz-automation/libiec61850

RUN apt-get update && \
    apt-get install -y git-core && \
    git clone https://github.com/mz-automation/libiec61850.git -b v1.5 /libiec61850 && \
    cd /libiec61850 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make INSTALL_PREFIX=/usr/local install && \
    rm -rf /var/lib/apt/lists/*

CMD ["cmake"]