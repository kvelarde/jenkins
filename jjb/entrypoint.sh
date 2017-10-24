#!/bin/sh

if [ "$1" = 'update' ]; then
  /usr/bin/jenkins-jobs --conf jenkins_job.ini update jobs
fi

