FROM sdd330/alpine-oraclejdk7 

MAINTAINER Yang Leijun <yang.leijun@gmail.com>

ENV TOMCAT_VERSION 7.0.59

RUN curl \
  --silent \
  --location \
  --retry 3 \
  --cacert /etc/ssl/certs/ca-certificates.crt \
  "https://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" \
    | gunzip \
    | tar x -C /usr/ \
    && mv /usr/apache-tomcat* /usr/tomcat

VOLUME /usr/tomcat/webapps

# SET CATALINE_HOME and PATH
ENV CATALINA_HOME /usr/tomcat
ENV JMX false
ENV JMX_PORT 9004
ENV JMX_HOSTNAME localhost
ENV DEBUG_PORT 8000
ENV PERM 128m
ENV MAXPERM 256m
ENV MINMEM 128m
ENV MAXMEM 512m
ENV PATH $PATH:$CATALINA_HOME/bin

ADD setenv.sh $CATALINA_HOME/bin/
RUN chmod +x $CATALINA_HOME/bin/setenv.sh

EXPOSE 8080 9004 8000

CMD ["catalina.sh", "run"]
