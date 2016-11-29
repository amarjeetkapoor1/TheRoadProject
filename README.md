# TheRoadProject

## How to run: 

cd ../Path/to/TheRoadProject

### For Generation section points: 
This script will give you set of points *A1, A2 , A3 ...... An.* at particular distance *D* on given polyline representing the road. Plus a Set of points *(Pn1,Pn2)* perpendicular to a point at *P/2* distance apart from point An
* python TheRoad.py \<inputFile.csv> \<Section> \<distance-between-two-sections-lines>
* python  TheRoad.py input.csv *P* *D*
* e.g. 
    `python TheRoad.py road.csv 10 40`
    
### GRASS GIS Scripts:
First open GRASS and select/create Location

1. This script will generate contours in Grass and also raster and vector maps
for given set of data. Data set will be in CSV format `X|Y|Z` (You can refer
example/GrassData.txt). We can define region of maps in CSV format in another
CSV file containing only north, east, south, west values for given map. We can
also divide the full map into small maps to increase the speed of execution or
for many other purposes by providing more than one north, east, south, west
values for each smaller map.  (You can refer example/DM1.txt)
    * bash contour.sh \<DATA set for generating map> \<File defining region for each map>
    *  e.g. `bash contour.sh example/GrassData.txt example/DM1.txt`

2. This script will generate RL points on given polyline (in form of CSV file in format *X,Y*  you can refer to example/road.csv)
    * bash road.sh \<Input file of points to generate profile > \<output file name>
    * e.g.
        `bash road.sh example/road.csv Final.txt`

3. This script will generate RL points given Sections (in form of CSV file generated by *TheRoad.py* you can refer to example/road.csv)
    * bash makeSection.sh \<List of section points>
    * e.g. `bash makeSection.sh example/section.csv`

### To get graph of output of TheRoad.py:
* sage plot.sage \< inputFile.csv>
* `sage plot.sage road.csv` 
