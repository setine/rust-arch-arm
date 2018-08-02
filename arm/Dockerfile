FROM archlinux/base:latest
MAINTAINER Ulrich Mueller <uvm@talionis.net>

VOLUME ["/source"]
WORKDIR /source

RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -Sy base-devel vim tar rustup

RUN rustup toolchain add nightly
RUN rustup default nightly
RUN rustup target install arm-unknown-linux-gnueabihf

RUN mkdir ~/.cargo
COPY include/config ~/.cargo/

RUN curl https://archlinuxarm.org/builder/xtools/x-tools6h.tar.xz > /tmp/tools.tar.xz \
    && mkdir /opt/tools \
    && tar xf /tmp/tools.tar.xz -C /opt/tools

#CMD ["cargo", "build", "--release", "--target=arm-unknown-linux-gnueabihf"]
CMD ["bash"]
