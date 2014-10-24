#!/bin/bash

gnuplot<<EOF
set terminal png font "./msyh.ttf" size 1000,400
set output "./day_single_line_20141013.png"
set xdata time
set timefmt "%Y-%m-%d %H:%M" 
set format x "%H:%M"
set ylabel "QPS (个)" offset graph 0.1,graph 0.57 rotate by 0 
set xtics 7200
set grid
set title "2014-10-13 某数据曲线"
set key right top
plot "./day_single_line_20141013.data" using 1:3 title "" with lines
EOF
