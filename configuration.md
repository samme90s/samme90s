# Development Environment Setup

## Git Global Configuration

```shell
git config --global user.email "email"
```

```shell
git config --global user.name "name"
```

```shell
git config --global core.editor "vim"
```

```shell
git config --global pull.rebase false
```

## Git Global Gitignore

```shell
touch ~/.gitignore_global && \
echo ".idea/" >> ~/.gitignore_global && \
# Configure Git to use the global .gitignore
git config --global core.excludesfile ~/.gitignore_global
```

```shell
# To verify the file was correctly added
git config --global --list
```
