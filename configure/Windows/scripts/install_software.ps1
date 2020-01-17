Write-Host "------------------------------------" -ForegroundColor Green
Write-Host "Installing chocolatey and boxstarter..."
. { Invoke-WebRequest -useb https://boxstarter.org/bootstrapper.ps1 } | Invoke-Expression
Get-Boxstarter -Force
Write-Host "Installing application via boxstarter..."
Install-BoxstarterPackage -PackageName boxstarter_install_script.txt -DisableReboots
Write-Host "------------------------------------" -ForegroundColor Green
Write-Host ""
Read-Host -Prompt "Setup is done, restart is needed, press [ENTER] to restart computer."
Restart-Computer
