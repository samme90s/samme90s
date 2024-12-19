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

[Terraform Install](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

```shell
# Ensure system is up to date and "gnupg", "software-properties-common" and "curl" are installed.
# These packages to verify HashiCorp's GPG signature and install HashiCorp's Debian package repository.
sudo apt-get update && \
sudo apt-get install -y gnupg software-properties-common \
# Install HashiCorp's GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

```shell
# Verify the key's fingerprint
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
```

```shell
# Add HashiCorp's official Debian repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
```

```shell
# Update and install Terraform
sudo apt update && \
sudo apt-get install terraform
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
