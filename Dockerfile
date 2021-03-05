FROM ubuntu:20.10
LABEL Author="HotaruBlaze <https://github.com/HotaruBlaze>"
ENV USER=container
RUN useradd -ms /bin/bash ${USER}
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
          ca-certificates \
          lsb-release \
          libssl1.1 \
          openssl \
          coreutils \
      && apt-get purge -y \
      && apt-get clean -y \
      && apt-get autoremove -y \
      && rm -rf /tmp/* /var/tmp/* \
      && rm -rf /var/lib/apt/lists/*
RUN update-ca-certificates
USER ${USER}
WORKDIR /home/${USER}
ENTRYPOINT ["./goTES3MP-Linux"]