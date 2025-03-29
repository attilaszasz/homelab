# install Starship first with this winget command: 
# winget install Starship.Starship
Invoke-Expression (&starship init powershell)


# This function uses GitHub Copilot to suggest shell commands based on the input command.
# The extension needs to be installed: https://docs.github.com/en/copilot/managing-copilot/configure-personal-settings/installing-github-copilot-in-the-cli
function GitHub_Suggest_Shell($cmd) {
    # The 'gh copilot suggest' command is used with the '-t shell' option to specify the type of suggestion.
    gh copilot suggest -t shell $cmd
}
# An alias '??' is set for the function 'GitHub_Suggest_Shell' for easier access.
Set-Alias ?? GitHub_Suggest_Shell


# This function sends a message to the Gotify server.
function Gotify_Send($msg) {
    $json = @{
         "message"=$msg
    } | ConvertTo-Json

    # The Invoke-RestMethod cmdlet sends an HTTP request to the Gotify server with the JSON string as the body.
    Invoke-RestMethod -Uri "https://[your.host.com]/message?token=[token]" -Method Post -Body $json -ContentType "application/json"
}

# An alias 'gotify' is set for the function 'Gotify_Send' for easier access.
Set-Alias gotify Gotify_Send


# This function copies the local public SSH key to a remote SSH host.
function ssh-copy-id([string]$sshHost)
{
    # The 'cat' command reads the local public SSH key.
    # The 'ssh' command connects to the remote SSH host.
    # The 'mkdir -p ~/.ssh' command ensures the .ssh directory exists on the remote host.
    # The 'touch ~/.ssh/authorized_keys' command ensures the authorized_keys file exists.
    # The 'chmod -R go= ~/.ssh' command sets the permissions of the .ssh directory to be accessible only by the owner.
    # The 'cat >> ~/.ssh/authorized_keys' command appends the public key to the authorized_keys file on the remote host.
    cat ~/.ssh/id_rsa.pub | ssh "$sshHost" "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"
}
