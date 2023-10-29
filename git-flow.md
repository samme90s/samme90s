# Git Flow

## Introduction

Git Flow is a set of practices and conventions for using Git to manage your source code efficiently. It defines a structured workflow that helps developers collaborate on projects while maintaining version control.

## Areas

1. **Working Directory:** The working directory is where you interact with your files. You can use `git status` to get an overview of the following:

   - New files (untracked)
   - Modified files
   - Deleted files

2. **Staging Area:** Use `git add` to place changes in the staging area, preparing them for a commit.

3. **Local Repository:** After staging, use `git commit` to save your changes to the local repository. These changes can then be pushed to the remote repository using `git push`.

## Workflow

- **`git fetch`**: Retrieves the latest information from the remote repository and updates the local repository, but it doesn't change files in the working directory.

- **`git merge <branch>`**: Combines all commits from the specified branch into the current branch. This updates the working directory, and conflicts may occur when Git can't determine which change to prioritize.

- **`git pull`**: Fetches changes from the remote repository and merges them into the local repository. Unlike `git fetch` followed by `git merge <other-branch>`, `git pull` is a single command for both actions.

## Commands

Rename a branch using the following commands:

```shell
git branch -m master main
git fetch origin
git branch -u origin/main main
git remote set-head origin -a
```
