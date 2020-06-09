FROM store/oracle/jdk:11 as builder

ARG SPIGOT_REV

WORKDIR /build_spigot

RUN curl https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar --output BuildTools.jar

RUN yum -y update && yum -y install git

RUN java -jar BuildTools.jar --rev ${SPIGOT_REV}

FROM store/oracle/jdk:11

ARG SPIGOT_REV

COPY --from=builder  /build_spigot/spigot-${SPIGOT_REV}.jar .

RUN echo "#!/bin/bash" > start.sh && \
    echo "cd /spigot_server" >> start.sh && \
    echo "java \"-Xms\$JAVA_XMS\" \"-Xmx\$JAVA_XMX\" -jar /spigot-${SPIGOT_REV}.jar" >> start.sh && \
    chmod +x start.sh

WORKDIR /spigot_server

RUN echo eula=true > /spigot_server/eula.txt

EXPOSE 25565

ENTRYPOINT ["/start.sh"]
