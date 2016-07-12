---
title: Global Scope
layout: paas_cli
---

# Global Scope

The CLI now supports the concept of scope. Previous to version 2.0.0, all commands had to be run within an associated local git repo. Now, the only time you need to be in a local git repo is when you associate to a new environment. After the initial association, CLI commands can be run from any directory. If you have more than one environment, the CLI uses this concept of scope to decide which environment you are using for the command.

Let's say you have an environment that you associated in the directory `~/mysandbox-code` and another you associated in the directory `~/myprod-code`. These environments are named `mysandbox` and `myprod` respectively. You have two options to specify which environment to run a command against.

First, you can tell the CLI which environment you want to use with the global option `-E` or `--env` (see [Global Options](#global-options)). Your command might start like this

```
catalyze -E myprod ...
```

If you don't set the `-E` flag, the CLI then checks for a default environment. A default environment is used whenever an environment is not specified. A default environment can be specified using the [default](#default) command. You can find out which environment is the default by running the [associated](#associated) command.

Second, if no environment is specified, and no default environment is set, then the CLI simply takes the first environment you associated and prompts you to continue with this environment. This concept of scope will make it easier for Catalyze customers with multiple environments to use the CLI!
