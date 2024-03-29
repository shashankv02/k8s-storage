eval $(minikube docker-env)
cd html-generator-service

### Handson - Modify generator service to take configuration from environment
docker build -t generator .
cd ..

### Handson - Create configmap object
kubectl apply -f configmap.yaml

### Handson - Pass configuration to container from configmap
kubectl apply -f nginx-empty-dir.yaml

# Wait for pod to start running
kubectl port-forward web-server-7 8080:80
 
