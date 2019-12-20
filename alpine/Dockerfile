FROM alpine:3.11

ENV GTAG=v0.5

WORKDIR /root

RUN set -eux \
  && apk add --no-cache coreutils git build-base linux-headers clang-dev

RUN set -eux \
  && git clone --depth 1 https://github.com/Biswa96/wslbridge2.git -b ${GTAG} \
  && cd wslbridge2/src \
  && CXX=clang++ make -f Makefile.backend RELEASE=1 \
  && cd ../.. \
  && cp wslbridge2/bin/wslbridge2-backend . \
  && sha256sum wslbridge2-backend > wslbridge2-backend.sha256 \
  && ls -l \
  && cat wslbridge2-backend.sha256


FROM busybox

COPY --from=0 /root/wslbridge2-backend /root/wslbridge2-backend.sha256 /
