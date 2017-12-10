Jenkins Docker Env
######################

### Prereqs

Start docker-flowy-proxy and Registry cause this is a swarm env right?

# Deploy docker flow-proxy stack
curl -o docker-proxy-stack.yml https://raw.githubusercontent.com/vfarcic/docker-flow-proxy/master/docker-compose-stack.yml
docker stack deploy -c docker-proxy-stack.yml proxy

# Registry

docker stack deploy -c registry-stack.yml registry

Build -
------

cd master
docker build -t localhost:5000/my-jenkins:0.1 .

cd slave
docker build -t localhost:5000/my-jenkins-swarm-agent:0.1 .


# Deploy stack
docker stack deploy -c jenkins.yml jenkins

# Build seed job
cd jjb
build -t localhost:5000/jjb:0.1 .

# add seed job
docker run -dti --rm jjb:0.1

