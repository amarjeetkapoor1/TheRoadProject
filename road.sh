#/bin/sh!

$file
file='Area.csv'
no_lines=$(cat $file| wc -l)

for j in $(seq 1 6)
do
    g.region raster=DTM$j
    r.profile input="DTM$j" file='Area.csv' output="temp.txt" --overwrite
    cat temp.txt >>final.txt
done
