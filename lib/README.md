# AzViz Docker - lib

1. Dockerfile [azure-powershell](https://hub.docker.com/_/microsoft-azure-powershell)

   * ```
      The image with the latest stable Azure PowerShell modules.
      Ubuntu 18.04
      docker pull mcr.microsoft.com/azure-powershell:latest
      ```
   * Copies script `viz_run.ps1` onto image.
   * Installs AzViz dependency [graphviz](https://graphviz.org/) on image.

2. `viz_run.ps1`
   * PowerShell script that reads configuration file `../viz_config.sh` and runs [AzViz](https://github.com/PrateekKumarSingh/AzViz) module.