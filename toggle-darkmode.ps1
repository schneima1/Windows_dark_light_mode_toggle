$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"

$apps = Get-ItemProperty -Path $path -Name AppsUseLightTheme
$system = Get-ItemProperty -Path $path -Name SystemUsesLightTheme

# Wenn aktuell Light Mode → auf Dark wechseln
if ($apps.AppsUseLightTheme -eq 1) {
    Set-ItemProperty $path AppsUseLightTheme 0
    Set-ItemProperty $path SystemUsesLightTheme 0
    Write-Output "Dark Mode aktiviert 🌙"
}
# sonst → Light Mode
else {
    Set-ItemProperty $path AppsUseLightTheme 1
    Set-ItemProperty $path SystemUsesLightTheme 1
    Write-Output "Light Mode aktiviert ☀️"
}