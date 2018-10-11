# Simple script to list all 'dangerous' exclusions in Sysmon Configs.
# Check out Matt Graeber's BH2018 talk "Subverting Sysmon" for a better understanding on how attackers could bypass detection with these.
# AUTHOR: Christopher Bennett

$files = Get-ChildItem -Recurse -Path C:\path\to\configs -Include *.xml

$containsExclusions = @()
$endwithExclusions = @()
$beginwithExclusions = @()

foreach($file in $files) {
    # Grab XML file
    [xml]$config = Get-Content $file

    # Grab all exclude event types
    $nodes = $config.SelectNodes("//*[@onmatch='exclude']")

    # Loop through exclude event types
    foreach($node in $nodes){
        # For all children items of this node, add to respective list if it isn't a fully qualified condition filter
        foreach($blagh in $node.ChildNodes) {
            $blagh | where condition -EQ 'contains' | Add-Member File $file.Name
            $blagh | where condition -EQ 'end with' | Add-Member File $file.Name
            $blagh | where condition -EQ 'begin with' | Add-Member File $file.Name
            $containsExclusions += $($blagh | where condition -EQ 'contains')
            $endwithExclusions += $($blagh | where condition -EQ 'end with')
            $beginwithExclusions += $($blagh | where condition -EQ 'begin with')
        }
    }
}
5
# Lazy dump of all objects for analysis
$containsExclusions | Format-Table -AutoSize
$endwithExclusions
$beginwithExclusions
