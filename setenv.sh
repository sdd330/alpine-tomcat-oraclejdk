# Tomcat Custom configuration

CATALINA_OPTS="-server -d64 -XX:+AggressiveOpts -Djava.awt.headless=true -XX:MaxGCPauseMillis=500 -XX:MaxPermSize=${MAXPERM} -XX:PermSize=${PERM} -Xmx${MAXMEM} -Xms${MINMEM} -Xincgc"

if $JMX ; then
    CATALINA_OPTS="${CATALINA_OPTS} -Xdebug -Xrunjdwp:transport=dt_socket,address=${DEBUG_PORT},server=y,suspend=n -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false  -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.port=${JMX_PORT} -Djava.rmi.server.hostname=${JMX_HOSTNAME} -Dcom.sun.management.jmxremote.rmi.port=${JMX_PORT}"
fi
