FROM tomcat:9.0.68-jdk17-corretto-al2
RUN yum update -y
RUN yum install git -y
RUN yum install wget -y
RUN yum install unzip -y
RUN yum install maven -y
RUN git clone https://github.com/vsvvkt/SampleRegistratonForm.git
RUN cp -rp SampleRegistratonForm/* .
RUN mvn validate
RUN mvn compile
RUN mvn test
RUN mvn package
RUN mvn verify
RUN mvn install
RUN cp -rp /usr/local/tomcat/target/RegistrationForm.war webapps/ROOT.war
CMD ["catalina.sh", "run"]
