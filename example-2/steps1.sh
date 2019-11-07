kubectl apply -f nginx-git-repo.yaml
# Wait for pod to start running
kubectl port-forward web-server-2 8080:80

