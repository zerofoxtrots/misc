# Script to grep recursively through a directory structure and regex search through certain files for passwords
# Commandlet Reference: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-string?view=powershell-6
# Author: Christopher Bennett

# Create our lists of extensions and patterns
# TODO: Need to develop a better list of extensions and patterns.
$exts = @("*.txt", "*.xml", "*.conf", "*.key", "*.crt", "*.pem", "*.pfx","*.kirbi")
$pats = @("password","pass","passwd","cpasword","\$1\$","\$2a\$","\$2y\$","\$5\$","\$6\$")

# Outer FOR loop iterates through file extensions
For ($i=0; $i -lt $exts.Length; $i++) {
    # Inner FOR loop iterates through patterns we're looking for
    For ($j=0; $j -lt $pats.Length; $j++) {
        sls -path $exts[$i] -pattern $pats[$j]
    }
}
