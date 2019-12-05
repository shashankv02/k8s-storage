eval $(minikube docker-env)
cd html-generator-service
docker build -t generator .
cd ..

### Handson - Create ceritificate and private keys for https
openssl genrsa -out https.key 2048
openssl req -new -x509 -key https.key -out https.cert -days 3650 -subj /CN=localhost

### Handson - Create secret object to store the https key and cert
kubectl create secret generic https --from-file=https.key --from-file=https.cert

### Handson - Pass https cert and key to nginx ontainer by mounting the secret as volume at /etc/nginx/certs/
kubectl apply -f nginx-empty-dir.yaml

# Wait for pod to start running
kubectl port-forward web-server-9 8080:443
 
