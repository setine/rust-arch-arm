FROM archlinux/base:latest
MAINTAINER Ulrich Mueller <uvm@talionis.net>

VOLUME ["/source"]
WORKDIR /source

RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -Sy base-devel vim tar rustup

RUN rustup toolchain add nightly
RUN rustup default nightly
RUN rustup target install arm-unknown-linux-gnueabihf

RUN curl https://archlinuxarm.org/builder/xtools/x-tools6h.tar.xz > /tmp/tools.tar.xz \
    && tar xf /tmp/tools.tar.xz -C /opt

RUN mkdir ~/.cargo
COPY include/config /root/.cargo/

ENV CC_arm_unknown_linux_gnueabihf /opt/x-tools6h/arm-unknown-linux-gnueabihf/bin/arm-unknown-linux-gnueabihf-gcc

RUN pacman --noconfirm -Sy openssl
ENV PKG_CONFIG_ALLOW_CROSS=1

CMD ["cargo", "build", "--release", "--target=arm-unknown-linux-gnueabihf"]
#CMD ["bash"]
