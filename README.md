Jenkins Dockerfile
######################

Build -
------
cd master
docker build -t fmc-jenkins:0.1 .

cd slave
docker build -t localhost:5000/fmc-jenkins-swarm-agent:0.1 .

cd jjb
build -t localhost:5000/jjb:0.1 .

# Deploy docker flow-proxy stack
curl -o docker-proxy-stack.yml https://raw.githubusercontent.com/vfarcic/docker-flow-proxy/master/docker-compose-stack.yml
docker stack deploy -c docker-proxy-stack.yml proxy

# Build Seed Job

# add seed job
docker run -dti --rm jjb:0.1
