# git-tools

## a collection of primitive tools to personalise my/the git experience

### splat-client-git-hooks.sh & dot-git/hooks

splat-client-git-hooks.sh is a "run once" script that:

- finds all your repos given a root directory (e.g. ~/src)
- then, for each repo it:
    - copies the `pre-commit`,  `pre-push` and `local-or-remote-master-check.sh`
     files in  [./dot-git/hooks/](dot-git/hooks/) to the repo's .git/hooks directory.

It does this to make all your repos' `master` branches "protected" i.e.
you will be unable to commit to `master` or push to `origin/master`.

# local-or-remote-master-check.sh

this is essentially a fancy grep invocation that checks if the current branch is master when you're committing or pushing. That's it.
