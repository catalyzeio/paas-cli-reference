---
title: Services Stop
layout: paas_cli
---

# Services Stop

```
Usage: catalyze services stop SERVICE_NAME

Stop all instances of a given service (including all workers, rake tasks, and open consoles)

Arguments:
  SERVICE_NAME=""   The name of the service to stop
```

`services stop` shuts down all running instances of a given service. This is useful when performing maintenance and a service must be shutdown to perform that maintenance. Take caution when running this command as all instances of the service, all workers, all rake tasks, and all open console sessions will be stopped. Here is a sample command

```
catalyze services stop code-1
```
