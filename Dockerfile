FROM debian:stretch

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        locales \
        epiphany-browser && \
        ca-certificates && \
    dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8 && \
    echo 'en_CA.UTF-8 UTF-8' >> /etc/locale.gen && \
    locale-gen && \
    apt purge locales -y && \
    apt autoremove -y && \
    apt clean

RUN apt-get update && \
    apt-get install -y libgl1-mesa-dri

ENV LC_ALL C.UTF-8
ENV LANG en_CA.UTF-8
ENV LANGUAGE en_CA.UTF-8
ENV NO_AT_BRIDGE 1

CMD epiphany-browser /index.html
