FROM mcr.microsoft.com/azure-powershell:latest

COPY lib/viz_run.ps1 /etc
RUN chmod +x /etc/viz_run.ps1
RUN apt-get update && \
apt-get install graphviz -y
RUN ["mkdir", "/etc/azviz"]

# PowerShell bug workaround
# https://github.com/PowerShell/PSReadLine/issues/670#issuecomment-921040014
CMD ["/bin/sh","-c","while sleep 1000; do :; done"]
