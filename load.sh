#!/bin/bash

# Ini code buat di dalam Load Balancer. Jalanin satu-satu.

mkdir local # Buat folder untuk tempat menyimpan file yang dikirim dari pc operator

# keluar dari Vm load balancer, trs ke pc operator jalanin ini:
# # Kirim file nginx.conf ke nginx load balancer
# scp -i linuxLoad.pem nginx.conf azureuser@172.207.25.178:~/local/default

# Copy configurasi nginx
sudo cd ~/local # pergi ke folder local tempatnya file2 dr pc operator
sudo cp default /etc/nginx/sites-available/default # jalanin command ini untuk set konfigurasi load balancer