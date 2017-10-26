FROM vfarcic/jenkins-swarm-agent

USER root

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base

RUN apk -U add git
RUN apk -U add wget
RUN apk -U add unzip

RUN mkdir /jenkins_jobs
COPY jenkins_job.ini /jenkins_jobs/

RUN pip install consulate
RUN pip install awscli

RUN git clone https://git.openstack.org/openstack-infra/jenkins-job-builder \
  && ( cd jenkins-job-builder && pip install -r test-requirements.txt -e . ) 

# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/0.10.2/terraform_0.10.2_linux_amd64.zip?_ga=2.139482227.197941730.1503365392-821979834.1496937263 -O terraform.zip \
  && unzip terraform.zip \
  && mv terraform /usr/local/bin/ 

# Install Packer
RUN wget https://releases.hashicorp.com/packer/1.0.4/packer_1.0.4_linux_amd64.zip?_ga=2.222373275.1263275549.1503370872-1006178486.1503370872 \
  -O packer.zip \
  && unzip packer.zip \
  && mv packer /usr/local/bin/ 

