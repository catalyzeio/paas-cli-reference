---
title: Git-Remote Add
layout: paas_cli
---

# Git-Remote Add

```
Usage: catalyze git-remote add SERVICE_NAME [-r]

Add the git remote for the given code service to the local git repo

Arguments:
  SERVICE_NAME=""   The name of the service to add a git remote for

Options:
  -r, --remote="catalyze"   The name of the git remote to be added
```

`git-remote add` adds the proper git remote to a local git repository with the given remote name and service. Here is a sample command

```
catalyze git-remote add code-1 -r catalyze-code-1
```
