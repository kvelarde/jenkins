FROM jenkins

USER root

RUN apt-get -y update \
	&& apt-get -y install git python-pip \
	&& git clone https://git.openstack.org/openstack-infra/jenkins-job-builder \
  && ( cd jenkins-job-builder && pip install -r test-requirements.txt -e . ) 

COPY plugins.txt /usr/share/jenkins/ref/
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
