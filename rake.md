---
title: Rake
layout: paas_cli
---

# Rake

```
Usage: catalyze rake [SERVICE_NAME] TASK_NAME

Execute a rake task

Arguments:
  SERVICE_NAME=""   The service that will run the rake task. Defaults to the associated service.
  TASK_NAME=""      The name of the rake task to run
```

`rake` executes a rake task by its name asynchronously. Once executed, the output of the task can be seen through your logging Dashboard. Here is a sample command

```
catalyze rake code-1 db:migrate
```
