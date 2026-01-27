function Luo-Kansio {
    param ([string]$Nimi)

    if (-not (Test-Path -Path $Nimi)) {
        New-Item -ItemType Directory -Path $Nimi | Out-Null
    }
}

function Kirjoita-Loki {
    param (
        [string]$Viesti,
        [string]$Tiedosto = "loki.txt"
    )
    "$((Get-Date).ToString('yyyy-MM-dd HH:mm:ss')) - $Viesti" |
        Out-File -FilePath $Tiedosto -Append -Force
}

