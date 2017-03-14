#/bin/sh!

$file
file=$1
no_lines=$(cat $file| wc -l)
rm -rf profileData
mkdir profileData
rm temp.txt
touch temp.txt
for j in $(seq 1 $2)
do
    g.region raster=DTM$j
    inc=0
    if [ $(($no_lines%2)) -eq 0 ]
    then
        name=0
        for i in $(seq 1 2 $no_lines)
        do  
            last=$i
            last=$((last+1))
            data=$(awk "NR>=$i&&NR<=$last" $file)
            var1=$(echo $data | cut -d' ' -f1)
            var2=$(echo $data | cut -d' ' -f2)
            x1=$(echo $var1 | cut -d',' -f1)
            y1=$(echo $var1 | cut -d',' -f2)
            x2=$(echo $var2 | cut -d',' -f1)                                     
            y2=$(echo $var2 | cut -d',' -f2)
            echo "x1: " $x1 " y1: " $y1
            echo "x2: " $x2 " y2: " $y2
            output_file="$name"".txt"
            echo "output file:  "$output_file
          
            r.profile input="DTM$j" coordinates=$x1,$y1,$x2,$y2 output="temp.txt" --overwrite
            a=1
            while read line 
            do 
                if [[ "$line" == *"*"* ]]
                then
                    a=0
                fi
            done<temp.txt
                
            if [ $(($a)) -eq 1 ]
            then
                cp temp.txt profileData/$output_file 
            fi
            name=$(($name+15))
        done
    else
        echo "Odd number of lines"
    fi 
done
rm temp.txt
