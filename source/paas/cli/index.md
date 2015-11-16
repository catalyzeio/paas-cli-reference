---
title: Overview
layout: paas_guides
---

# Overview

Usage: catalyze [OPTIONS] COMMAND [arg...]

Catalyze CLI. Version 2.1.4

Options:

```
  -U, --username    Catalyze Username ($CATALYZE_USERNAME)
  -P, --password    Catalyze Password ($CATALYZE_PASSWORD)
  -E, --env         The local alias of the environment in which this command will be run ($CATALYZE_ENV)
  --version         CLI Version
```
Commands:

```
  associate      Associates an environment
  associated     Lists all associated environments
  console        Open a secure console to a service
  dashboard      Open the Catalyze Dashboard in your default browser
  db             Tasks for databases
  default        Set the default associated environment
  disassociate   Remove the association with an environment
  environments   List all environments you have access to
  invites        Manage invitations for your environments
  logs           Show the logs in your terminal streamed from your logging dashboard
  logout         Clear the stored user information from your local machine
  metrics        Print service and environment metrics in your local time zone
  rake           Execute a rake task
  redeploy       Redeploy a service without having to do a git push
  ssl            Perform operations on local certificates to verify their validity
  status         Get quick readout of the current status of your associated environment and all of its services
  support-ids    Print out various IDs related to your associated environment to be used when contacting Catalyze support
  users          Manage users who have access to the associated environment
  vars           Interaction with environment variables for the associated environment
  whoami         Retrieve your user ID
  worker         Start a background worker
  version        Output the version and quit
```

Run 'catalyze COMMAND --help' for more information on a command.

