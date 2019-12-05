eval $(minikube docker-env)
cd html-generator
# Handson - Modify generator service to take configuration from environment
docker build -t generator .
cd ..
# Handson - Pass the required configuration as env variables
kubectl apply -f nginx-empty-dir.yaml
# Wait for pod to start running
kubectl port-forward web-server-3 8080:80
 
