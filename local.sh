#!/bin/bash

# Ini code buat ngebantu di pc operator. Jalanin yang di perlukan.

# Ksh autority
sudo chown 600 linux.pem
sudo chown 600 linuxLoad.pem
sudo chown 600 app2_key.pem

# Akses ke VM
# ssh -i linux.pem azureuser@20.211.49.205 #app1
# ssh -i app2_key.pem azureuser@20.5.224.152 #app2
# ssh -i linuxLoad.pem azureuser@172.207.25.178 #loadBalancer

# Kirim file ke VM
# scp -i linux.pem <<file>> azureuser@20.211.49.205:~/local/<<file>>
# scp -i app2_key.pem <<file>> azureuser@20.5.224.152:~/local/<<file>>
# scp -i linuxLoad.pem <<file>> azureuser@172.207.25.178:~/local/<<file>>

# Kirim file app.py dan app di app1
scp -i linux.pem app.py azureuser@20.211.49.205:~/local/app.py
scp -i linux.pem app azureuser@20.211.49.205:~/local/default

# Kirim file app.py dan app di app2
scp -i app2_key.pem app.py azureuser@20.5.224.152:~/local/app.py
scp -i app2_key.pem app azureuser@20.5.224.152:~/local/default

# Kirim file nginx.conf ke nginx
scp -i linuxLoad.pem nginx.conf azureuser@172.207.25.178:~/local/default