# Kube

```shell
minikube start && \
minikube status && \
kubectl config use-context minikube
```

```shell
kubectl run nginx --image=nginx --port=80 && \
# Expose the nginx pod as a service
# --type=NodePort:
# Exposes the service externally by assigning a port on each node.
# This allows external clients to access the pod using any node's IP and the assigned NodePort.
# --port=80:
# Specifies the internal port for the service within the cluster.
# This is the port that other pods inside the cluster will use to communicate with the service.
#
# Expose the service with a NodePort instead?
# A NodePort service exposes the application externally by opening a specific port on each node.
# It also creates a ClusterIP for internal communication within the cluster.
# Traffic from external clients will be routed through any node's IP and the assigned NodePort,
# and forwarded to pods with matching labels.
kubectl expose pod nginx --type=NodePort --port=80
```

```shell
minikube service nginx --url
```

```shell
kubectl get pods -o wide
```

```shell
# Explore documentation for a area.
# Can be further explored using a dot notation "pods.spec.containers"
#
# kubectl explain {area-name}
kubectl explain pods
```

## Cluster

In Kubernetes, **pods**, **nodes**, and the **cluster network** are key components that work together to run and manage containerized applications. Here's a brief explanation of each and how they are related:

### 1. **Pod**

- A **pod** is the smallest deployable unit in Kubernetes. It encapsulates one or more containers that share storage, networking, and other resources.
- All containers within a pod share the same network namespace, meaning they can communicate with each other via `localhost` and share the same IP address and port space[1][2].
- Pods are typically used to run tightly coupled containers that need to work together, such as an application and its sidecar (e.g., logging or proxy).

### 2. **Node**

- A **node** is a physical or virtual machine in the Kubernetes cluster that runs pods. Each node contains the necessary services to run pods, including a container runtime (e.g., Docker), the `kubelet` (which communicates with the control plane), and `kube-proxy` (which manages networking)[2][3].
- Multiple pods can run on a single node, and nodes are managed by the Kubernetes control plane, which schedules pods onto nodes based on resource availability.

### 3. **Cluster Network**

- The **cluster network** (or pod network) is responsible for enabling communication between all pods in the cluster, regardless of which node they are running on[1][5].
- Every pod in the cluster gets a unique IP address, and Kubernetes ensures that pods can communicate with each other directly without needing Network Address Translation (NAT)[1][5]. This allows for seamless communication between pods across different nodes.
- The cluster network also includes services like `kube-proxy`, which routes traffic between services and their corresponding pods.

### Coalition Between Pod, Node, and Cluster Network

- **Pods** run on **nodes**, which provide the computational resources (CPU, memory) required to run containerized applications.
- The **cluster network** ensures that all pods across different nodes can communicate with each other as if they were on the same local network. This allows distributed applications to function smoothly across multiple nodes[1][5].
- The Kubernetes control plane manages how pods are scheduled onto nodes and how networking is handled to ensure reliable communication between them.

In summary:

- Pods are deployed on nodes.
- Nodes work together in a cluster.
- The cluster network ensures seamless communication between all pods across all nodes.

Citations:
[1] https://kubernetes.io/docs/concepts/services-networking/
[2] https://www.armosec.io/glossary/pods-and-nodes-kubernetes/
[3] https://edgedelta.com/company/blog/what-are-kubernetes-pods-nodes-containers-and-cluster
[4] https://www.geeksforgeeks.org/kubernetes-node-vs-pod-vs-cluster/
[5] https://spacelift.io/blog/kubernetes-networking
[6] https://www.cloudzero.com/blog/kubernetes-node-vs-pod/
