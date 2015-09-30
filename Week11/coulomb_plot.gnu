set terminal png color
set size square
set xlabel "X - Distance (Ao)"
set ylabel "Y - Distance (Ao)"
set xrange [*:*]
set yrange [*:*]
plot 'output.dat' title "Alpha particle" with lines linetype 1, \
"< echo 0 0" title "Gold nucleus" with points pointtype 7 pointsize 2
