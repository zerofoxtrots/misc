# More or less a One-Liner port scanner for powershell.
# Credit: Not sure where I originally found this, but it's popped up on many blog posts. I have tweaked it slightly.

1..1024 | % { 
$tc = new-object Net.Sockets.TcpClient; 
$c = $tc.BeginConnect("192.168.1.1",$_,$null,$null);
$wait = $c.AsyncWaitHandle.WaitOne(500,$false);
$p = "$_"
If (-Not $Wait) {}
Else {$error.clear(); $tc.EndConnect($c) | out-Null 
    If ($Error[0]) {Write-warning ("{0} $_" -f $error[0].Exception.Message)} Else {'Port ' + $p + ' open!'}}
} 2> $null
