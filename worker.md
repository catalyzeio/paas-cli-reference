---
title: Worker
layout: paas_cli
---

# Worker

```
Usage: catalyze worker [SERVICE_NAME] TARGET

Start a background worker

Arguments:
  SERVICE_NAME=""   The name of the service to use to start a worker. Defaults to the associated service.
  TARGET=""         The name of the Procfile target to invoke as a worker
```

`worker` starts a background worker asynchronously. The `TARGET` argument must be specified in your `Procfile`. Once the worker is started, any output can be found in your logging Dashboard or using the [logs](#logs) command. Here is a sample command

```
catalyze worker code-1 web
```
