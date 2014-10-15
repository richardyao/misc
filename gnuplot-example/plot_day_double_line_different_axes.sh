#!/bin/bash

gnuplot<<EOF
set terminal png font "./msyh.ttf" size 1000,400
set output "./day_double_line_different_axes_20141013.png"
set xdata time
set timefmt "%Y-%m-%d %H:%M" 
set format x "%H:%M"
set ylabel "QPS (个)" offset graph 0.1,graph 0.57 rotate by 0  textcolor lt 1
set y2label "成功率 (%)" offset character -7,graph 0.57 rotate by 0 textcolor lt 2
set ytics textcolor lt 1
set y2tics textcolor lt 2
set y2range [0:110]
set xtics 7200
set grid
#unset border
#set border 31 lt -1
#set border 8 lt 2,31-8 lt -1
set border 31-8-2 lt -1
#set object 1 rectangle from graph 0,graph 0 to graph 1,graph 1 lw 5
#set object 1 rectangle from graph 0, graph 0 to graph 1,graph 0.005 lw 1 fillcolor lt 2 border lc lt 2
set object 1 rectangle from graph 0.998,graph 0 to graph 1,graph 1 lw 1 fs empty border lc lt 2
set object 2 rectangle from graph 0,graph 0 to graph 0.002,graph 1 lw 1 fs empty border lc lt 1
set title "2014-10-13 随机数曲线"
set key right top
plot "./day_double_line_0_20141013.data" using 1:3 title "QPS" with lines axes x1y1, "./day_double_line_1_20141013.data" using 1:3 title "成功率" with lines axes x1y2
EOF
