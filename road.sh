#/bin/sh!

$file
file=$1
no_lines=$(cat $file| wc -l)
rm $2
rm temp.txt
touch temp.txt
for j in $(seq 1 6)
do
    g.region raster=DTM$j
    r.profile input="DTM$j" file=$1 output="temp.txt" --overwrite
    cat temp.txt >>$2
done
rm temp.txt
