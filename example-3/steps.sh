kubectl apply -f mongodb.yaml
# Wait for pod to start running
kubectl exec -it mongodb mongo
use mydb
db.test.insert({'key':'value'})
db.test.find()
# Press ctrl + D to exit

# Let's delete the pod, start it again and check if data is persisted
kubectl delete pod mongodb
kubectl apply -f mongodb.yaml
# Wait for pod to start running
kubectl exec -it mongodb mongo
db.test.find()

