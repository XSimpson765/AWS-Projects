#!/bin/bash
dnf update -y
dnf install -y httpd

echo "<h1>Project 7 - VPC App Architecture</h1>" > /var/www/html/index.html

systemctl enable httpd
systemctl start httpd