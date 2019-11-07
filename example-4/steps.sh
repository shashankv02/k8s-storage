# You are now cluster admin
kubectl apply -f pv-1.yaml

# You are now app developer
kubectl apply -f pvc-1.yaml
kubectl get pvc
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

# To delete pvc. you need to delete the pod that is using it
kubectl delete pod mongodb
kubectl delete pvc mongodb-pvc

# Let's try to bind the pvc to pv again
kubectl apply -f pvc-1.yaml
kubectl get pvc

# The pvc is not getting bounded!
# Let's check the status of pv
kubectl get pv

# It says Released and the ReclaimPolicy is set to retain which is default
# Let's change the reclaimPolicy to Recycle or Delete
kubectl apply -f pv-2.yaml

# Wait for couple of seconds. PVC should be bounded now
kubectl get pvc 
