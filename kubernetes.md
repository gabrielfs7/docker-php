# Example for cluster with 3 machines:

```
  #machine1 (master)
  #machine2
  #machine3
```

# Install kubernetes
curl -fsSf get.docker.com | bash

# Confirm instalation
docker --version

# Add kubernets repository
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main"  > /etc/apt/sources.list.d/k8s.list

# Add key do kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# Get list of packages
apt-get update

# Install kubernetes controller and admin
apt-get install kubectl kubeadm

# Init cluster in #machine1
kubeadm init

# Execute commnands
- After initiate the adm, it will ask you to create .kube/config dir, etc. Do it!
- Install the pod network

# Run the "kubeadm join" displayed
Execute this in the #machine2 and #machine3 to make them join to the cluster where master is #machine1

# Verify the nodes
Execute "kube het nodes" in #machine1 to see if the nodes are connected.

# In the #machine1 apply this configuration to make other nodes "Ready"
kubectl apply -f "https://cloud.weave.works/k7s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# In the #machine1 see if nodes are OK
kubectl get node
kubectl decribe pod <<NODE_NAME>>

# In the #machine1 see all pods
kubectl -pods --all-namespaces

# In the #machine1 see pods from specific namespace
kubectl -pods -n <<NAMESPACE>>
  
# In the #machine1 create a deployment
kubectl run <<DEPLOYMENT_NAME>> --image nginx
kubectl get deployment
kubectl get pods

# Verify in #machine2 and #machine3 that ngix docker image is there
docker ps

# Delete an deployment
kubectl delete deployment <<DEPLOYMENT_NAME>>

# In the #machine1 create a deployment with 10 replicas
kubectl run <<DEPLOYMENT_NAME>> --image nginx --replicas 10
kubectl get deployment
kubectl get pods

# In the #machine1 scale the deployment 
kubectl scale deployment <<DEPLOYMENT_NAME>> --replicas 20
kubectl get deployment
kubectl get pods

# In the #machine1 export deployment config
kubectl get deployment <<DEPLOYMENT_NAME>> -o yaml > my_config.yaml

# Create a deployment based on config (Change the deployment name inside the config file first)
kubectl apply -f my_config.yaml
kubectl get deployment
kubectl get pods

# In #machine1 See history of changes of deploy
kubectl rollout history deployment <<DEPLOYMENT_NAME>>

# In #machine1 roolbak a deployment change
kubectl rollout undo deployment <<DEPLOYMENT_NAME>> --to-revision <<REVISION_NUMBER>>


