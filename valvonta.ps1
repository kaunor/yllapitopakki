#Annetaan valvottavan kansion tieto parametrinä.
param ( 
    [string]$Kansio
)
# Ladataan yhteisetfunktiot.ps1, josta voi kutsua funktioita käyttöön.
. .\yhteisetfunktiot.ps1
try {
    Kirjoita-Loki "Valvonta alkoi"
    # Tarkistetaan, että kansio on olemassa
    if (-not (Test-Path -Path $Kansio)) {
        throw "Kansiota ei löydy: $Kansio"
    }
    # Haetaan tiedostot ja lasketaan niiden määrä
    $maara = (Get-ChildItem $Kansio -File).Count
    Kirjoita-Loki "Tiedostoja kansiossa ${Kansio}: $maara"
    Write-Host "Tiedostoja kansiossa ${Kansio}: $maara"
} 
catch {
    Kirjoita-Loki "Virhe valvonnassa: $($_.Exception.Message)"
    Write-Host "Virhe: $($_.Exception.Message)"
}
