#!/bin/bash 

# Remove if previous deployment folder exists
rm -rf /var/www/sample_app/prev-deployment

# Backup current deployment 
mv /var/www/sample_app/deployment /var/www/pisirpaylas/prev-deployment

# Create new deployment folder and make nginx owner
mkdir /var/www/sample_app/deployment

chown apache:apache /var/www/sample_app/deployment
