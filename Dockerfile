FROM xiaoyilin/alpine
RUN apk --update --no-cache add ca-certificates bash wget tzdata && \
        ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone  && \
        wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-2.34-r0.apk && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-bin-2.34-r0.apk && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-i18n-2.34-r0.apk && \
        wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-dev-2.34-r0.apk && \
        apk add glibc-2.34-r0.apk glibc-bin-2.34-r0.apk glibc-i18n-2.34-r0.apk glibc-dev-2.34-r0.apk  && \
        rm glibc-2.34-r0.apk glibc-bin-2.34-r0.apk glibc-i18n-2.34-r0.apk glibc-dev-2.34-r0.apk && \
#/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8
#生成zh_CN.utf8 locale
        /usr/glibc-compat/bin/localedef -i zh_CN -f UTF-8 zh_CN.UTF-8
ENV TZ Asia/Shanghai
#ENV LANG en_US.UTF-8
ENV LANG zh_CN.UTF-8
