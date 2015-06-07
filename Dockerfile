FROM sdd330/alpine-oraclejdk7 

MAINTAINER Yang Leijun <yang.leijun@gmail.com>

ENV TOMCAT_VERSION=7.0.59

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
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080

CMD ["catalina.sh", "run"]
