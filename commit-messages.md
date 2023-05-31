# Commit messages

****
## Basic: Length
Keep it short; 50 characters or less.

✅ `git commit -m "Add salt before the password is hashed"`

❌ `commit -m "Add a salt (makes it harder to make rainbow table attacks) before passwords are being hashed"`

****
## Basic: Format
Capitalized, well-structured sentences without a trailing period.

✅ `git commit -m "Add salt before the password is hashed"`

✅ `git commit -m "Fix bug where the password is truncated"`

✅ `git commit -m "Add JSDoc for hashPassword"`

✅ `git commit -m "Fix linting errors"`

❌ `commit -m "add salt before passwords are hashed."`

****
## Basic: Language
Use English for commit messages. During your education, Swedish is also accepted, but beware; Working in the IT-industry, English is the standard language, and why not try to commit to the habit of writing commit messages in English during your time in school?

✅ `git commit -m "Add salt before the password is hashed"`

❌ `git commit -m "Lägger till ett salt innan lösenordet hashas"`

****
## Basic: Tense
Write your commit messages in imperative mode. Think of imperative mode as you give a command to do something. Like "Open your book." or "Write a note."

Your commit messages should always be able to complete the following sentence:

***This commit will...***
✅ `git commit -m "Add salt before the password is hashed"`

✅ `git commit -m "Fix bug where the password is truncated"`

✅ `git commit -m "Add JSDoc for hashPassword"`

✅ `git commit -m "Fix linting errors"`

❌ `git commit -m "Adds salt before the password is hashed"`

❌ `git commit -m "Fixing bug where the password is truncated"`

❌ `git commit -m "Added JSDoc for hashPassword"`

❌ `git commit -m "Fixed some linting errors"`

❌ `git commit -m "Adding salt before the password is hashed"`

****
## Basic: Frequency
Try to commit your code as often as possible. Later on, you will fall into a proper frequency for you and your team, but in the beginning, more is often better. If you want some rule of thumb at the beginning here are a few:

- Do not commit by time. (like every 10th minute)
- Commit when you have completed a feature. (Like creating a working function/method)
- If you have a hard time describing your change in the commit message, you have probably changed too much since the last commit.
- You have three bugs in your code to fix? That is probably three commits.

**Advanced: Add a description**

**Advanced: Reference issues**

**Advanced: Close issues automaticly**

When a commit is completing an issue, you can reference that issue in the commit message and by using specific keywords like "Fixes" or "Closes". That will automaticly close the issue. 

`git commit -m "Add salt before the password. Closes #12"`

Read more at **["Closing issues automatically" at Gitlab Docs](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically)**

****
## Advanced: Study other projects
What better way to learn than to look at the pros? Browse well known open source projects on GitHub to get a feel for how to work with commit messages

Some examples:
- **[Github: Angular](https://github.com/angular/angular/commits/master)** _Google_
- **[Github: VSCode](https://github.com/microsoft/vscode/commits/main)** _Microsoft_
- **[Github: React native](https://github.com/facebook/react-native/commits/main)** _Facebook_

_You will see that some breaks the rules above. Do not be that person._ 🙅‍♀️

****
## Sources and further reading:
- **["A Note About Git Commit Messages" by Tbaggery](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)**
- **["How to Write a Git Commit Message"](https://chris.beams.io/posts/git-commit/)**

****
## Git
- **["Changing a commit message"](https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/changing-a-commit-message)**
