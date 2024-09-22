#Auteur: Elvis DELORMEAU
# Titre: supp_applis_win11.ps1
# Date de création: 22/09/2024
# Version: v1
# Commentaires: Supprime les applications natives qui sont inutiles. Retrouvez les informations de lancement du script dans le fichier README.md


# Liste des applications à désinstaller
$appsToRemove = @(
    "Microsoft.3DBuilder"
    "Microsoft.BingWeather"
    "Microsoft.GetHelp"
    "Microsoft.Getstarted" 
    "Microsoft.Messaging"
    "Microsoft.MicrosoftOfficeHub"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.OneConnect"
    "Microsoft.People"
    "Microsoft.SkypeApp"
    "Microsoft.WindowsAlarms"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.XboxApp"
    "Microsoft.ZuneMusic"
    "Microsoft.ZuneVideo"
)

# Boucle pour désinstaller chaque application
foreach ($app in $appsToRemove) {
    try {
        Write-Host "Désinstallation de $app..."
        Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
        Get-AppXProvisionedPackage -Online | Where-Object DisplayName -eq $app | Remove-AppxProvisionedPackage -Online
    }
    catch {
        Write-Host "Erreur lors de la désinstallation de $app : $_"
    }
}

Write-Host "Opération terminée."