# One-liner to Clear all Windows Event Logs
# Author: Christopher Bennett

wevtutil el | Foreach-Object {wevtutil cl "$_"}
