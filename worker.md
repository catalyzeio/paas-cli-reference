---
title: Worker
layout: paas_cli
---

# Worker

```
Usage: catalyze worker TARGET

Start a background worker

Arguments:
  TARGET=""    The name of the Procfile target to invoke as a worker
```

`worker` starts a background worker asynchronously. The `TARGET` argument must be specified in your `Procfile`. Once the worker is started, any output can be found in your logging Dashboard or using the <a data-unique="Logs">logs</a> command. Here is a sample command

```
catalyze worker web
```
