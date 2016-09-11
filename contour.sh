#/bin/sh!

$file
file=$2
no_lines=$(cat $file| wc -l)

v.in.ascii -z z=3  --overwrite input=$1 output=fieldData
v.build map=fieldData

echo $no_lines

    for i in $(seq 1 $no_lines)
    do

        data=$(awk "NR>=$i&&NR<=$i" $file)
        var1=$(echo $data | cut -d',' -f1)
        var2=$(echo $data | cut -d',' -f2)

        echo "x1: " $var1 " y1: " $var2
        echo "next points"
        elev_val="DTM$i"
        contour_val="contourVec$i"
        g.region n=$var2 s=$((var2-1500)) e=$var1 w=$((var1-1000)) nsres=1 ewres=0.01
        v.surf.rst --overwrite input=fieldData layer=0 elev=$elev_val 
        r.contour --overwrite input=$elev_val output=$contour_val step=.5 cut=0
    done


