# JDN Proxy Server)

פרויקט זה מפעיל שרת Nginx בתוך Docker המאפשר פרוקסי לאתר החדשות JDN.  
המטרה היא להציג כיצד לפרוס שירות פרוקסי על AWS EC2 באמצעות Terraform ו-Docker.

---

## מבנה הפרויקט

- **docker/**  
  מכיל את ה-Dockerfile וקובץ ההגדרות של Nginx (jdn.conf) שמגדיר פרוקסי ל-JDN.

- **terraform/**  
  קבצי Terraform להקמת מכונת EC2 עם התקנת Docker בלבד (User Data מתקין Docker).

---

## איך להריץ

1. ודא שיש לך AWS CLI ו-Terraform מוגדרים.
2. שנה את הפרמטרים בקבצי Terraform לפי הצורך (מפתח SSH, אזור, ועוד).
3. הפעל Terraform:  
   ```bash
   cd terraform
   terraform init
   terraform apply

# jdn-proxy-server
# jdn-proxy-server
