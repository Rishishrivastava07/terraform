#!/bin/bash

sudo dnf update -y
sudo dnf install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

echo "<h1>Nginx has been installed and started successfully!</h1>" | sudo tee /var/www/html/index.html