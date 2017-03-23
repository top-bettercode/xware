FROM debian:wheezy-slim
MAINTAINER Peter Wu <piterwu@outlook.com>

WORKDIR /xware

COPY ./*.deb /xware/
ADD Xware1.0.31_x86_32_glibc.tar.gz /xware
ADD monitor.sh /xware
ADD thunder_mounts.cfg /usr/local/thunder/etc/

RUN	dpkg -i /xware/libc6-*.deb && \
	dpkg -i /xware/lib32z1_*.deb && \
    dpkg -i /xware/libncursesw5_*.deb && \
    dpkg -i /xware/libprocps0_*.deb && \
    dpkg -i /xware/procps_*.deb && \
	chmod u+x monitor.sh && chmod u+x portal && \
	rm /xware/*.deb

VOLUME /data

CMD ["./monitor.sh"]
