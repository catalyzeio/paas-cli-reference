---
title: Db Import
layout: paas_guides
---

# Db Import

Usage: `catalyze db import [OPTIONS] DATABASE_LABEL FILEPATH`

  Imports a file into a chosen database service.

  The import is accomplished by encrypting the file and uploading it to Catalyze. An automated service processes the file according to the passed parameters. The command offers the option to either wait until the processing is finished (and be notified of the end result), or to just kick it off.

  The type of file depends on the database. For postgres and mysql, this should be a single SQL script with the extension "sql". For mongo, this should be a tar'd, gzipped archive of the dump that you wish to import, with the extension "tar.gz". For further help on creating backups,

  If there is an unexpected error, please contact Catalyze support (support@catalyze.io).

Options:

```
  --mongo-collection TEXT  The name of a specific mongo collection to import into. Only applies for mongo imports.
  --mongo-database TEXT    The name of the mongo database to import into, if not using the default. Only applies for mongo imports.
  --wipe-first             If set, empties the database before importing. This should not be used lightly.
  --help                   Show this message and exit.
```
