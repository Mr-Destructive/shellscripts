#!usr/bin/env bash

read -p "Enter your email : " sender
read -p "Enter recipient email : " reciever
read -p "Enter your Google App password : " gapp

read -p "Enter the subject of mail : " sub
echo "Enter the body of mail : "
cat > tempfile.txt
body=$(cat tempfile.txt)
rm tempfile.txt


curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
  --mail-from $sender \
  --mail-rcpt $reciever\
  --user $sender:$gapp \
  -T <(echo -e "From: ${sender}
To: ${reciever}
Subject:${sub}

 ${body}")

