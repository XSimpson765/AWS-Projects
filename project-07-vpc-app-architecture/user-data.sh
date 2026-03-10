#!/bin/bash
yum update -y
yum install -y httpd

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Project 7 App</title>
</head>
<body>
  <h1>Project 7 - VPC App Architecture</h1>
  <p>This EC2 instance was deployed by Terraform in a private subnet behind an ALB.</p>
</body>
</html>
EOF

systemctl enable httpd
systemctl start httpd