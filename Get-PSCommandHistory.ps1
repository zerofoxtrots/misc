# Extremely valuable One-Liner to pull Powershell Command Line History for forensic purposes.
# Not as good as transcription logging, but pretty sure this one is on by default.
# There appears to be one file created per user found here: 
# C:\Users\<USER>\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt
# Author: Christopher Bennett

# TODO: Create a For Loop for every folder in C:\Users to extract this file automatically for each user and dump all files in 1 folder.
cat (Get-PSReadlineOption).HistorySavePath
