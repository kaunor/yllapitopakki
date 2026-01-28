#Lataa yhteiset funktiot käyttöön.
. .\yhteisetfunktiot.ps1

try {
	$asema = Get-PSDrive C
	$vapaa = [math]::Round($asema.Free / 1GB, 2)
	Kirjoita-Loki "C:-asemalla vapaata tilaa: $vapaa GB"
}
catch {
	Kirjoita-Loki "Virhe levytilan tarkastuksessa: $($_.Exception.Message)"
    Write-Host "Virhe: $($_.Exception.Message)"
}