param (
    [string]$Kone="localhost"
)

. .\yhteisetfunktiot.ps1

try {
    $tulos = Invoke-Command -ComputerName $Kone -ScriptBlock {
        @{
            Kone = hostname
            Aika = Get-Date
        }
    }
    
    Kirjoita-Loki "Etäajo onnistui $($tulos.Kone) ja aika $($tulos.Aika)"
    
}
catch {
    Kirjoita-Loki "Virhe etäajossa."
}
