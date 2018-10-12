# One-Liner to dump all Groups and their associated users from a Windows host.
# Works on Windows 10 with PS version 5.1.16299.637, but not on 2008R2. Not sure about anything in between. Requires Elevation.
# Output format is GROUP_NAME :: USER1; USER2; USER3
# AUTHOR: Christopher Bennett

foreach($g in $(Get-LocalGroup)) { $m = (Get-LocalGroupMember -Group $g | select $_.Name); if($m -ne $null){Write-Host $g :: $($m -join "; ")} else{Write-Host $g :: "NONE"}}
