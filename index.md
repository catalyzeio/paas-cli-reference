---
title: Overview
layout: paas_cli
---

# Overview

Usage: datica [OPTIONS] COMMAND [arg...]

Datica CLI. Version 3.6.0

```
Options:
  -U, --username    Datica Username ($DATICA_USERNAME)
  -P, --password    Datica Password ($DATICA_PASSWORD)
  -E, --env         The local alias of the environment in which this command will be run ($DATICA_ENV)
  -v, --version     Show the version and exit
```

Commands:

```
  associate	Associates an environment
  associated	Lists all associated environments
  certs	Manage your SSL certificates and domains
  clear	Clear out information in the global settings file to fix a misconfigured CLI.
  console	Open a secure console to a service
  dashboard	Open the Datica Dashboard in your default browser
  db	Tasks for databases
  default	[DEPRECATED] Set the default associated environment
  deploy-keys	Tasks for SSH deploy keys
  disassociate	Remove the association with an environment
  domain	Print out the temporary domain name of the environment
  environments	Manage environments for which you have access
  files	Tasks for managing service files
  git-remote	Manage git remotes to Datica code services
  invites	Manage invitations for your organizations
  keys	Tasks for SSH keys
  logout	Clear the stored user information from your local machine
  logs	Show the logs in your terminal streamed from your logging dashboard
  maintenance	Manage maintenance mode for code services
  metrics	Print service and environment metrics in your local time zone
  rake	Execute a rake task
  redeploy	Redeploy a service without having to do a git push. This will cause downtime for all redeploys (see the resources page for more details).
  releases	Manage releases for code services
  rollback	Rollback a code service to a specific release
  services	Perform operations on an environment's services
  sites	Tasks for updating sites, including hostnames, SSL certificates, and private keys
  ssl	Perform operations on local certificates to verify their validity
  status	Get quick readout of the current status of your associated environment and all of its services
  support-ids	Print out various IDs related to your associated environment to be used when contacting Datica support
  update	Checks for available updates and updates the CLI if a new update is available
  users	Manage users who have access to the given organization
  vars	Interaction with environment variables for the associated environment
  version	Output the version and quit
  whoami	Retrieve your user ID
  worker	Manage a service's workers
```

Run 'datica COMMAND --help' for more information on a command.
