#/bin/sh!


#This script will generate contours in Grass and also raster and vector maps
#for given set of data. Data set will be in CSV format `X|Y|Z` (You can refer
#example/GrassData.txt). We can define region of maps in CSV format in another
#CSV file containing only north, east, south, west values for given map. We can
#also divide the full map into small maps to increase the speed of execution or
#for many other purposes by providing more than one north, east, south, west
#values for each smaller map.  (You can refer example/DM1.txt)


############# Delete all --overwrite If running script for first time ##########


#Provide input points and plot them in vector map.
v.in.ascii -z z=3  --overwrite input=$1 output=fieldData
v.build map=fieldData


#Count numbers of regions to be created
no_lines=$(cat $f2| wc -l)

echo $no_lines

#create Map for all the regions
    for i in $(seq 1 $no_lines)
    do
        
        #getting data from input file describing the region. 
        data=$(awk "NR>=$i&&NR<=$i" $file)
        var1=$(echo $data | cut -d',' -f1)
        var2=$(echo $data | cut -d',' -f2)
        var3=$(echo $data | cut -d',' -f3)
        var4=$(echo $data | cut -d',' -f4)
        
        echo "next points"
        echo "North: " $var1 " South: " $var2  " East: " $var2  " West: " $var2
        
        #name of new raster MAP
        elev_val="DTM$i"
        #name of new vector map
        contour_val="contourVec$i"
        
        # Create region with resolution in y direction "nsres=1" and x direction "ewres=0.01"
        g.region n=$var1 s=$var2 e=$var3 w=$var4 nsres=1 ewres=0.01
        
        # Create vector map with input as fieldData 
        v.surf.rst --overwrite input=fieldData layer=0 elev=$elev_val 
        # Create raster map  
        r.contour --overwrite input=$elev_val output=$contour_val step=.5 cut=0
    done


