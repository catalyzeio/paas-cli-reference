---
title: Overview
layout: paas_cli
---

# Overview

Usage: datica [OPTIONS] COMMAND [arg...]

Datica CLI. Version 4.0.0

```
Options:
  --email           Datica Email ($DATICA_EMAIL)
  -U, --username    [DEPRECATED] Datica Username (This flag is deprecated. Please use --email instead) ($DATICA_USERNAME)
  -P, --password    Datica Password ($DATICA_PASSWORD)
  -E, --env         The local alias of the environment in which this command will be run ($DATICA_ENV)
  -v, --version     Show the version and exit
```

Commands:

```
  certs          Manage your SSL certificates and domains
  clear          Clear out information in the global settings file to fix a misconfigured CLI.
  console        Open a secure console to a service
  db             Tasks for databases
  deploy-keys    Tasks for SSH deploy keys
  domain         Print out the temporary domain name of the environment
  environments   Manage environments for which you have access
  files          Tasks for managing service files
  git-remote     Manage git remotes to Datica code services
  init           Get started using the Datica platform
  invites        Manage invitations for your organizations
  keys           Tasks for SSH keys
  logout         Clear the stored user information from your local machine
  logs           Show the logs in your terminal streamed from your logging dashboard
  maintenance    Manage maintenance mode for code services
  metrics        Print service and environment metrics in your local time zone
  rake           Execute a rake task
  redeploy       Redeploy a service without having to do a git push. This will cause downtime for all redeploys (see the resources page for more details).
  releases       Manage releases for code services
  rollback       Rollback a code service to a specific release
  services       Perform operations on an environment's services
  sites          Tasks for updating sites, including hostnames, SSL certificates, and private keys
  ssl            Perform operations on local certificates to verify their validity
  status         Get quick readout of the current status of your associated environment and all of its services
  support-ids    Print out various IDs related to your associated environment to be used when contacting Datica support
  users          Manage users who have access to the given organization
  vars           Interaction with environment variables for the associated environment
  version        Output the version and quit
  whoami         Retrieve your user ID
  worker         Manage a service's workers
```

Run 'datica COMMAND --help' for more information on a command.

Datica CLI version 4.0.0. A lot has changed in the new Datica CLI! Check out our new CLI guide to see what has changed https://resources.datica.com/compliant-cloud/guides/cli-v4