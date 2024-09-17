# Development Environment Setup

## Git Global Configuration

```shell
git config --global user.email "email"
```

```shell
git config --global user.name "name"
```

## Git Global Gitignore

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

```shell
# To verify the file was correctly added
git config --global --list
```
