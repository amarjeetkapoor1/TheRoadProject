import csv
from math import sqrt,pow
import sys
#set Variables
if(len(sys.argv)<4):
    exit

inputfile = open(sys.argv[1])
N= float(sys.argv[2])
lenght=float(sys.argv[3])

#End


pointer = csv.reader(inputfile, delimiter=',')


points = []

for i in pointer:
    points.append(i)

distanceList = []

#Finding Distance
for i in range(len(points)-1):
#    print(points[i+1])
    coor1 = points[i]
    coor2 = points[i+1]
    dis = sqrt(pow((float(coor2[0]) - float(coor1[0])),2)+pow((float(coor2[1]) - float(coor1[1])), 2))
    distanceList.append(dis)


output=open('length.csv', 'wb')
writer = csv.writer(output)
output=open('section.csv', 'wb')
writer2 = csv.writer(output)
currentp=-lenght;
i=0;
while(i<(len(points)-1)):
    currentp=lenght+currentp;
    if(currentp>distanceList[i]):
        currentp=currentp-distanceList[i];
        i = i+1
        if(i>(len(points)-2)):

            break;
    # finding points after lenght
    x3 = float(float(points[i+1][0]) - float(points[i][0]))
    y3 = float(float(points[i+1][1]) - float(points[i][1]))
    u = float(sqrt(float(pow(x3, 2)) + float(pow(y3, 2))))
    x31 = (float(x3/u) * currentp) + float(points[i][0])
    y31 = (float(y3/u) * currentp) + float(points[i][1])
    
    s=[str(x31),str(y31)]
    writer.writerow(s)
    P1x = x31 + (N/2)*y3/u
    P1y = y31 - (N/2)*x3/u
    P2x = x31 - (N/2)*y3/u
    P2y = y31 + (N/2)*x3/u
    
    #Section points    
    s=[str(P1x),str(P1y)]
    writer2.writerow(s)
    writer2.writerow([str(P2x),str(P2y)])
