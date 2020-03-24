FROM store/oracle/jdk:11

ARG JAVA_XMX
ARG JAVA_XMS
ARG SPIGOT_REV

WORKDIR /root

RUN curl https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar --output BuildTools.jar

RUN yum -y update && yum -y install git

RUN java -jar BuildTools.jar --rev ${SPIGOT_REV}

FROM store/oracle/jdk:11

WORKDIR /spigot_server

COPY --from=0  /root/spigot-${SPIGOT_REV}.jar .

ENTRYPOINT ["java","-Xms${JAVA_XMS}", "-Xmx$JAVA_XMX${JAVA_XMX}", "-jar", "spigot-${SPIGOT_REV}.jar"]
