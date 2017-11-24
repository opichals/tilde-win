REM Via Samba
rem net use h: \\192.168.56.10\standa
net use h: \\lxeon.local\standa

REM Via NFS
REM mount -o fileaccess=664 -o nolock \\192.168.56.10\mnt\exports\standa h:

REM To keep the mounts alive for 8 hours at least
REM see https://support.microsoft.com/en-us/kb/297684
REM net config server /autodisconnect:480
