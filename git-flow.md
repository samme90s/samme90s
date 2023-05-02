# Versionshantering

[Git Flow](https://nvie.com/posts/a-successful-git-branching-model/)

## Working directory, staging area och local repository.

1. Working directory, där kan `git status` användas för att få en bra       överblick.
   - Nya filer (untracked)
   - Ändrade filer (modified)
   - Borttagna filer (deleted)

2. För att placera material i staging area används `git add` och förbereder inför en commit.

3. `git commit` används sedan för att placera det valda materialet i local repository som sedan kan skickas till remote repository genom `git push`.



## Git: Fetch, merge och pull.

1. `git fetch` hämtar den senaste informationen från remote repository och uppdaterar local repository, men inga filer förändras i working directory.

2. `git merge <branch>` Tar samtliga commits från den angivna "branch" och lägger till dem i aktuell "branch". Working directory uppdateras här! Här kan konflikter uppstå där Git inte kan avgöra vilken förändring som ska prioriteras.

3. `git pull` hämtar förändringar från remote repository gentemot local repository. (Kommandot är inte samma sak som `git fetch` följt av `git merge <other-branch>`.



## Kommandon

Listar existerande "branches" i local repository. Asterisken visar vilken "branch" som är aktiv.
```powershell
$ git branch
* main
```

`git branch <new-branch>` skapar en ny "branch" baserad på aktiv "branch", men aktiv "branch" byts inte.
```powershell
$ git branch develop
$ git branch
  develop
* main
```

`git checkout <branch>` byts aktiv "branch". Innehållet i working directory uppdateras för att överensstämma med innehållet i aktiv branch. Med flaggan `-b` så skapas och byts aktiv "branch" exempelvis: `git checkout -b <new-branch>`
```powershell
$ git checkout develop
Switched to branch 'develop'

$ git branch
* develop
  main
```

För att slå samman en "branch" med en annan så används `git merge <other-branch>`. Om man vill trycka ihop alla commits som har gjorts i en branch kan `git merge --squash <other-branch>` användas. Då det följs ut av en `git commit -m "Add feature..."`. Observera att vid användning av flaggan `--squash` så räknas det inte som en fullständig sammanslagning!
```powershell
$ git checkout main
Switched to branch 'main'

$ git merge develop
Merge made by the 'recursive' strategy.
  app.js | 0
  1 file changed, 4 insertions(+), 2 deletions(-)
  create mode 100644 app.js
```

Efter merge kan "branchen" behållas eller tas bort. För att ta bort används `git branch -d <branch>`. Hursom måste "branchen" vara sammanslagen för att kunna tas bort, men om man av någon anledning vill tvinga bort "branchen" kan flaggan `-f` kort eller `--force` fullständigt användas.
```powershell
$ git branch -d develop
Deleted branch develop (was 55c4b2d)

$ git branch
* main
```