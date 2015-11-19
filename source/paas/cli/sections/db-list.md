---
title: DB List
layout: paas_guides
---

# DB List

```
Usage: catalyze db list SERVICE_NAME [-p] [-n]

List created backups

Arguments:
  SERVICE_NAME=""   The name of the database service to list backups for (i.e. 'db01')

Options:
  -p, --page=1         The page to view
  -n, --page-size=10   The number of items to show per page
```

`db list` lists all previously created backups. After listing backups you can copy the backup ID and use it to download that backup or restore your database from that backup. Here is a sample command

```
catalyze db list db01
```
