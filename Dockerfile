FROM xiaoyilin/alpine

RUN apk --no-cache add ca-certificates bash wget && \
        wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-bin-2.31-r0.apk && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-i18n-2.31-r0.apk && \
        apk add glibc-2.31-r0.apk glibc-bin-2.31-r0.apk glibc-i18n-2.31-r0.apk   && \
        rm glibc-2.31-r0.apk glibc-bin-2.31-r0.apk glibc-i18n-2.31-r0.apk  && \
        /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8
