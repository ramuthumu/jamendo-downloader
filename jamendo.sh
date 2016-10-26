#!/bin/bash
rm -f link.txt
echo "paste the link: "
read link
dir=$(echo $link | awk -F/ '{print $6}')

lynx --dump $link | grep -o 'track/[0-9]*' >> link.txt

for i in $(cat link.txt)
do
aria2c -x 16 -d "$dir" https://mp3d.jamendo.com/download/$i/mp32/
done

rm -f index.html 
