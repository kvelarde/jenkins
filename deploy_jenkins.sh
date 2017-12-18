#/bin/sh

# deploy jenkins swarm-mode 
Usage=$(cat << EOF
Usage: ./deploy_jenkins.sh 
Script will deploy jenkins env on Swarm Cluster

    -h  | Help
    -c  | Deploy stack files
    -r  | Remove stack files
EOF
)

NETWORK="proxy"

create_network() {
	docker network create --driver overlay ${NETWORK} 2>/dev/null
}

deploy() {
	docker stack deploy -c docker-proxy-stack.yml proxy
	docker stack deploy -c jenkins-stack.yml  jenkins
}

destroy() {
	docker stack rm  proxy
	docker stack rm jenkins
}
while getopts ":dr" opt; do
  case ${opt} in
    d ) # process option a
			deploy
      ;;
    r ) # process option t
			destroy
      ;;
    \? ) echo "Usage: cmd [-h] [-t]"
      ;;
  esac
done
