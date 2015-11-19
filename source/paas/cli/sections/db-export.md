---
title: DB Export
layout: paas_guides
---

# DB Export

```
Usage: catalyze db export DATABASE_NAME FILEPATH [-f]

Export data from a database

Arguments:
  DATABASE_NAME=""   The name of the database to export data from (i.e. 'db01')
  FILEPATH=""        The location to save the exported data. This location must NOT already exist unless -f is specified

Options:
  -f, --force=false   If a file previously exists at `filepath`, overwrite it and export data
```

`export` is a simple wrapper around the `backup create` and `backup download` command. When you request an export, a backup is created that will be added to the list of backups shown when you perform the [db list](https://resources.catalyze.io/paas/cli/sections/db-list/) command. Next, that backup is immediately downloaded. Regardless of a successful export or not, the logs for the export will be printed to the console when the export is finished. Here is a sample command

```
catalyze db export db01 ./dbexport.sql
```
