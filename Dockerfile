FROM tomcat
#RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install git -y
RUN apt-get install wget -y
RUN apt-get install unzip -y
RUN apt-get install maven -y
RUN git clone https://github.com/vsvvkt/SampleRegistratonForm.git
RUN SampleRegistratonForm/* .
RUN mvn clean install
RUN cp -rp target/RegistratonForm.war webapps/ROOT.war
CMD ["catalina.sh", "run"]
