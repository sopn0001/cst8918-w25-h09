CST8918 - DevOps: Infrastructure as Code  
Prof: Robert McKenney  

# Hybrid-H09 Azure Kubernetes Service (AKS) Cluster with Terraform

## Background

As the Systems Engineer on your product development team, you have been tasked with creating an Azure Kubernetes Service (AKS) cluster using Terraform. The AKS cluster will be used to deploy a sample application that includes a frontend (using Vue), two backend services (one built with node, one with rust), and message broker (RabbitMQ).

Other team members have completed the application code and have provided you with a sample kubernetes configuration file that you will use to deploy the application to the AKS cluster.

## Instructions

### Use Terraform to create an Azure Kubernetes Service (AKS) cluster.

The AKS cluster should be created with the following configurations:

- a minimum of 1 nodes and a maximum of 3 nodes.
- created in a new resource group.
- use the latest Kubernetes version.
- use the "Standard_B2s" VM size
- use the "SystemAssigned" managed identity

### The output of the Terraform script should be the kubeconfig file for the AKS cluster.

### Use the output of the Terraform script to connect to the AKS cluster using the `kubectl` command.

### Deploy a sample application to the AKS cluster.

Use the provided `sample-app.yaml` file to deploy a sample application to the AKS cluster.

#### Deploy the application

```bash
kubectl apply -f sample-app.yaml
```

#### Verify the application is running

```bash
kubectl get pods
kubectl get services
```

Use the external IP address of the `store-front` service to access the application in a web browser.

## Submit

Your github repository for this assignment should be named `cst8918-w25-h09`.

When you have completed the assignment, submit the URL of your GitHub repository in the assignment folder on Brightspace.

## Clean up resources

When you're done with the application, you can clean up the resources you created in your Azure account to avoid incurring more charges.

You can use `kubectl` to delete the pods.

You can use `terraform` to destroy the infrastructure resources.

## Quick start (commands)

```bash
# 1. Login to Azure
az login

# 2. Initialize and apply Terraform (replace idrissop with your college username)
terraform init
terraform apply -var="labelPrefix=idrissop"

# 3. Save kubeconfig (use -raw to avoid heredoc markers)
terraform output -raw kube_config > ./kubeconfig
export KUBECONFIG=./kubeconfig
kubectl get nodes

# 4. Deploy the sample app
kubectl apply -f sample-app.yaml
kubectl get pods
kubectl get services

# 5. Open the store-front EXTERNAL-IP in a browser
# kubectl get service store-front

# 6. Cleanup when finished
kubectl delete -f sample-app.yaml
terraform destroy -var="labelPrefix=idrissop"
```
