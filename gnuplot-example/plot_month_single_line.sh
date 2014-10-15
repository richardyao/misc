#!/bin/bash

gnuplot<<EOF
set terminal png font "./msyh.ttf" size 1000,400
set output "./month_single_line_20141013.png"
set xdata time
set timefmt "%Y-%m-%d" 
set format x "%m-%d"
set ylabel "某数据 (个)" offset character 7,graph 0.57 rotate by 0 
#set xtics 172800
set xtics "2014-09-13",259200
set xrange ["2014-09-13":"2014-10-13"]
#set yrange [0:]
set grid
set title "2014-10-13 某数据曲线"
set key right top
plot "./month_single_line_20141013.data" using 1:2 title "" with lines
EOF
