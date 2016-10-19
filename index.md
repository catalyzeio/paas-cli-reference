---
title: Overview
layout: paas_cli
---

# Overview

Usage: catalyze [OPTIONS] COMMAND [arg...]

Catalyze CLI. Version 3.3.0

Options:

```
  -U, --username        Catalyze Username ($CATALYZE_USERNAME)
  -P, --password        Catalyze Password ($CATALYZE_PASSWORD)
  -E, --env             The local alias of the environment in which this command will be run ($CATALYZE_ENV)
  -v, --version=false   Show the version and exit
```

Commands:

```
  associate      Associates an environment
  associated     Lists all associated environments
  certs          Manage your SSL certificates and domains
  clear          Clear out information in the global settings file to fix a misconfigured CLI.
  console        Open a secure console to a service
  dashboard      Open the Catalyze Dashboard in your default browser
  db             Tasks for databases
  default        [DEPRECATED] Set the default associated environment
  deploy-keys    Tasks for SSH deploy keys
  disassociate   Remove the association with an environment
  domain         Print out the temporary domain name of the environment
  environments   Manage environments for which you have access
  files          Tasks for managing service files
  git-remote     Manage git remotes to Catalyze code services
  invites        Manage invitations for your organizations
  keys           Tasks for SSH keys
  logout         Clear the stored user information from your local machine
  logs           Show the logs in your terminal streamed from your logging dashboard
  metrics        Print service and environment metrics in your local time zone
  rake           Execute a rake task
  redeploy       Redeploy a service without having to do a git push
  releases       Manage releases for code services
  rollback       Rollback a code service to a specific release
  services       Perform operations on an environment's services
  sites          Tasks for updating sites, including hostnames, SSL certificates, and private keys
  ssl            Perform operations on local certificates to verify their validity
  status         Get quick readout of the current status of your associated environment and all of its services
  support-ids    Print out various IDs related to your associated environment to be used when contacting Catalyze support
  update         Checks for available updates and updates the CLI if a new update is available
  users          Manage users who have access to the given organization
  vars           Interaction with environment variables for the associated environment
  whoami         Retrieve your user ID
  worker         Start a background worker
  version        Output the version and quit
```

Run 'catalyze COMMAND --help' for more information on a command.
