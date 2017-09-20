FROM debian:wheezy-slim
LABEL maintainer='Peter Wu <piterwu@outlook.com>'

WORKDIR /xware

ADD Xware1.0.31_x86_32_glibc.tar.gz /xware
ADD monitor.sh /xware
ADD thunder_mounts.cfg /usr/local/thunder/etc/

RUN apt-get update && \
    apt-get install -y --no-install-recommends libc6-i386 lib32z1 libncursesw5 libprocps0 procps && \
	chmod u+x monitor.sh && chmod u+x portal && \
    apt-get -y autoremove && apt-get clean -y && apt-get autoclean -y && \
    rm -rf var/lib/apt/lists/* var/cache/apt/* var/log/* /xware/*.deb

VOLUME /data

CMD ["./monitor.sh"]
