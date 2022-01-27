#!/usr/bin/env bash

read -p "Enter the timezone code : " tz

url="https://timezone-api.herokuapp.com/api/$tz/"

touch time.json
time=$(curl -s $url | grep -o -P '(?<=:).*(?=})')
echo $time

rm time.json
