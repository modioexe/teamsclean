$folderPath = "$env:USERPROFILE\AppData\Local\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams"

# Close Microsoft Teams
Close-Teams

# Check if the folder exists
if (Test-Path -Path $folderPath) {
    try {
        Stop-Process -Name "ms-teams" -Force
        Start-Sleep -Seconds 5
        # Delete the contents of the folder
        Remove-Item -Path "$folderPath\*" -Recurse -Force
        Write-Output "Contents of the folder have been successfully deleted."
        Write-Output "Starting Teams"
        Start-Process -File "$($env:USERProfile)\AppData\Local\Microsoft\WindowsApps\ms-teams.exe" -ArgumentList '--processStart "Teams.exe"'
    } catch {
        Write-Output "An error occurred: $_"
    }
} else {
    Write-Output "The specified folder does not exist."
}