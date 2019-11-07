eval $(minikube docker-env)`
cd html-generator
docker build -t generator .
cd ..
kubectl apply -f nginx-empty-dir.yaml
# Wait for pod to start running
kubectl port-forward web-server 8080:80
 

