FROM ubuntu
MAINTAINER Akira Midorikawa <redcap97@gmail.com>

ENV CYANURUS_VERSION 0.1.0

RUN apt-get install -y curl xz-utils qemu-system-arm
RUN curl -sSfL https://github.com/redcap97/cyanurus/releases/download/v${CYANURUS_VERSION}/cyanurus-${CYANURUS_VERSION}.tar.xz | tar Jx -C /

ENTRYPOINT qemu-system-arm -M vexpress-a9 -m 1G -nographic -drive if=sd,file=/cyanurus-${CYANURUS_VERSION}/rootfs.img,format=raw -kernel /cyanurus-${CYANURUS_VERSION}/cyanurus.elf
