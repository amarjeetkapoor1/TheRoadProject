# TheRoadProject

## How to run:

cd ../Path/to/TheRoadProject

### For Generation section points:
This script will give you set of points *A1, A2 , A3 ...... An.* at particular distance *D* on given polyline representing the road. Plus a Set of points *(Pn1,Pn2)* perpendicular to a point at *P/2* distance apart from point An

* ```python TheRoad.py <inputFile.csv> <Section> <distance-between-two-sections-lines>```
* python TheRoad.py input.csv *P* *D*
* e.g.
       ```python TheRoad.py example/road.csv 10 40```


It will output two files: section.csv and and length.csv

### GRASS GIS Scripts:

1. First open GRASS and select/create Location

2. Run contour.sh

    ```bash contour.sh <DATA set for generating map> <File defining region for each map>```

    This script will generate contours in Grass and also raster and vector maps
for given set of data. Data set will be in CSV format `X|Y|Z` (You can refer
example/GrassData.txt). We can define region of maps in CSV format in another
CSV file containing only north, east, south, west values for given map. We can
also divide the full map into small maps to increase the speed of execution or
for many other purposes by providing more than one north, east, south, west
values for each smaller map.  (You can refer example/DM1.txt)

    *  e.g. ```bash contour.sh example/GrassData.txt example/DM1.txt```

3. Run road.sh

    ```bash road.sh <Input file of points to generate profile> <output file name> <Number of regions>```

    This script will generate RL points on given polyline (in form of CSV file in format *X,Y*  you can refer to example/road.csv)

    * e.g.
        ```bash road.sh example/road.csv Final.csv 6```

    Process the output file to remove entries with `*` as RL value

4. Run makeSection.sh

    ```bash makeSection.sh <List of section points> <Number of regions>```

    This script will generate RL points for given Sections (in form of CSV file generated by *TheRoad.py* you can refer to example/road.csv)

    * e.g. ```bash makeSection.sh section.csv 6```

### To get graph of output of TheRoad.py:
* ```sage plot.sage <inputFile.csv>```
* ```sage plot.sage road.csv```
