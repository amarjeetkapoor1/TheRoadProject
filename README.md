# TheRoadProject

##How to run: 

cd ../Path/to/TheRoadProject

###For Generation section points: 
        This script will give you set of points <i>A<sub>1</sub>, A<sub>2</sub>, A<sub>3</sub> ...... A<sub>n</sub><i> at particular distance *D* on given polyline representing the road. Plus a Set of points *(P<sub>n1</sub>,P<sub>n2</sub>)* perpendicular to a point at *P/2* distance apart from point An
           
    * python TheRoad.py \<inputFile.csv> \<Section> \<distance-between-two-sections-lines>
    * python  TheRoad.py input.csv *P* *D*
    * e.g. 
    `python TheRoad.py input.csv 10 40`
    
    
### GIS Scripts:
    First open GRASS and select/create Location

1. This script will generate contours in Grass and also raster and vector maps
for given set of data. Data set will be in CSV format `X|Y|Z` (You can refer
example/GrassData.txt). We can define region of maps in CSV format in another
CSV file containing only north, east, south, west values for given map. We can
also divide the full map into small maps to increase the speed of execution or
for many other purposes by providing more than one north, east, south, west
values for each smaller map.  (You can refer example/DM1.txt)
    bash contour.sh \<DATA set for generating map> \<File defining region for each map>

bash road.sh \<points to generate profile > \<output file name>

bash makeSection.sh \<List of section points>
    
###To get graph of output of TheRoad.py:
sage plot.sage \< inputFile.csv>

##example:
   cd ../Path/to/TheRoadProject/example
   
   python ../TheRoad.py Area.csv 40 15
   
   bash ../contour.sh survey.txt DM1.txt
   
   bash ../road.sh Area.csv Final.txt
   
   bash ../makeSection.sh section.csv

