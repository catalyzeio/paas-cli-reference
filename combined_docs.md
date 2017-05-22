# Automatic Updates

Once downloaded, the CLI will attempt to automatically update itself when a new version becomes available. This ensures you are always running a compatible version of the Datica CLI. However you can always check out the latest releases on the [releases page](https://github.com/daticahealth/cli/releases).

To ensure your CLI can automatically update itself, be sure to put the binary in a location where you have **write access** without the need for sudo or escalated privileges.

# Supported Platforms

Since version 2.0.0, the following platforms and architectures are supported by the Datica CLI.

| OS | Architecture |
|----|--------------|
| Darwin (Mac OS X) | 64-bit, 32-bit |
| Linux | 64-bit, 32-bit |
| Windows | 64-bit, 32-bit |

# Global Scope

The CLI now supports the concept of scope. Previous to version 2.0.0, all commands had to be run within an associated local git repo. Now, the only time you need to be in a local git repo is when you associate to a new environment. After the initial association, CLI commands can be run from any directory. If you have more than one environment, you must specify which environment to use with the global `-E` flag.

Let's say you have associated to two environments named `mysandbox` and `myprod`. You have two options to specify which environment to run a command against.

First, you can tell the CLI which environment you want to use with the global option `-E` or `--env` (see [Global Options](#global-options)). Your command might start like this

```
datica -E myprod ...
```

If you don't set the `-E` flag, then the CLI takes the first environment you associated and prompts you to continue with this environment. This concept of scope will make it easier for Datica customers with multiple environments to use the CLI!

# Environment Aliases

When you associate an environment from within a local git repo, you typically run the following command:

```
datica -E "<your_env_alias>" associate "My Health Tech Company Production" app01
```

Where `My Health Tech Company Production` is the name of your environment. However with the concept of [scope](#global-scope) and being able to specify which environment to use on a command by command basis with the `-E` global option, that is a lot to type! This is where environment aliases come in handy.

When you associate an environment and you want to pick a shorter name to reference the environment by, simply add a `-a` flag to the command. Let's try the command again calling it `prod` this time:

```
datica -E "<your_env_alias>" associate "My Health Tech Company Production" app01 -a prod
```

Now when you run the [associated](#associated) command, you will see the alias as well as the actual environment name.

When using aliases, there are a couple things to keep in mind. Aliases are only local and never leave your local machine. If you alias this environment `prod`, a coworker can alias the environment `healthtech-prod` with no ramifications. Second, after setting an alias you will never reference the environment by its actual name with the CLI. You will always use the alias for flags, arguments, options, etc.

To change or remove an alias, you must [disassociate](#disassociate) and then [reassociate](#associate) with a new alias.

# Bash Autocompletion

One feature we've found helpful on \*Nix systems is autocompletion in bash. To enable this feature, head over to the github repo and download the `datica_autocomplete` file. If you use a Mac, you will need to install bash-completion with `brew install bash-completion` or `source` the `datica_autocomplete` file each time you start up a terminal. Store this file locally in `/etc/bash_completion.d/` or (`/usr/local/etc/bash_completion.d/` on a Mac). Completion will be available when you restart your terminal. Now type `datica ` and hit tab twice to see the list of available commands. **Please note** that autocompletion only works one level deep. The CLI will not autocomplete or suggest completions when you type `datica db ` and then hit tab twice. It currently only works when you have just `datica ` typed into your terminal. This is a feature we are looking into expanding in the future.

Note: you may have to add `source /etc/bash_completion.d/datica_autocomplete` (`/usr/local/etc/bash_completion.d/datica_autocomplete`) in your `~/.bashrc` (`~/.bash_profile`) file.

# Global Options

The following table outlines all global options available in the CLI. Global options are always set after the word `datica` and before any commands. Rather than setting these each time, you may also set an environment variable with the appropriate value which will automatically be used.

| Short Name | Long Name | Description | Environment Variable |
|------------|-----------|-------------|----------------------|
| -U | --username | Your Datica username that you login to the Dashboard with | DATICA_USERNAME |
| -P | --password | Your Datica password that you login to the Dashboard with | DATICA_PASSWORD |
| -E | --env | The local alias of the environment in which this command will be run. Read more about [environment aliases](#environment-aliases) | DATICA_ENV |

# Overview

```

Usage: datica [OPTIONS] COMMAND [arg...]


Options:
  -U, --username    Datica Username ($DATICA_USERNAME)
  -P, --password    Datica Password ($DATICA_PASSWORD)
  -E, --env         The local alias of the environment in which this command will be run ($DATICA_ENV)
  -v, --version     Show the version and exit

Commands:
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

Run 'datica COMMAND --help' for more information on a command.

```

# Associate

```

Usage: datica associate ENV_NAME SERVICE_NAME [-a] [-r] [-d]

Associates an environment

Arguments:
  ENV_NAME=""       The name of your environment
  SERVICE_NAME=""   The name of the primary code service to associate with this environment (i.e. 'app01')

Options:
  -a, --alias=""          A shorter name to reference your environment by for local commands
  -r, --remote="datica"   The name of the remote
  -d, --default=false     [DEPRECATED] Specifies whether or not the associated environment will be the default

```

`associate` is the entry point of the cli. You need to associate an environment before you can run most other commands. Check out [scope](#global-scope) and [aliases](#environment-aliases) for more info on the value of the alias and default options. Here is a sample command

```
datica associate My-Production-Environment app01 -a prod
```

# Associated

```

Usage: datica associated

Lists all associated environments

```

`associated` outputs information about all previously associated environments on your local machine. The information that is printed out includes the alias, environment ID, actual environment name, service ID, and the git repo directory. Here is a sample command

```
datica associated
```

# Certs

The `certs` command gives access to certificate and private key management for public facing services. The certs command cannot be run directly but has sub commands.

## Certs Create

```

Usage: datica certs create NAME PUBLIC_KEY_PATH PRIVATE_KEY_PATH [-s] [-r]

Create a new domain with an SSL certificate and private key

Arguments:
  NAME=""               The name of this SSL certificate plus private key pair
  PUBLIC_KEY_PATH=""    The path to a public key file in PEM format
  PRIVATE_KEY_PATH=""   The path to an unencrypted private key file in PEM format

Options:
  -s, --self-signed=false   Whether or not the given SSL certificate and private key are self signed
  -r, --resolve=true        Whether or not to attempt to automatically resolve incomplete SSL certificate issues

```

`certs create` allows you to upload an SSL certificate and private key which can be used to secure your public facing code service. Cert creation can be done at any time, even after environment provisioning, but must be done before [creating a site](#sites-create). When creating a cert, the CLI will check to ensure the certificate and private key match. If you are using a self signed cert, pass in the `-s` flag and the hostname check will be skipped. Datica requires that your certificate include your own certificate, intermediate certificates, and the root certificate in that order. If you only include your certificate, the CLI will attempt to resolve this and fetch intermediate and root certificates for you. It is advised that you create a full chain before running this command as the `-r` flag is accomplished on a "best effort" basis.

The `HOSTNAME` for a certificate does not need to match the valid Subject of the actual SSL certificate nor does it need to match the `site` name used in the `sites create` command. The `HOSTNAME` is used for organizational purposes only and can be named anything with the exclusion of the following characters: `/`, `&`, `%`. Here is a sample command

```
datica -E "<your_env_alias>" certs create wildcard_mysitecom ~/path/to/cert.pem ~/path/to/priv.key
```

## Certs List

```

Usage: datica certs list

List all existing domains that have SSL certificate and private key pairs

```

`certs list` lists all of the available certs you have created on your environment. The displayed names are the names that should be used as the `DOMAIN` parameter in the [sites create](#sites-create) command. Here is a sample command

```
datica -E "<your_env_alias>" certs list
```

## Certs Rm

```

Usage: datica certs rm HOSTNAME

Remove an existing domain and its associated SSL certificate and private key pair

Arguments:
  HOSTNAME=""   The hostname of the domain and SSL certificate and private key pair

```

`certs rm` allows you to delete old certificate and private key pairs. Only certs that are not in use by a site can be deleted. Here is a sample command

```
datica -E "<your_env_alias>" certs rm mywebsite.com
```

## Certs Update

```

Usage: datica certs update NAME PUBLIC_KEY_PATH PRIVATE_KEY_PATH [-s] [-r]

Update the SSL certificate and private key pair for an existing domain

Arguments:
  NAME=""               The name of this SSL certificate and private key pair
  PUBLIC_KEY_PATH=""    The path to a public key file in PEM format
  PRIVATE_KEY_PATH=""   The path to an unencrypted private key file in PEM format

Options:
  -s, --self-signed=false   Whether or not the given SSL certificate and private key are self signed
  -r, --resolve=true        Whether or not to attempt to automatically resolve incomplete SSL certificate issues

```

`certs update` works nearly identical to the [certs create](#certs-create) command. All rules regarding self signed certs and certificate resolution from the `certs create` command apply to the `certs update` command. This is useful for when your certificates have expired and you need to upload new ones. Update your certs and then redeploy your service_proxy. Here is a sample command

```
datica -E "<your_env_alias>" certs update mywebsite.com ~/path/to/new/cert.pem ~/path/to/new/priv.key
```

# Clear

```

Usage: datica clear [--private-key] [--session] [--environments] [--default] [--pods] [--all]

Clear out information in the global settings file to fix a misconfigured CLI.

Options:
  --private-key=false    Clear out the saved private key information
  --session=false        Clear out all session information
  --environments=false   Clear out all associated environments
  --default=false        [DEPRECATED] Clear out the saved default environment
  --pods=false           Clear out all saved pods
  --all=false            Clear out all settings

```

`clear` allows you to manage your global settings file in case your CLI becomes misconfigured. The global settings file is stored in your home directory at `~/.datica`. You can clear out all settings or pick and choose which ones need to be removed. After running the `clear` command, any other CLI command will reset the removed settings to their appropriate values. Here are some sample commands

```
datica clear --all
datica clear --environments # removes your associated environments
datica clear --session --private-key # removes all session and private key authentication information
```

# Console

```

Usage: datica console SERVICE_NAME [COMMAND]

Open a secure console to a service

Arguments:
  SERVICE_NAME=""   The name of the service to open up a console for
  COMMAND=""        An optional command to run when the console becomes available

```

`console` gives you direct access to your database service or application shell. For example, if you open up a console to a postgres database, you will be given access to a psql prompt. You can also open up a mysql prompt, mongo cli prompt, rails console, django shell, and much more. When accessing a database service, the `COMMAND` argument is not needed because the appropriate prompt will be given to you. If you are connecting to an application service the `COMMAND` argument is required. Here are some sample commands

```
datica -E "<your_env_alias>" console db01
datica -E "<your_env_alias>" console app01 "bundle exec rails console"
```

# Dashboard

```

Usage: datica dashboard

Open the Datica Dashboard in your default browser

```

`dashboard` opens up the Datica Dashboard homepage in your default web browser. Here is a sample command

```
datica dashboard
```

# Db

The `db` command gives access to backup, import, and export services for databases. The db command can not be run directly but has sub commands.

## Db Backup

```

Usage: datica db backup DATABASE_NAME [-s]

Create a new backup

Arguments:
  DATABASE_NAME=""   The name of the database service to create a backup for (i.e. 'db01')

Options:
  -s, --skip-poll=false   Whether or not to wait for the backup to finish

```

`db backup` creates a new backup for the given database service. The backup is started and unless `-s` is specified, the CLI will poll every few seconds until it finishes. Regardless of a successful backup or not, the logs for the backup will be printed to the console when the backup is finished. If an error occurs and the logs are not printed, you can use the [db logs](#db-logs) command to print out historical backup job logs. Here is a sample command

```
datica -E "<your_env_alias>" db backup db01
```

## Db Download

```

Usage: datica db download DATABASE_NAME BACKUP_ID FILEPATH [-f]

Download a previously created backup

Arguments:
  DATABASE_NAME=""   The name of the database service which was backed up (i.e. 'db01')
  BACKUP_ID=""       The ID of the backup to download (found from "datica backup list")
  FILEPATH=""        The location to save the downloaded backup to. This location must NOT already exist unless -f is specified

Options:
  -f, --force=false   If a file previously exists at "filepath", overwrite it and download the backup

```

`db download` downloads a previously created backup to your local hard drive. Be careful using this command as it could download PHI. Be sure that all hard drive encryption and necessary precautions have been taken before performing a download. The ID of the backup is found by first running the [db list](#db-list) command. Here is a sample command

```
datica -E "<your_env_alias>" db download db01 cd2b4bce-2727-42d1-89e0-027bf3f1a203 ./db.sql
```

This assumes you are downloading a MySQL or PostgreSQL backup which takes the `.sql` file format. If you are downloading a mongo backup, the command might look like this

```
datica -E "<your_env_alias>" db download db01 cd2b4bce-2727-42d1-89e0-027bf3f1a203 ./db.tar.gz
```

## Db Export

```

Usage: datica db export DATABASE_NAME FILEPATH [-f]

Export data from a database

Arguments:
  DATABASE_NAME=""   The name of the database to export data from (i.e. 'db01')
  FILEPATH=""        The location to save the exported data. This location must NOT already exist unless -f is specified

Options:
  -f, --force=false   If a file previously exists at `filepath`, overwrite it and export data

```

`db export` is a simple wrapper around the `db backup` and `db download` commands. When you request an export, a backup is created that will be added to the list of backups shown when you perform the [db list](#db-list) command. Then that backup is immediately downloaded. Regardless of a successful export or not, the logs for the backup will be printed to the console when the export is finished. If an error occurs and the logs are not printed, you can use the [db logs](#db-logs) command to print out historical backup job logs. Here is a sample command

```
datica -E "<your_env_alias>" db export db01 ./dbexport.sql
```

This assumes you are exporting a MySQL or PostgreSQL database which takes the `.sql` file format. If you are exporting a mongo database, the command might look like this

```
datica -E "<your_env_alias>" db export db01 ./dbexport.tar.gz
```

## Db Import

```

Usage: datica db import DATABASE_NAME FILEPATH [-s][-d [-c]]

Import data into a database

Arguments:
  DATABASE_NAME=""   The name of the database to import data to (i.e. 'db01')
  FILEPATH=""        The location of the file to import to the database

Options:
  -c, --mongo-collection=""   If importing into a mongo service, the name of the collection to import into
  -d, --mongo-database=""     If importing into a mongo service, the name of the database to import into
  -s, --skip-backup=false     Skip backing up database. Useful for large databases, which can have long backup times.

```

`db import` allows you to inject new data into your database service. For example, if you wrote a simple SQL file

```
CREATE TABLE mytable (
id TEXT PRIMARY KEY,
val TEXT
);

INSERT INTO mytable (id, val) values ('1', 'test');
```

and stored it at `./db.sql` you could import this into your database service. When importing data into mongo, you may specify the database and collection to import into using the `-d` and `-c` flags respectively. Regardless of a successful import or not, the logs for the import will be printed to the console when the import is finished. Before an import takes place, your database is backed up automatically in case any issues arise. Here is a sample command

```
datica -E "<your_env_alias>" db import db01 ./db.sql
```

## Db List

```

Usage: datica db list DATABASE_NAME [-p] [-n]

List created backups

Arguments:
  DATABASE_NAME=""   The name of the database service to list backups for (i.e. 'db01')

Options:
  -p, --page=1         The page to view
  -n, --page-size=10   The number of items to show per page

```

`db list` lists all previously created backups. After listing backups you can copy the backup ID and use it to [download](#db-download) that backup or [view the logs](#db-logs) from that backup. Here is a sample command

```
datica -E "<your_env_alias>" db list db01
```

## Db Logs

```

Usage: datica db logs DATABASE_NAME BACKUP_ID

Print out the logs from a previous database backup job

Arguments:
  DATABASE_NAME=""   The name of the database service (i.e. 'db01')
  BACKUP_ID=""       The ID of the backup to download logs from (found from "datica backup list")

```

`db logs` allows you to view backup logs from historical backup jobs. You can find the backup ID from using the `db list` command. Here is a sample command

```
datica -E "<your_env_alias>" db logs db01 cd2b4bce-2727-42d1-89e0-027bf3f1a203
```

# Default

```

Usage: datica default ENV_ALIAS

[DEPRECATED] Set the default associated environment

Arguments:
  ENV_ALIAS=""   The alias of an already associated environment to set as the default

```

The `default` command has been deprecated! It will be removed in a future version. Please specify `-E` on all commands instead of using the default.

`default` sets the default environment for all commands that don't specify an environment with the `-E` flag. See [scope](#global-scope) for more information on scope and default environments. When setting a default environment, you must give the alias of the environment if one was set when it was associated and not the real environment name. Here is a sample command

```
datica default prod
```

# Deploy-keys

The `deploy-keys` command gives access to SSH deploy keys for environment services. The deploy-keys command can not be run directly but has sub commands.

## Deploy-keys Add

```

Usage: datica deploy-keys add NAME KEY_PATH SERVICE_NAME

Add a new deploy key

Arguments:
  NAME=""           The name for the new key, for your own purposes
  KEY_PATH=""       Relative path to the SSH key file
  SERVICE_NAME=""   The name of the code service to add this deploy key to

```

`deploy-keys add` allows you to upload an SSH public key in OpenSSH format. These keys are used for pushing code to your code services but are not required. You should be using personal SSH keys with the [keys](#keys) command unless you are pushing code from Continuous Integration or Continuous Deployment scenarios. Deploy keys are intended to be shared among an organization. Here are some sample commands

```
datica -E "<your_env_alias>" deploy-keys add app01_public ~/.ssh/app01_rsa.pub app01
```

## Deploy-keys List

```

Usage: datica deploy-keys list SERVICE_NAME

List all deploy keys

Arguments:
  SERVICE_NAME=""   The name of the code service to list deploy keys

```

`deploy-keys list` will list all of your previously uploaded deploy keys by name including the key's fingerprint in SHA256 format. Here is a sample command

```
datica -E "<your_env_alias>" deploy-keys list app01
```

## Deploy-keys Rm

```

Usage: datica deploy-keys rm NAME SERVICE_NAME

Remove a deploy key

Arguments:
  NAME=""           The name of the key to remove
  SERVICE_NAME=""   The name of the code service to remove this deploy key from

```

`deploy-keys rm` will remove a previously created deploy key by name. It is a good idea to rotate deploy keys on a set schedule as they are intended to be shared among an organization. Here are some sample commands

```
datica -E "<your_env_alias>" deploy-keys rm app01_public app01
```

# Disassociate

```

Usage: datica disassociate ENV_ALIAS

Remove the association with an environment

Arguments:
  ENV_ALIAS=""   The alias of an already associated environment to disassociate

```

`disassociate` removes the environment from your list of associated environments but **does not** remove the datica git remote on the git repo. Disassociate does not have to be run from within a git repo. Here is a sample command

```
datica disassociate myprod
```

# Domain

```

Usage: datica domain

Print out the temporary domain name of the environment

```

`domain` prints out the temporary domain name setup by Datica for an environment. This domain name typically takes the form podXXXXX.catalyzeapps.com but may vary based on the environment. Here is a sample command

```
datica -E "<your_env_alias>" domain
```

# Environments

This command has been moved! Please use [environments list](#environments-list) instead. This alias will be removed in the next CLI update.

The `environments` command allows you to manage your environments. The environments command can not be run directly but has sub commands.

## Environments List

```

Usage: datica environments list

List all environments you have access to

```

`environments list` lists all environments that you are granted access to. These environments include those you created and those that other Datica customers have added you to. Here is a sample command

```
datica environments list
```

## Environments Rename

```

Usage: datica environments rename NAME

Rename an environment

Arguments:
  NAME=""      The new name of the environment

```

`environments rename` allows you to rename your environment. Here is a sample command

```
datica -E "<your_env_alias>" environments rename MyNewEnvName
```

# Files

The `files` command gives access to service files on your environment's services. Service files can include Nginx configs, SSL certificates, and any other file that might be injected into your running service. The files command can not be run directly but has sub commands.

## Files Download

```

Usage: datica files download [SERVICE_NAME] FILE_NAME [-o] [-f]

Download a file to your localhost with the same file permissions as on the remote host or print it to stdout

Arguments:
  SERVICE_NAME="service_proxy"   The name of the service to download a file from
  FILE_NAME=""                   The name of the service file from running "datica files list"

Options:
  -o, --output=""     The downloaded file will be saved to the given location with the same file permissions as it has on the remote host. If those file permissions cannot be applied, a warning will be printed and default 0644 permissions applied. If no output is specified, stdout is used.
  -f, --force=false   If the specified output file already exists, automatically overwrite it

```

`files download` allows you to view the contents of a service file and save it to your local machine. Most service files are stored on your service_proxy and therefore you should not have to specify the `SERVICE_NAME` argument. Simply supply the `FILE_NAME` found from the [files list](#files-list) command and the contents of the file, as well as the permissions string, will be printed to your console. You can always store the file locally, applying the same permissions as those on the remote server, by specifying an output file with the `-o` flag. Here is a sample command

```
datica -E "<your_env_alias>" files download /etc/nginx/sites-enabled/mywebsite.com
```

## Files List

```

Usage: datica files list [SERVICE_NAME]

List all files available for a given service

Arguments:
  SERVICE_NAME="service_proxy"   The name of the service to list files for

```

`files list` prints out a listing of all service files available for download. Nearly all service files are stored on the service_proxy and therefore you should not have to specify the `SERVICE_NAME` argument. Here is a sample command

```
datica -E "<your_env_alias>" files list
```

# Git-remote

The `git-remote` command allows you to interact with code service remote git URLs. The git-remote command can not be run directly but has sub commands.

## Git-remote Add

```

Usage: datica git-remote add SERVICE_NAME [-r]

Add the git remote for the given code service to the local git repo

Arguments:
  SERVICE_NAME=""   The name of the service to add a git remote for

Options:
  -r, --remote="datica"   The name of the git remote to be added

```

`git-remote add` adds the proper git remote to a local git repository with the given remote name and service. Here is a sample command

```
datica -E "<your_env_alias>" git-remote add code-1 -r datica-code-1
```

## Git-remote Show

```

Usage: datica git-remote show SERVICE_NAME

Print out the git remote for a given code service

Arguments:
  SERVICE_NAME=""   The name of the service to add a git remote for

```

`git-remote show` prints out the git remote URL for the given service. This can be used to do a manual push or use the git remote for another purpose such as a CI integration. Here is a sample command

```
datica -E "<your_env_alias>" git-remote show code-1
```

# Invites

The `invites` command gives access to organization invitations. Every environment is owned by an organization and users join organizations in order to access individual environments. You can invite new users by email and manage pending invites through the CLI. You cannot call the `invites` command directly, but must call one of its subcommands.

## Invites Accept

```

Usage: datica invites accept INVITE_CODE

Accept an organization invite

Arguments:
  INVITE_CODE=""   The invite code that was sent in the invite email

```

`invites accept` is an alternative form of accepting an invitation sent by email. The invitation email you receive will have instructions as well as the invite code to use with this command. Here is a sample command

```
datica -E "<your_env_alias>" invites accept 5a206aa8-04f4-4bc1-a017-ede7e6c7dbe2
```

## Invites List

```

Usage: datica invites list

List all pending organization invitations

```

`invites list` lists all pending invites for the associated environment's organization. Any invites that have already been accepted will not appear in this list. To manage users who have already accepted invitations or are already granted access to your environment, use the [users](#users) group of commands. Here is a sample command

```
datica -E "<your_env_alias>" invites list
```

## Invites Rm

```

Usage: datica invites rm INVITE_ID

Remove a pending organization invitation

Arguments:
  INVITE_ID=""   The ID of an invitation to remove

```

`invites rm` removes a pending invitation found by using the [invites list](#invites-list) command. Once an invite has already been accepted, it cannot be removed. Removing an invitation is helpful if an email was misspelled or an invitation was sent to an incorrect email address. If you want to revoke access to a user who already has been given access to your environment, use the [users rm](#users-rm) command. Here is a sample command

```
datica -E "<your_env_alias>" invites rm 78b5d0ed-f71c-47f7-a4c8-6c8c58c29db1
```

## Invites Send

```

Usage: datica invites send EMAIL [-m | -a]

Send an invite to a user by email for a given organization

Arguments:
  EMAIL=""     The email of a user to invite to the associated environment. This user does not need to have a Datica account prior to sending the invitation

Options:
  -m, --member=true   Whether or not the user will be invited as a basic member
  -a, --admin=false   Whether or not the user will be invited as an admin

```

`invites send` invites a new user to your environment's organization. The only piece of information required is the email address to send the invitation to. The invited user will join the organization as a basic member, unless otherwise specified with the `-a` flag. The recipient does **not** need to have a Dashboard account in order to send them an invitation. However, they will need to have a Dashboard account to accept the invitation. Here is a sample command

```
datica -E "<your_env_alias>" invites send coworker@datica.com -a
```

# Keys

The `keys` command gives access to SSH key management for your user account. SSH keys can be used for authentication and pushing code to the Datica platform. Any SSH keys added to your user account should not be shared but be treated as private SSH keys. Any SSH key uploaded to your user account will be able to be used with all code services and environments that you have access to. The keys command can not be run directly but has sub commands.

## Keys Add

```

Usage: datica keys add NAME PUBLIC_KEY_PATH

Add a public key

Arguments:
  NAME=""              The name for the new key, for your own purposes
  PUBLIC_KEY_PATH=""   Relative path to the public key file

```

`keys add` allows you to add a new SSH key to your user account. SSH keys added to your user account should be private and not shared with others. SSH keys can be used for authentication (as opposed to the traditional username and password) as well as pushing code to an environment's code services. Please note, you must specify the path to the public key file and not the private key. All SSH keys should be in either OpenSSH RSA format or PEM format. Here is a sample command

```
datica keys add my_prod_key ~/.ssh/prod_rsa.pub
```

## Keys List

```

Usage: datica keys list

List your public keys

```

`keys list` lists all public keys by name that have been uploaded to your user account including the key's fingerprint in SHA256 format. Here is a sample command

```
datica keys list
```

## Keys Rm

```

Usage: datica keys rm NAME

Remove a public key

Arguments:
  NAME=""      The name of the key to remove.

```

`keys rm` allows you to remove an SSH key previously uploaded to your account. The name of the key can be found by using the [keys list](#keys-list) command. Here is a sample command

```
datica keys rm my_prod_key
```

## Keys Set

```

Usage: datica keys set PRIVATE_KEY_PATH

Set your auth key

Arguments:
  PRIVATE_KEY_PATH=""   Relative path to the private key file

```

`keys set` allows the CLI to use an SSH key for authentication instead of the traditional username and password combination. This can be useful for automation or where shared workstations are involved. Please note that you must pass in the path to the private key and not the public key. The given key must already be added to your account by using the [keys add](#keys-add) command. Here is a sample command

```
datica keys set ~/.ssh/my_key
```

# Logout

```

Usage: datica logout

Clear the stored user information from your local machine

```

When using the CLI, your username and password are **never** stored in any file on your filesystem. However, in order to not type in your username and password each and every command, a session token is stored in the CLI's configuration file and used until it expires. `logout` removes this session token from the configuration file. Here is a sample command

```
datica logout
```

# Logs

```

Usage: datica logs [QUERY] [(-f | -t)] [--hours] [--minutes] [--seconds]

Show the logs in your terminal streamed from your logging dashboard

Arguments:
  QUERY="*"    The query to send to your logging dashboard's elastic search (regex is supported)

Options:
  -f, --follow=false   Tail/follow the logs (Equivalent to -t)
  -t, --tail=false     Tail/follow the logs (Equivalent to -f)
  --hours=0            The number of hours before now (in combination with minutes and seconds) to retrieve logs
  --minutes=0          The number of minutes before now (in combination with hours and seconds) to retrieve logs
  --seconds=0          The number of seconds before now (in combination with hours and minutes) to retrieve logs

```

`logs` prints out your application logs directly from your logging Dashboard. If you do not see your logs, try adjusting the number of hours, minutes, or seconds of logs that are retrieved with the `--hours`, `--minutes`, and `--seconds` options respectively. You can also follow the logs with the `-f` option. When using `-f` all logs will be printed to the console within the given time frame as well as any new logs that are sent to the logging Dashboard for the duration of the command. When using the `-f` option, hit ctrl-c to stop. Here are some sample commands

```
datica -E "<your_env_alias>" logs --hours=6 --minutes=30
datica -E "<your_env_alias>" logs -f
```

# Maintenance

Maintenance mode can be enabled or disabled for code services on demand. This redirects all traffic to a default maintenance page.

## Maintenance Disable

```

Usage: datica maintenance disable SERVICE_NAME

Disable maintenance mode for a code service

Arguments:
  SERVICE_NAME=""   The name of the service to disable maintenance mode for

```

`maintenance disable` turns off maintenance mode for a given code service. Here is a sample command

```
datica -E "<your_env_alias>" maintenance disable code-1
```

## Maintenance Enable

```

Usage: datica maintenance enable SERVICE_NAME

Enable maintenance mode for a code service

Arguments:
  SERVICE_NAME=""   The name of the code service to enable maintenance mode for

```

`maintenance enable` turns on maintenance mode for a given code service. Maintenance mode redirects all traffic for the given code service to a default HTTP maintenance page. If you would like to customize this maintenance page, please contact Datica support. Here is a sample command

```
datica -E "<your_env_alias>" maintenance enable code-1
```

## Maintenance Show

```

Usage: datica maintenance show [SERVICE_NAME]

Show the status of maintenance mode for a code service

Arguments:
  SERVICE_NAME=""   The name of the code service to show the status of maintenance mode

```

`maintenance show` displays whether or not maintenance mode is enabled for a code service or all code services. Here are some sample commands

```
datica -E "<your_env_alias>" maintenance show
datica -E "<your_env_alias>" maintenance show code-1
```

# Metrics

The `metrics` command gives access to environment metrics or individual service metrics through a variety of formats. This is useful for checking on the status and performance of your application or environment as a whole. The metrics command cannot be run directly but has sub commands.

## Metrics Cpu

```

Usage: datica metrics cpu [SERVICE_NAME] [(--json | --csv | --text | --spark)] [--stream] [-m]

Print service and environment CPU metrics in your local time zone

Arguments:
  SERVICE_NAME=""   The name of the service to print metrics for

Options:
  --json=false     Output the data as json
  --csv=false      Output the data as csv
  --text=true      Output the data in plain text
  --spark=false    Output the data using spark lines
  --stream=false   Repeat calls once per minute until this process is interrupted.
  -m, --mins=1     How many minutes worth of metrics to retrieve.

```

`metrics cpu` prints out CPU metrics for your environment or individual services. You can print out metrics in csv, json, plain text, or spark lines format. If you want plain text format, simply omit the `--json`, `--csv`, and `--spark` flags. You can only stream metrics using plain text or spark lines formats. To print out metrics for every service in your environment, omit the `SERVICE_NAME` argument. Otherwise you may choose a service, such as an app service, to retrieve metrics for. Here are some sample commands

```
datica -E "<your_env_alias>" metrics cpu
datica -E "<your_env_alias>" metrics cpu app01 --stream
datica -E "<your_env_alias>" metrics cpu --json
datica -E "<your_env_alias>" metrics cpu db01 --csv -m 60
```

## Metrics Memory

```

Usage: datica metrics memory [SERVICE_NAME] [(--json | --csv | --text | --spark)] [--stream] [-m]

Print service and environment memory metrics in your local time zone

Arguments:
  SERVICE_NAME=""   The name of the service to print metrics for

Options:
  --json=false     Output the data as json
  --csv=false      Output the data as csv
  --text=true      Output the data in plain text
  --spark=false    Output the data using spark lines
  --stream=false   Repeat calls once per minute until this process is interrupted.
  -m, --mins=1     How many minutes worth of metrics to retrieve.

```

`metrics memory` prints out memory metrics for your environment or individual services. You can print out metrics in csv, json, plain text, or spark lines format. If you want plain text format, simply omit the `--json`, `--csv`, and `--spark` flags. You can only stream metrics using plain text or spark lines formats. To print out metrics for every service in your environment, omit the `SERVICE_NAME` argument. Otherwise you may choose a service, such as an app service, to retrieve metrics for. Here are some sample commands

```
datica -E "<your_env_alias>" metrics memory
datica -E "<your_env_alias>" metrics memory app01 --stream
datica -E "<your_env_alias>" metrics memory --json
datica -E "<your_env_alias>" metrics memory db01 --csv -m 60
```

## Metrics Network-in

```

Usage: datica metrics network-in [SERVICE_NAME] [(--json | --csv | --text | --spark)] [--stream] [-m]

Print service and environment received network data metrics in your local time zone

Arguments:
  SERVICE_NAME=""   The name of the service to print metrics for

Options:
  --json=false     Output the data as json
  --csv=false      Output the data as csv
  --text=true      Output the data in plain text
  --spark=false    Output the data using spark lines
  --stream=false   Repeat calls once per minute until this process is interrupted.
  -m, --mins=1     How many minutes worth of metrics to retrieve.

```

`metrics network-in` prints out received network metrics for your environment or individual services. You can print out metrics in csv, json, plain text, or spark lines format. If you want plain text format, simply omit the `--json`, `--csv`, and `--spark` flags. You can only stream metrics using plain text or spark lines formats. To print out metrics for every service in your environment, omit the `SERVICE_NAME` argument. Otherwise you may choose a service, such as an app service, to retrieve metrics for. Here are some sample commands

```
datica -E "<your_env_alias>" metrics network-in
datica -E "<your_env_alias>" metrics network-in app01 --stream
datica -E "<your_env_alias>" metrics network-in --json
datica -E "<your_env_alias>" metrics network-in db01 --csv -m 60
```

## Metrics Network-out

```

Usage: datica metrics network-out [SERVICE_NAME] [(--json | --csv | --text | --spark)] [--stream] [-m]

Print service and environment transmitted network data metrics in your local time zone

Arguments:
  SERVICE_NAME=""   The name of the service to print metrics for

Options:
  --json=false     Output the data as json
  --csv=false      Output the data as csv
  --text=true      Output the data in plain text
  --spark=false    Output the data using spark lines
  --stream=false   Repeat calls once per minute until this process is interrupted.
  -m, --mins=1     How many minutes worth of metrics to retrieve.

```

`metrics network-out` prints out transmitted network metrics for your environment or individual services. You can print out metrics in csv, json, plain text, or spark lines format. If you want plain text format, simply omit the `--json`, `--csv`, and `--spark` flags. You can only stream metrics using plain text or spark lines formats. To print out metrics for every service in your environment, omit the `SERVICE_NAME` argument. Otherwise you may choose a service, such as an app service, to retrieve metrics for. Here are some sample commands

```
datica -E "<your_env_alias>" metrics network-out
datica -E "<your_env_alias>" metrics network-out app01 --stream
datica -E "<your_env_alias>" metrics network-out --json
datica -E "<your_env_alias>" metrics network-out db01 --csv -m 60
```

# Rake

```

Usage: datica rake [SERVICE_NAME] TASK_NAME

Execute a rake task

Arguments:
  SERVICE_NAME=""   The service that will run the rake task. Defaults to the associated service.
  TASK_NAME=""      The name of the rake task to run

```

`rake` executes a rake task by its name asynchronously. Once executed, the output of the task can be seen through your logging Dashboard. Here is a sample command

```
datica -E "<your_env_alias>" rake code-1 db:migrate
```

# Redeploy

```

Usage: datica redeploy SERVICE_NAME

Redeploy a service without having to do a git push. This will cause downtime for all redeploys (see the resources page for more details).

Arguments:
  SERVICE_NAME=""   The name of the service to redeploy (i.e. 'app01')

```

`redeploy` deploys an identical copy of the given service. For code services, this avoids having to perform a code push. You skip the git push and the build. For service proxies, new instances replace the old ones. All other service types cannot be redeployed with this command. For service proxy redeploys, there will be approximately 5 minutes of downtime. For code service redeploys, there will be approximately 30 seconds of downtime. Here is a sample command

```
datica -E "<your_env_alias>" redeploy app01
```

# Releases

The `releases` command allows you to manage your code service releases. A release is automatically created each time you perform a git push. The release is tagged with the git SHA of the commit. Releases are a way of tagging specific points in time of your git history. By default, the last three releases will be kept. Please contact Support if you require more than the last three releases to be retained. You can rollback to a specific release by using the [rollback](#rollback) command. The releases command cannot be run directly but has sub commands.

## Releases List

```

Usage: datica releases list SERVICE_NAME

List all releases for a given code service

Arguments:
  SERVICE_NAME=""   The name of the service to list releases for

```

`releases list` lists all of the releases for a given service. A release is automatically created each time a git push is performed. Here is a sample command

```
datica -E "<your_env_alias>" releases list code-1
```

## Releases Rm

```

Usage: datica releases rm SERVICE_NAME RELEASE_NAME

Remove a release from a code service

Arguments:
  SERVICE_NAME=""   The name of the service to remove a release from
  RELEASE_NAME=""   The name of the release to remove

```

`releases rm` removes an existing release. This is useful in the case of a misbehaving code service. Removing the release avoids the risk of rolling back to a "bad" build. Here is a sample command

```
datica -E "<your_env_alias>" releases rm code-1 f93ced037f828dcaabccfc825e6d8d32cc5a1883
```

## Releases Update

```

Usage: datica releases update SERVICE_NAME RELEASE_NAME [--notes] [--release]

Update a release from a code service

Arguments:
  SERVICE_NAME=""   The name of the service to update a release for
  RELEASE_NAME=""   The name of the release to update

Options:
  -n, --notes=""     The new notes to save on the release. If omitted, notes will be unchanged.
  -r, --release=""   The new name of the release. If omitted, the release name will be unchanged.

```

`releases update` allows you to rename or add notes to an existing release. By default, releases are named with the git SHA of the commit used to create the release. Renaming them allows you to organize your releases. Here is a sample command

```
datica -E "<your_env_alias>" releases update code-1 f93ced037f828dcaabccfc825e6d8d32cc5a1883 --notes "This is a stable build" --release v1
```

# Rollback

```

Usage: datica rollback SERVICE_NAME RELEASE_NAME

Rollback a code service to a specific release

Arguments:
  SERVICE_NAME=""   The name of the service to rollback
  RELEASE_NAME=""   The name of the release to rollback to

```

`rollback` is a way to redeploy older versions of your code service. You must specify the name of the service to rollback and the name of an existing release to rollback to. Releases can be found with the [releases list](#releases-list) command. Here are some sample commands

```
datica -E "<your_env_alias>" rollback code-1 f93ced037f828dcaabccfc825e6d8d32cc5a1883
```

# Services

The `services` command allows you to manage your services. The services command cannot be run directly but has sub commands.

## Services List

```

Usage: datica services list

List all services for your environment

```

`services list` prints out a list of all services in your environment and their sizes. The services will be printed regardless of their currently running state. To see which services are currently running and which are not, use the [status](#status) command. Here is a sample command

```
datica -E "<your_env_alias>" services list
```

## Services Stop

```

Usage: datica services stop SERVICE_NAME

Stop all instances of a given service (including all workers, rake tasks, and open consoles)

Arguments:
  SERVICE_NAME=""   The name of the service to stop

```

`services stop` shuts down all running instances of a given service. This is useful when performing maintenance on code services or services without volumes that must be shutdown to perform maintenance. Take caution when running this command as all instances of the service, all workers, all rake tasks, and all open console sessions will be stopped. Here is a sample command

```
datica -E "<your_env_alias>" services stop code-1
```

## Services Rename

```

Usage: datica services rename SERVICE_NAME NEW_NAME

Rename a service

Arguments:
  SERVICE_NAME=""   The service to rename
  NEW_NAME=""       The new name for the service

```

`services rename` allows you to rename any service in your environment. Here is a sample command

```
datica -E "<your_env_alias>" services rename code-1 api-svc
```

# Sites

The `sites` command gives access to hostname and SSL certificate usage for public facing services. `sites` are different from `certs` in that `sites` use an instance of a `cert` and are associated with a single service. `certs` can be used by multiple sites. The sites command can not be run directly but has sub commands.

## Sites Create

```

Usage: datica sites create SITE_NAME SERVICE_NAME HOSTNAME [--client-max-body-size] [--proxy-connect-timeout] [--proxy-read-timeout] [--proxy-send-timeout] [--proxy-upstream-timeout] [--enable-cors] [--enable-websockets]

Create a new site linking it to an existing cert instance

Arguments:
  SITE_NAME=""      The name of the site to be created. This will be used in this site's nginx configuration file (i.e. ".example.com")
  SERVICE_NAME=""   The name of the service to add this site configuration to (i.e. 'app01')
  HOSTNAME=""       The hostname used in the creation of a certs instance with the 'certs' command (i.e. "star_example_com")

Options:
  --client-max-body-size=-1     The 'client_max_body_size' nginx config specified in megabytes
  --proxy-connect-timeout=-1    The 'proxy_connect_timeout' nginx config specified in seconds
  --proxy-read-timeout=-1       The 'proxy_read_timeout' nginx config specified in seconds
  --proxy-send-timeout=-1       The 'proxy_send_timeout' nginx config specified in seconds
  --proxy-upstream-timeout=-1   The 'proxy_next_upstream_timeout' nginx config specified in seconds
  --enable-cors=false           Enable or disable all features related to full CORS support
  --enable-websockets=false     Enable or disable all features related to full websockets support

```

`sites create` allows you to create a site configuration that is tied to a single service. To create a site, you must first [create a cert](#certs-create). A site has three pieces of information: a name, the service it's tied to, and the cert instance it will use. The name is the `server_name` that will be injected into this site's Nginx configuration file. It is important that this site name match what URL your site will respond to. If this is a bare domain, using `mysite.com` is sufficient. If it should respond to the APEX domain and all subdomains, it should be named `.mysite.com` notice the leading `.`. The service is a code service that will use this site configuration. Lastly, the cert instance must be specified by the `HOSTNAME` argument used in the [certs create](#certs-create) command. You can also set Nginx configuration values directly by specifying one of the above flags. Specifying `--enable-cors` will add the following lines to your Nginx configuration

```
add_header 'Access-Control-Allow-Origin' '$http_origin' always;
add_header 'Access-Control-Allow-Credentials' 'true' always;
add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS, DELETE, PUT, HEAD, PATCH' always;
add_header 'Access-Control-Allow-Headers' 'DNT,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Accept,Authorization' always;
add_header 'Access-Control-Max-Age' 1728000 always;
if ($request_method = 'OPTIONS') {
  return 204;
}
```

Specifying `--enable-websockets` will add the following lines to your Nginx configuration

```
proxy_http_version 1.1;
proxy_set_header Upgrade $http_upgrade;
proxy_set_header Connection "upgrade";
```

Here are some sample commands

```
datica -E "<your_env_alias>" sites create .mysite.com app01 wildcard_mysitecom
datica -E "<your_env_alias>" sites create .mysite.com app01 wildcard_mysitecom --client-max-body-size 50 --enable-cors
```

## Sites List

```

Usage: datica sites list

List details for all site configurations

```

`sites list` lists all sites for the given environment. The names printed out can be used in the other sites commands. Here is a sample command

```
datica -E "<your_env_alias>" sites list
```

## Sites Rm

```

Usage: datica sites rm NAME

Remove a site configuration

Arguments:
  NAME=""      The name of the site configuration to delete

```

`sites rm` allows you to remove a site by name. Since sites cannot be updated, if you want to change the name of a site, you must `rm` the site and then [create](#sites-create) it again. If you simply need to update your SSL certificates, you can use the [certs update](#certs-update) command on the cert instance used by the site in question. Here is a sample command

```
datica -E "<your_env_alias>" sites rm mywebsite.com
```

## Sites Show

```

Usage: datica sites show NAME

Shows the details for a given site

Arguments:
  NAME=""      The name of the site configuration to show

```

`sites show` will print out detailed information for a single site. The name of the site can be found from the [sites list](#sites-list) command. Here is a sample command

```
datica -E "<your_env_alias>" sites show mywebsite.com
```

# Ssl

The `ssl` command offers access to subcommands that deal with SSL certificates. You cannot run the SSL command directly but must call a subcommand.

## Ssl Resolve

```

Usage: datica ssl resolve CHAIN PRIVATE_KEY HOSTNAME [OUTPUT] [-f]

Verify that an SSL certificate is signed by a valid CA and attempt to resolve any incomplete certificate chains that are found

Arguments:
  CHAIN=""         The path to your full certificate chain in PEM format
  PRIVATE_KEY=""   The path to your private key in PEM format
  HOSTNAME=""      The hostname that should match your certificate (i.e. "*.datica.com")
  OUTPUT=""        The path of a file to save your properly resolved certificate chain (defaults to STDOUT)

Options:
  -f, --force=false   If an output file is specified and already exists, setting force to true will overwrite the existing output file

```

`ssl resolve` is a tool that will attempt to fix invalid SSL certificates chains. A well formatted SSL certificate will include your certificate, intermediate certificates, and root certificates. It should follow this format

```
-----BEGIN CERTIFICATE-----
<Your SSL certificate here>
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
<One or more intermediate certificates here>
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
<Root CA here>
-----END CERTIFICATE-----
```

If your certificate only includes your own certificate, such as the following format shows

```
-----BEGIN CERTIFICATE-----
<Your SSL certificate here>
-----END CERTIFICATE-----
```

then the SSL resolve command will attempt to resolve this by downloading public intermediate certificates and root certificates. A general rule of thumb is, if your certificate passes the `ssl resolve` check, it will almost always work on the Datica platform. You can specify where to save the updated chain or omit the `OUTPUT` argument to print it to STDOUT.

Please note you all certificates and private keys should be in PEM format. You cannot use self signed certificates with this command as they cannot be resolved as they are not signed by a valid CA. Here are some sample commands

```
datica ssl resolve ~/mysites_cert.pem ~/mysites_key.key *.mysite.com ~/updated_mysites_cert.pem -f
datica ssl resolve ~/mysites_cert.pem ~/mysites_key.key *.mysite.com
```

## Ssl Verify

```

Usage: datica ssl verify CHAIN PRIVATE_KEY HOSTNAME [-s]

Verify whether a certificate chain is complete and if it matches the given private key

Arguments:
  CHAIN=""         The path to your full certificate chain in PEM format
  PRIVATE_KEY=""   The path to your private key in PEM format
  HOSTNAME=""      The hostname that should match your certificate (i.e. "*.datica.com")

Options:
  -s, --self-signed=false   Whether or not the certificate is self signed. If set, chain verification is skipped

```

`ssl verify` will tell you if your SSL certificate and private key are properly formatted for use with Datica's Compliant Cloud. Before uploading a certificate to Datica you should verify it creates a full chain and matches the given private key with this command. Both your chain and private key should be **unencrypted** and in **PEM** format. The private key is the only key in the key file. However, for the chain, you should include your SSL certificate, intermediate certificates, and root certificate in the following order and format.

```
-----BEGIN CERTIFICATE-----
<Your SSL certificate here>
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
<One or more intermediate certificates here>
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
<Root CA here>
-----END CERTIFICATE-----
```

This command also requires you to specify the hostname that you are using the SSL certificate for in order to verify that the hostname matches what is in the chain. If it is a wildcard certificate, your hostname would be in the following format: `*.datica.com`. This command will verify a complete chain can be made from your certificate down through the intermediate certificates all the way to a root certificate that you have given or one found in your system.

You can also use this command to verify self-signed certificates match a given private key. To do so, add the `-s` option which will skip verifying the certificate to root chain and just tell you if your certificate matches your private key. Please note that the empty quotes are required for checking self signed certificates. This is the required parameter HOSTNAME which is ignored when checking self signed certificates. Here are some sample commands

```
datica ssl verify ./datica.crt ./datica.key *.datica.com
datica ssl verify ~/self-signed.crt ~/self-signed.key "" -s
```

# Status

```

Usage: datica status [--historical]

Get quick readout of the current status of your associated environment and all of its services

Options:
  --historical=false    Output all of the services (past and present) 
```

`status` will give a quick readout of your environment's health. This includes your environment name, environment ID, and for each service the name, size, build status, deploy status, and service ID. Here is a sample command

```
datica -E "<your_env_alias>" status
datica -E "<your_env_alias>" status --historical
```

# Support-ids

```

Usage: datica support-ids

Print out various IDs related to your associated environment to be used when contacting Datica support

```

`support-ids` is helpful when contacting Datica support by submitting a ticket at https://datica.com/support. If you are having an issue with a CLI command or anything with your environment, it is helpful to run this command and copy the output into the initial correspondence with a Datica engineer. This will help Datica identify the environment faster and help come to resolution faster. Here is a sample command

```
datica -E "<your_env_alias>" support-ids
```

# Update

```

Usage: datica update

Checks for available updates and updates the CLI if a new update is available

```

`update` is a shortcut to update your CLI instantly. If a newer version of the CLI is available, it will be downloaded and installed automatically. This is used when you want to apply an update before the CLI automatically applies it on its own. Here is a sample command

```
datica update
```

# Users

The `users` command allows you to manage who has access to your environment through the organization that owns the environment. The users command can not be run directly but has three sub commands.

## Users List

```

Usage: datica users list

List all users who have access to the given organization

```

`users list` shows every user that belongs to your environment's organization. Users who belong to your environment's organization may access to your environment's services and data depending on their role in the organization. Here is a sample command

```
datica -E "<your_env_alias>" users list
```

## Users Rm

```

Usage: datica users rm EMAIL

Revoke access to the given organization for the given user

Arguments:
  EMAIL=""     The email address of the user to revoke access from for the given organization

```

`users rm` revokes a users access to your environment's organization. Revoking a user's access to your environment's organization will revoke their access to your organization's environments. Here is a sample command

```
datica -E "<your_env_alias>" users rm user@example.com
```

# Vars

The `vars` command allows you to manage environment variables for your code services. The vars command can not be run directly but has sub commands.

## Vars List

```

Usage: datica vars list [SERVICE_NAME] [--json | --yaml]

List all environment variables

Arguments:
  SERVICE_NAME=""   The name of the service containing the environment variables. Defaults to the associated service.

Options:
  --json=false   Output environment variables in JSON format
  --yaml=false   Output environment variables in YAML format

```

`vars list` prints out all known environment variables for the given code service. You can print out environment variables in JSON or YAML format through the `--json` or `--yaml` flags. Here are some sample commands

```
datica -E "<your_env_alias>" vars list code-1
datica -E "<your_env_alias>" vars list code-1 --json
```

## Vars Set

```

Usage: datica vars set [SERVICE_NAME] -v...

Set one or more new environment variables or update the values of existing ones

Arguments:
  SERVICE_NAME=""   The name of the service on which the environment variables will be set. Defaults to the associated service.

Options:
  -v, --variable    The env variable to set or update in the form "<key>=<value>"

```

`vars set` allows you to add new environment variables or update the value of an existing environment variable on the given code service. You can set/update 1 or more environment variables at a time with this command by repeating the `-v` option multiple times. Once new environment variables are added or values updated, a [redeploy](#redeploy) is required for the given code service to have access to the new values. The environment variables must be of the form `<key>=<value>`. Here is a sample command

```
datica -E "<your_env_alias>" vars set code-1 -v AWS_ACCESS_KEY_ID=1234 -v AWS_SECRET_ACCESS_KEY=5678
```

## Vars Unset

```

Usage: datica vars unset [SERVICE_NAME] VARIABLE

Unset (delete) an existing environment variable

Arguments:
  SERVICE_NAME=""   The name of the service on which the environment variables will be unset. Defaults to the associated service.
  VARIABLE=""       The name of the environment variable to unset

```

`vars unset` removes an environment variables from the given code service. Only the environment variable name is required to unset. Once environment variables are unset, a [redeploy](#redeploy) is required for the given code service to realize the variable was removed. Here is a sample command

```
datica -E "<your_env_alias>" vars unset code-1 AWS_ACCESS_KEY_ID
```

# Version

```

Usage: datica version

Output the version and quit

```

`version` prints out the current CLI version as well as the architecture it was built for (64-bit or 32-bit). This is useful to see if you have the latest version of the CLI and when working with Datica support engineers to ensure you have the correct CLI installed. Here is a sample command

```
datica version
```

# Whoami

```

Usage: datica whoami

Retrieve your user ID

```

`whoami` prints out the currently logged in user's users ID. This is used with Datica support engineers. Here is a sample command

```
datica whoami
```

# Worker

The `worker` command allows to deploy, list, remove, and scale the workers in a code service.

## Worker Deploy

```

Usage: datica worker deploy SERVICE_NAME TARGET

Deploy new workers for a given service

Arguments:
  SERVICE_NAME=""   The name of the service to use to deploy a worker
  TARGET=""         The name of the Procfile target to invoke as a worker

```

`worker deploy` allows you to start a background process asynchronously. The TARGET must be specified in your Procfile. Once the worker is started, any output can be found in your logging Dashboard or using the [logs](#logs) command. Here is a sample command

```
datica -E "<your_env_alias>" worker deploy code-1 mailer
```

## Worker List

```

Usage: datica worker list SERVICE_NAME

Lists all workers for a given service

Arguments:
  SERVICE_NAME=""   The name of the service to list workers for

```

`worker list` lists all workers and their scale for a given code service along with the number of currently running instances of each worker target. Here is a sample command

```
datica -E "<your_env_alias>" worker list code-1
```

## Worker Rm

```

Usage: datica worker rm SERVICE_NAME TARGET

Remove all workers for a given service and target

Arguments:
  SERVICE_NAME=""   The name of the service running the workers
  TARGET=""         The worker target to remove

```

`worker rm` removes a worker by the given TARGET and stops all currently running instances of that TARGET. Here is a sample command

```
datica -E "<your_env_alias>" worker rm code-1 mailer
```

## Worker Scale

```

Usage: datica worker scale SERVICE_NAME TARGET SCALE

Scale existing workers up or down for a given service and target

Arguments:
  SERVICE_NAME=""   The name of the service running the workers
  TARGET=""         The worker target to scale up or down
  SCALE=""          The new scale (or change in scale) for the given worker target. This can be a single value (i.e. 2) representing the final number of workers that should be running. Or this can be a change represented by a plus or minus sign followed by the value (i.e. +2 or -1). When using a change in value, be sure to insert the "--" operator to signal the end of options. For example, "datica worker scale code-1 worker -- -1"

```

`worker scale` allows you to scale up or down a given worker TARGET. Scaling up will launch new instances of the worker TARGET while scaling down will immediately stop running instances of the worker TARGET if applicable. Here are some sample commands

```
datica -E "<your_env_alias>" worker scale code-1 mailer 1
datica -E "<your_env_alias>" worker scale code-1 mailer -- -2
```

