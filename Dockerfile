FROM ubuntu:14.04
MAINTAINER Richard Alam <ritzalam@gmail.com>
ENV REFRESHED_AT 2015-12-23

RUN apt-get -yqq update
RUN apt-get -yqq install default-jdk

COPY target/red5-server /usr/share/red5/

EXPOSE 1935 5080

#VOLUME [ "/usr/share/red5/webapps/bigbluebutton", "/usr/share/red5/webapps/video" ]

WORKDIR /usr/share/red5

ENTRYPOINT [ "/usr/share/red5/red5.sh" ]
