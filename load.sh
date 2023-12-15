#!/bin/bash

# Ini code buat di dalam Load Balancer. Jalanin satu-satu.

mkdir local

# Copy configurasi nginx
sudo cd ~/local
sudo cp default /etc/nginx/sites-available/default