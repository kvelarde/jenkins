Jenkins Dockerfile
######################

Build -
------
docker build -t fmc-jenkins:0.1 .

Run -
----
docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home fmc-jenkins:0.1

# Deploy docker flow-proxy stack
curl -o docker-proxy-stack.yml https://raw.githubusercontent.com/vfarcic/docker-flow-proxy/master/docker-compose-stack.yml
docker stack deploy -c docker-proxy-stack.yml proxy

# Run jjb inital
pushd jjb
docker  build -t jjb:0.1 .

docker run -dti --rm jjb:0.1
