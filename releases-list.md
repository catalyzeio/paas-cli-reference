---
title: Releases List
layout: paas_cli
---

## Releases List

```
Usage: catalyze releases list SERVICE_NAME

List all releases for a given code service

Arguments:
  SERVICE_NAME=""   The name of the service to list releases for
```

`releases list` lists all of the releases for a given service. A release is automatically created each time a git push is performed. Here is a sample command

```
catalyze releases list code-1
```
