# One-liner which grabs the host product key on newer Windows Machines. Great for working in lab environments
# where I occasionally need to destroy a VM and stand up a new one with the same product key.
# Author: Christopher Bennett

(Get-WmiObject -query 'select * from SoftwareLicensingService').OA3XOriginalProductKey
