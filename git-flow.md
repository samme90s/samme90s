# Git Flow

****
## Areas
1. Working directory, where `git status` can be used to get a good overview.
   - New files (untracked)
   - Modified files
   - Deleted files

2. `git add` is used to place material in the staging area, preparing it for a commit.

3. `git commit` is then used to place the selected material in the local repository, which can be pushed to the remote repository using `git push`.

****
## Workflow
`git fetch` retrieves the latest information from the remote repository and updates the local repository, but no files are changed in the working directory.

`git merge <branch>` takes all commits from the specified branch and adds them to the current branch. The working directory is updated here! Conflicts may arise where Git cannot determine which change should take priority.

`git pull` fetches changes from the remote repository to the local repository. (The command is not the same as `git fetch` followed by `git merge <other-branch>`).

****
## Commands
Lists existing branches in the local repository. The asterisk indicates the active branch.
```powershell
$ git branch
* main
```

`git branch <new-branch>` creates a new branch based on the active branch, but the active branch is not switched.

```powershell
$ git branch develop
$ git branch
  develop
* main
```

`git checkout <branch>` switches the active branch. The contents of the working directory are updated to match the contents of the active branch. With the -b flag, a new branch is created and switched, for example: `git checkout -b <new-branch>`.

```powershell
$ git checkout develop
Switched to branch 'develop'

$ git branch
* develop
  main
```

To merge one branch with another, use `git merge <other-branch>`. If you want to combine all the commits made in a branch, you can use `git merge --squash <other-branch>`. This is followed by a `git commit -m "Add feature..."`. Note that when using the `--squash` flag, it is not considered a complete merge!

```powershell
$ git checkout main
Switched to branch 'main'

$ git merge develop
Merge made by the 'recursive' strategy.
  app.js | 0
  1 file changed, 4 insertions(+), 2 deletions(-)
  create mode 100644 app.js
```

After merging, the branch can be kept or removed. To remove it, use `git branch -d <branch>`. However, the branch must be merged if to be removed. If for some reason you want to forcefully remove the branch, you can use the `-f` flag for a short version or `--force` for a complete version.

```powershell
$ git branch -d develop
Deleted branch develop (was 55c4b2d)

$ git branch
* main
```