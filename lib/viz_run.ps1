# Function to read configuration file
function ReadFromConfigFile {
    $CONFIG_FILE_IN = $args[0]
    Get-Content $CONFIG_FILE_IN | Where-Object { $_.length -gt 0 } | Where-Object { !$_.StartsWith("#") } | ForEach-Object {
        $var = $_.Split('=', 2).Trim().Trim([char]0x0022)
        New-Variable -Scope Script -Name $var[0] -Value $var[1]
    }
}

# Set variables from configuration file
ReadFromConfigFile "${PSScriptRoot}\viz_config.sh"

# Install AzViz module
Install-Module -Name AzViz -AllowClobber -Confirm:$False -Force;
Import-Module AzViz;

# Get current Azure context
$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile;
$currentAzureContext = Get-AzContext;
$profileClient = New-Object Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient($azProfile);

# Check If Azure context exists
if ($currentAzureContext.Tenant.TenantId) {
    $token = $profileClient.AcquireAccessToken($currentAzureContext.Tenant.TenantId);
    # Check for token that matches USER_ID in config file
    if ($token.UserId -ne ${USER_ID}) {
        # Re-authenticate user
        Connect-AzAccount -UseDeviceAuthentication;
    }
    # Set Azure subscription to match SUB_NAME in config file
    Set-AzContext -SubscriptionName ${SUB_NAME};
}
else {
    # Re-authenticate user
    Connect-AzAccount -UseDeviceAuthentication;
    # Set Azure subscription to match SUB_NAME in config file
    Set-AzContext -SubscriptionName ${SUB_NAME};
};

# Run AzViz and export Azure diagram to location OUT_FILE from config file
Export-AzViz `
    -ResourceGroup ${RESOURCE_GROUP}.Split(",") `
    -Theme ${THEME} `
    -OutputFormat ${FORMAT} `
    -CategoryDepth ${DEPTH} `
    -LabelVerbosity ${VERBOSITY} `
    -ExcludeTypes ${EXCLUDE_TYPES}.Split(",") `
    -Splines ${SPLINES} `
    -OutputFilePath ${OUT_FILE};
