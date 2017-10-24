FROM alpine:latest
MAINTAINER Kurtis Velarde <kurtisvelarde@gmail.com>

ENV VERSION=2.0.0.0b2

RUN apk add --no-cache --update  \
    curl \
    git \
    py-pip \
    python \
        && git clone https://git.openstack.org/openstack-infra/jenkins-job-builder \
    && cd jenkins-job-builder \
    && pip install -r test-requirements.txt -e . \
    && python setup.py install

COPY entrypoint.sh /

COPY jenkins_job.ini /

RUN mkdir jobs
ADD jobs /jobs/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["update"]
