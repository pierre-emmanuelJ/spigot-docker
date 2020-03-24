FROM store/oracle/jdk:11 as builder

ARG SPIGOT_REV

WORKDIR /root

RUN curl https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar --output BuildTools.jar

RUN yum -y update && yum -y install git

RUN java -jar BuildTools.jar --rev ${SPIGOT_REV}

FROM store/oracle/jdk:11

ARG JAVA_XMX
ARG JAVA_XMS
ARG SPIGOT_REV

WORKDIR /spigot_server

RUN echo "/root/spigot-${SPIGOT_REV}.jar" 

COPY --from=builder  /root/spigot-${SPIGOT_REV}.jar .

ENTRYPOINT ["java","-Xms${JAVA_XMS}", "-Xmx$JAVA_XMX${JAVA_XMX}", "-jar", "spigot-${SPIGOT_REV}.jar"]
