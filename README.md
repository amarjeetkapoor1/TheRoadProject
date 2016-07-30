# TheRoadProject

##How to run: 

cd ../Path/to/TheRoadProject

python TheRoad.py \<inputFile.csv> \<Section> \<distance-between-two-sections-lines>

bash contour.sh \<DATA set for generating map> \<File defining region for each map>

bash road.sh \<points to generate profile > \<output file name>

bash makeSection.sh \<List of section points>

##example:
   cd ../Path/to/TheRoadProject/example
   
   python ../TheRoad.py Area.csv 40 15
   
   bash ../contour.sh survey.txt DM1.txt
   
   bash ../road.sh Area.csv Final.txt
   
   bash ../makeSection.sh section.csv
    
###To get graph
sage plot.sage \< inputFile.csv>


