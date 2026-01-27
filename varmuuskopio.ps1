#Annetaan Lähde ja Kohde parametrit varmuuskopioinnille.
param (
    [Parameter(Mandatory = $true)] #Kysyy parametriä, jos sitä ei ole annettu
    [string]$Lahde,
    [string]$Kohde = "Varmuuskopio"
)

#Ladataan yhteisetfunktiot.ps1 käyttöön, josta voi kutsua funktioita.
. .\yhteisetfunktiot.ps1

# Lisätään päivämäärä kohdekansion nimeen.
$paiva = Get-Date -Format "yyyyMMdd"
$Kohde = "$Lahde-$paiva"

#Funktio tiedostojen kopioinnista lähtökansiosta maalikansioon.
function Kopio-Tiedostot {
    param (
        [string]$Lahto,
        [string]$Maali
    )
    Copy-Item "$Lahto\*" $Maali -Recurse -Force -ErrorAction Stop
}

# -------------------------
# Pääohjelma
# -------------------------
try {
    Kirjoita-Loki "Varmuuskopiointi aloitettu"
	#Testaan, että onko Lahde-kansio olemassa.
    if (-not (Test-Path -Path $Lahde)) {
        throw "Lähdekansiota ei löydy: $Lahde"
    }

    Luo-Kansio -Nimi $Kohde
    Kopio-Tiedostot -Lahto $Lahde -Maali $Kohde

    Kirjoita-Loki "Varmuuskopio onnistui: $Lahde -> $Kohde"
    Write-Output "Varmuuskopio on valmis: $Lahde -> $Kohde"
}
catch {
    Kirjoita-Loki "Virhe varmuuskopioinnissa: $($_.Exception.Message)"
    Write-Output "Virhe: $($_.Exception.Message)"
    exit 1
}

