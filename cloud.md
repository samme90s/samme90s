# Cloud

## WSL (Windows Subsystem for Linux) Setup

[Windows WSL Setup](https://learn.microsoft.com/en-us/windows/wsl/setup/environment#file-storage)

For Visual Studio modify to add: "Linux and embedded development with C++" in
order for it to work with WSL.

## OpenStackClient Setup

```shell
sudo apt update && \
sudo apt upgrade -y && \
# In order for the binary path to get set we install it as an apt package!
sudo apt install python3-openstackclient
```

## Terraform Setup

[Terraform Install](https://developer.hashicorp.com/terraform/install)

```shell
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list && \
sudo apt update && sudo apt install terraform
```

## Ansible Setup

[Ansible Install](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible-with-pip)

```shell
sudo apt update && \
sudo apt upgrade -y && \
# Install ansible
sudo apt install ansible
```

## Kubernetes (k8s)

```shell
cd ~ && \
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" && \
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check && \
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
kubectl version --client --output=yaml
```

## Skaffold

```shell
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 && \
sudo install skaffold /usr/local/bin/
```

## Minikube

```shell
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

### Configuration

```shell
# Start minikube, check status,
# and set kubernetes current use context to minikube.
minikube start && \
minikube status && \
kubectl config use-context minikube
```
