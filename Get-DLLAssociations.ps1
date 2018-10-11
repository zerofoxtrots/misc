# One-Liner that uses WMI to pull all processes with a particular DLL associated.
# Credit: Not sure - this may be from Mark Russinovich.

get-process | %{$p= $_; $_.Modules}| where {$_.ModuleName -like "urlmon*"} | FT @{Label="PID"; expression={$p.id}},@{Label="Name"; expression={$p.ProcessName}},ModuleName -AutoSize
