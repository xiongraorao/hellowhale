docker build . -t hellowhale
docker run -d -p80:80 --name hellowhale hellowhale
docker tag hellowhale xiongraorao/hellowhale
docker login -u xiongraorao

kubectl create deployment hellowhale --image xiongraorao/hellowhale
kubectl expose deployment/hellowhale --port=80 --name=hellowhalesvc --type=NodePort

whoami
cat /etc/hosts
IMAGE_NAME="xiongraorao/hellowhale:${BUILD_NUMBER}"
docker build . -t $IMAGE_NAME
docker login -u xiongraorao -p ${DOCKER_HUB}
docker push $IMAGE_NAME

IMAGE_NAME="xiongraorao/hellowhale:${BUILD_NUMBER}"
kubectl set image deployment/hellowhale hellowhale=$IMAGE_NAME 
