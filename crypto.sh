#!usr/bin/env bash

read -p "Enter the coin name : " coin
read -p "Enter your national currency : " crncy
days=0
#read -p "Enter the number of days past today: " days
touch temp.json price.txt

curl -o temp.json -X 'GET' \
  'https://api.coingecko.com/api/v3/coins/'$coin'/market_chart?vs_currency='$crncy'&days='$days'' \
  -H 'accept: application/json' &> /dev/null

grep -o -P '(?<=,).*(?=]],"m)' temp.json > price.txt

while read val
do
	p=$val
done < price.txt

price=`printf "%.15f" $p`

echo "The value of $coin in $crncy is = $price"
rm temp.json
