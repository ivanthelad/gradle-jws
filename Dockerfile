FROM jboss-webserver-3/webserver30-tomcat8-openshift:latest
MAINTAINER imk@redhat.com
ENV GRADLE_VERSION 2.6
RUN curl -sL -0 https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /usr/local/ && \
    rm /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
    mv /usr/local/gradle-${GRADLE_VERSION} /usr/local/gradle && \
    ln -sf /usr/local/gradle/bin/gradle /usr/local/bin/gradle
ENV PATH=/opt/maven/bin/:/opt/gradle/bin/:$PATH


LABEL io.k8s.description="Platform for building gradle base jws applications with maven or gradle" \
      io.k8s.display-name="webserver S2I builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,maven-3,gradle-2.6,java,microservices,fatjar"
