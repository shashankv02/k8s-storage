eval $(minikube docker-env)
cd html-generator-service
### Handson - Modify generator service to read configuration from file
docker build -t generator .
cd ..
### Handson - Create configmap object
### Handson - Pass configuration to container by mounting the configmap as volume
kubectl apply -f nginx-empty-dir.yaml
# Wait for pod to start running
kubectl port-forward web-server-5 8080:80
 
