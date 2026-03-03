#!/bin/bash
set -euo pipefail

dnf update -y
dnf install -y nginx

systemctl enable nginx
systemctl start nginx

TOKEN=$(curl -sX PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" || true)
META_HEADER=()
if [ -n "${TOKEN:-}" ]; then
  META_HEADER=(-H "X-aws-ec2-metadata-token: $TOKEN")
fi

INSTANCE_ID=$(curl -s "${META_HEADER[@]}" http://169.254.169.254/latest/meta-data/instance-id || echo "unknown")
AZ=$(curl -s "${META_HEADER[@]}" http://169.254.169.254/latest/meta-data/placement/availability-zone || echo "unknown")

cat > /usr/share/nginx/html/index.html <<EOF
<html>
  <head><title>Project 03 - Prod Web Platform</title></head>
  <body>
    <h1>✅ Project 03 Phase 1 is live</h1>
    <p><b>Instance:</b> ${INSTANCE_ID}</p>
    <p><b>AZ:</b> ${AZ}</p>
  </body>
</html>
EOF

systemctl restart nginx