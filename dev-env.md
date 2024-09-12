# Development Environment Setup

## Global Gitignore

```shell
touch ~/.gitignore_global
```

```shell
echo ".idea/" >> ~/.gitignore_global
```

```shell
# Configure Git to use the global .gitignore
git config --global core.excludesfile ~/.gitignore_global
```
