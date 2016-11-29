import csv

inputpoints= []

if(len(sys.argv)<2):
    exit

inputfile = open(sys.argv[1])
pointer = csv.reader(inputfile, delimiter=',')
parsed = ((float(row[0]), float(row[1]))
            for row in pointer)
for i in parsed:
    inputpoints.append(i)

sectionPoints = []
outputfile = open('section.csv')
pointer = csv.reader(outputfile, delimiter=',')
parsed = ((float(row[0]), float(row[1]))
            for row in pointer)
for i in parsed:
    sectionPoints.append(i)

lenghtpoints = []
outputfile = open('lenght.csv')
pointer = csv.reader(outputfile, delimiter=',')
parsed = ((float(row[0]), float(row[1]))
            for row in pointer)
for i in parsed:
    lenghtpoints.append(i)

z1 = point(inputpoints, color="red", size=1, legend_label="input points")
z2 = line(inputpoints, color="red", thickness=1)

#z3 = point(sectionPoints, color="blue", size=1, legend_label="distance points")
z4 = line(sectionPoints, color="yellow", thickness=2)

#z5 = point(lenghtpoints, color="black", size=10, legend_label="section points")
z5 = line(lenghtpoints, color="black", thickness=1)

z=z1+z2+z4+z5
z.set_legend_options(back_color=(0.9,0.9,0.9), shadow=False, loc=(.1,.9))

z.save('plotting.png')
