
# Alpine Tomcat
------------
Tomcat Oracle JDK7 Version based on Alpine Linux

## Usage

To start an instance:

	docker run -d -p 8080:8080 --name tomcat-server sdd330/alpine-tomcat-oraclejdk

To start with jmx and debug support:

	docker run -d -p 8080:8080 -p 9004:9004 -p 8000:8000 -e JMX=true -e JMX_HOSTNAME=192.168.59.103 --name tomcat-server sdd330/alpine-tomcat-oraclejdk

To login to bash:
	
	docker exec -it tomcat-server bash


