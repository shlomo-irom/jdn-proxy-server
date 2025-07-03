#!/bin/bash
set -euo pipefail

# עדכון המערכת והתקנת Docker
apt-get update -y
apt-get install -y docker.io
systemctl enable --now docker

# יצירת תיקייה לאחסון אתר
mkdir -p /opt/jdn-proxy/html

# יצירת עמוד HTML שמטמיע iframe לאתר JDN
cat > /opt/jdn-proxy/html/index.html <<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>JDN News Proxy</title>
  <style>
    html, body { margin: 0; padding: 0; height: 100%; }
    iframe { width: 100%; height: 100vh; border: none; }
  </style>
</head>
<body>
  <iframe src="https://www.jdn.co.il/" allowfullscreen></iframe>
</body>
</html>
HTML

# יצירת Dockerfile
cat > /opt/jdn-proxy/Dockerfile <<'DOCKER'
FROM nginx:alpine
COPY html/ /usr/share/nginx/html
DOCKER

# בניית מכולת Docker
cd /opt/jdn-proxy
docker build -t jdn-proxy:latest .

# הרצת המכולה על פורט 80 עם הפעלה אוטומטית אחרי אתחול
docker run -d --restart unless-stopped -p 80:80 jdn-proxy:latest

