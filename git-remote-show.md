---
title: Git-Remote Show
layout: paas_cli
---

# Git-Remote Show

```
Usage: catalyze git-remote show SERVICE_NAME

Print out the git remote for a given code service

Arguments:
  SERVICE_NAME=""   The name of the service to add a git remote for
```

`git-remote show` prints out the git remote URL for the given service. This can be used to do a manual push or use the git remote for another purpose such as a CI integration. Here is a sample command

```
catalyze git-remote show code-1
```
