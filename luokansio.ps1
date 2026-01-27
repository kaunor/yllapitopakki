#Annetaan luotavan kansion nimi parametrinä.
param (
	[Parameter(Mandatory = $true)]
	[string]$kansio
)

#Ladataan yhteisetfunktiot.ps1, josta voidaan kutsua funktioita.
. .\yhteisetfunktiot.ps1

try{
	Kirjoita-Loki "Uuden kansion luonti aloitettu."
	#Luodaan kansio Luo-Kansio -funktiolla, joka on yhteisetfunktiot.ps1 tiedostossa.
	Luo-Kansio -nimi $kansio
	Kirjoita-Loki "Uusi kansio $kansio on luotu."
} catch {
	 Kirjoita-Loki "Virhe kansion luonnissa: $($_.Exception.Message)"
    Write-Output "Virhe: $($_.Exception.Message)"
    exit 1
}