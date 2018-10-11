# One-Liner to list all AV Signatures on modern Windows hosts
# Credit: Not sure where this one came from, maybe Matt Graeber.

(Get-MpThreatCatalog).ThreatName | Group { $_.Split(':')[0] } | Sort Count -Descending
