#!/bin/bash

gnuplot<<EOF
set terminal png font "./msyh.ttf" size 1000,400
set output "./day_double_line_20141013.png"
set xdata time
set timefmt "%Y-%m-%d %H:%M" 
set format x "%H:%M"
set ylabel "随机数 (个)" offset graph 0.1,graph 0.57 rotate by 0 
set xtics 7200
set grid
set title "2014-10-13 随机数曲线"
set key right top
plot "./day_double_line_0_20141013.data" using 1:3 title "aaa" with lines, "./day_double_line_1_20141013.data" using 1:3 title "bbb" with lines
EOF
