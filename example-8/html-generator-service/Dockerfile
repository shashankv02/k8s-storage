FROM ubuntu:latest
RUN apt-get update ; apt-get -y install fortune
ADD generator.sh /bin/generator.sh
ENTRYPOINT /bin/generator.sh
