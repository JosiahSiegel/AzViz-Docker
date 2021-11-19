# AzViz (Azure Visualizer) Docker

![](https://badgen.net/badge/icon/gitguardian/green?icon=gitguardian&label)
[![Open in Visual Studio Code](https://open.vscode.dev/badges/open-in-vscode.svg)](https://open.vscode.dev/JosiahSiegel/AzViz-Docker)

Donate to [AzViz Developer](https://github.com/PrateekKumarSingh/AzViz#readme)

## Synopsis

Dockerized [AzViz](https://github.com/PrateekKumarSingh/AzViz), bypassing the requirement to install [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.2) and [Azure](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps) modules locally.

## Steps

 1. Update configuration file `viz_config.sh`:
    * To init: `cp -n sample.viz_config.sh viz_config.sh`
 2. Connect to **Azure** when prompted:
    * ```*WARNING: To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code XXXXXXX to authenticate.```
 3. Run `./run_azviz.sh`

## Quick start

```sh
cp -n sample.viz_config.sh viz_config.sh
# Update viz_config.sh
./run_azviz.sh
```

## Dependencies

 * [Docker](https://docs.docker.com/get-docker/)
