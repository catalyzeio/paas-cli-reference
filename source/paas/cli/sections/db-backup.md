---
title: DB Backup
layout: paas_guides
---

# DB Backup

```
Usage: catalyze db backup SERVICE_NAME [-s]

Create a new backup

Arguments:
  SERVICE_NAME=""   The name of the database service to create a backup for (i.e. 'db01')

Options:
  -s, --skip-poll=false   Whether or not to wait for the backup to finish
```

`db backup` creates a new backup for the given database service. The backup is started and unless `-s` is specified, the CLI will poll every 2 seconds until it finishes. Regardless of a successful backup or not, the logs for the backup will be printed to the console when the backup is finished. Here is a sample command

```
catalyze db backup db01
```
