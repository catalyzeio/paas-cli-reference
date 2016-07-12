---
title: Releases Update
layout: paas_cli
---

## Releases Update

```
Usage: catalyze releases update SERVICE_NAME RELEASE_NAME [--notes] [--release]

Update a release from a code service

Arguments:
  SERVICE_NAME=""   The name of the service to update a release for
  RELEASE_NAME=""   The name of the release to update

Options:
  -n, --notes=""     The new notes to save on the release. If omitted, notes will be unchanged.
  -r, --release=""   The new name of the release. If omitted, the release name will be unchanged.
```

`releases update` allows you to rename or add notes to an existing release. By default, releases are named with the git SHA of the commit used to create the release. Renaming them allows you to organize your releases. Here is a sample command

```
catalyze releases update code-1 f93ced037f828dcaabccfc825e6d8d32cc5a1883 --notes "This is a stable build" --release v1
```
