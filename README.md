[![Community Extension](https://img.shields.io/badge/Community%20Extension-An%20open%20source%20community%20maintained%20project-FF4700)](https://github.com/camunda-community-hub/community)
[![Lifecycle: Stable](https://img.shields.io/badge/Lifecycle-Stable-brightgreen)](https://github.com/Camunda-Community-Hub/community/blob/main/extension-lifecycle.md#stable-)
![Compatible with: Camunda Platform 8](https://img.shields.io/badge/Compatible%20with-Camunda%20Platform%208-0072Ce)

# zbctl via NPM

[![npm version](https://badge.fury.io/js/zbctl.svg)](https://badge.fury.io/js/zbctl)

Zeebe CLI via NPM (and Docker).

[`zbctl`](https://github.com/camunda-community-hub/zeebe-client-go/blob/main/cmd/zbctl/zbctl.md) is the command-line client for [Camunda Platform 8](https://camunda.com), packaged for installation with [npm](https://www.npmjs.com/). The binaries are provided by the [Zeebe Go Client community project](https://github.com/camunda-community-hub/zeebe-client-go/)

## Installation

For Zeebe versions from 1.0.0-alpha7 and later:

```bash
npm i -g zbctl
```

For pre-1.0.0 versions of Zeebe, install with:

```bash
npm i -g zbctl@0
```

## Usage with Docker

You can use `zbctl` with Docker in CI, or on your local machine if you don't want to install it with [npm](https://www.npmjs.com/).

Here is an example of getting the status from a Camunda SaaS cluster. Grab the environment variables from your [Camunda Console](https://console.cloud.camunda.io/).

```bash
docker run  --env ZEEBE_ADDRESS=$ZEEBE_ADDRESS --env ZEEBE_CLIENT_ID=$ZEEBE_CLIENT_ID --env ZEEBE_CLIENT_SECRET=$ZEEBE_CLIENT_SECRET --env ZEEBE_AUTHORIZATION_SERVER_URL=$ZEEBE_AUTHORIZATION_SERVER_URL sitapati/zbctl status
```
## Usage

```
zbctl [options] [command]
```

```
zbctl is a command line interface designed to create and read resources inside zeebe broker.
It is designed for regular maintenance jobs such as:
        * deploying resources,
        * creating jobs and process instances
        * activating, completing or failing jobs
        * update variables and retries
        * view cluster status

Usage:
  zbctl [command]

Available Commands:
  activate    Activate a resource
  broadcast   Broadcast a signal
  cancel      Cancel resource
  complete    Complete a resource
  completion  Generate the autocompletion script for the specified shell
  create      Create resources
  delete      Delete resources
  deploy      Deploys new resources for each file provided
  evaluate    Evaluate resources
  fail        Fail a resource
  generate    Generate documentation
  help        Help about any command
  publish     Publish a message
  resolve     Resolve a resource
  set         Set a resource
  status      Checks the current status of the cluster
  throwError  Throw an error
  update      Update a resource
  version     Print the version of zbctl

Flags:
      --address string            Specify a contact point address. If omitted, will read from the environment variable 'ZEEBE_ADDRESS' (default '127.0.0.1:26500')
      --audience string           Specify the resource that the access token should be valid for. If omitted, will read from the environment variable 'ZEEBE_TOKEN_AUDIENCE'
      --authority string          Overrides the authority used with TLS virtual hosting. Specifically, to override hostname verification in the TLS handshake. It does not change what host is actually connected to. If omitted, will read from the environment variable 'ZEEBE_OVERRIDE_AUTHORITY'
      --authzUrl string           Specify an authorization server URL from which to request an access token. If omitted, will read from the environment variable 'ZEEBE_AUTHORIZATION_SERVER_URL' (default "https://login.cloud.camunda.io/oauth/token/")
      --certPath string           Specify a path to a certificate with which to validate gateway requests. If omitted, will read from the environment variable 'ZEEBE_CA_CERTIFICATE_PATH'
      --clientCache string        Specify the path to use for the OAuth credentials cache. If omitted, will read from the environment variable 'ZEEBE_CLIENT_CONFIG_PATH' (default "/home/falko/.camunda/credentials")
      --clientId string           Specify a client identifier to request an access token. If omitted, will read from the environment variable 'ZEEBE_CLIENT_ID'
      --clientSecret string       Specify a client secret to request an access token. If omitted, will read from the environment variable 'ZEEBE_CLIENT_SECRET'
  -h, --help                      help for zbctl
      --host string               Specify the host part of the gateway address. If omitted, will read from the environment variable 'ZEEBE_HOST' (default '127.0.0.1')
      --insecure                  Specify if zbctl should use an unsecured connection. If omitted, will read from the environment variable 'ZEEBE_INSECURE_CONNECTION'
      --port string               Specify the port part of the gateway address. If omitted, will read from the environment variable 'ZEEBE_PORT' (default '26500')
      --requestTimeout duration   Specify the default timeout for all requests. Example values: 300ms, 50s or 1m (default 10s)
      --scope string              Optionally specify the client token scope used when fetching credentials. If omitted, will read from the environment variable 'ZEEBE_TOKEN_SCOPE'

Use "zbctl [command] --help" for more information about a command.
```

## Update

If you want to submit a PR to update the package with a newer version of `zbctl`, you need to:

1. Update the package version in `package.json` to match the Zeebe release version number.
2. Download the new `zbctl` binaries from the [Zeebe Go Client releases page](https://github.com/camunda-community-hub/zeebe-client-go/releases) into the `bin` folder,  renaming them appropriately.
3. Make the new binaries executable.

The following BASH script demonstrates how to download and rename the `zbctl` binaries:

```sh
export ZBCTL_VERSION=8.6.0
wget -O bin/zbctl-cli.darwin https://github.com/camunda-community-hub/zeebe-client-go/releases/download/v$ZBCTL_VERSION/zbctl.darwin
wget -O bin/zbctl-cli.exe https://github.com/camunda-community-hub/zeebe-client-go/releases/download/v$ZBCTL_VERSION/zbctl.exe
wget -O bin/zbctl-cli.linux https://github.com/camunda-community-hub/zeebe-client-go/releases/download/v$ZBCTL_VERSION/zbctl

# Make the new binaries executable
chmod +x bin/*
```
