FROM phusion/baseimage:0.9.16
MAINTAINER Kierran McPherson <kierranm@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# install the required packages
RUN apt-get update && sudo apt-get install -y \
      git-core \
      python \
      python-cheetah

# set the environment variables for sickrage
ENV SB_HOME /sickrage
ENV SB_DATA /config
ENV SB_USER root

# create some external mount points for sickrage data
VOLUME /config
VOLUME /tv
VOLUME /downloads
VOLUME /blackhole

# clone the sickrage repo
RUN git clone https://github.com/SiCKRAGETV/SickRage.git /sickrage
RUN chown -R nobody:users /sickrage
RUN chown -R nobody:users /sickrage/.git
RUN cp -a /sickrage/autoProcessTV/autoProcessTV.cfg.sample /sickrage/autoProcessTV/autoProcessTV.cfg

# copy across the default config
ADD Assets/config.ini /tmp/config.ini

# add the startup config file
RUN mkdir -p /etc/my_init.d
ADD Assets/config.sh /etc/my_init.d/config.sh
RUN chmod +x /etc/my_init.d/config.sh

# add sickrage to runit
RUN mkdir /etc/service/sickrage
ADD Assets/sickrage.sh /etc/service/sickrage/run
RUN chmod +x /etc/service/sickrage/run

# use phusion/baseimage init system
CMD ["/sbin/my_init"]
