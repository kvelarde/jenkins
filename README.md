Jenkins Dockerfile
######################

Build -
------
docker build -t fmc-jenkins:0.1 .

Run -
----
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home fmc-jenkins:0.1
