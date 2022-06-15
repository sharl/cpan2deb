FROM debian:latest

COPY cpan2deb /usr/bin
RUN  mkdir -p /usr/share/cpan2deb
COPY rules    /usr/share/cpan2deb

RUN apt-get update && apt-get install -y build-essential dh-make devscripts libmodule-corelist-perl libmodule-depends-perl
RUN echo | cpan

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
