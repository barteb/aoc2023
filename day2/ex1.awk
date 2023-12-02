 BEGIN {
   FS = ";"
   max_red = 12;
   max_green = 13;
   max_blue = 14;
 }

 {
   match($1, /Game ([[:digit:]]+):/, game_nr);
   for (i = 1; i <= NF; i++) {
      hit = match($i, /([[:digit:]]+) red/, res);
      if (hit != 0 && res[1] > max_red) next;

      hit = match($i, /([[:digit:]]+) green/, res);
      if (hit != 0 && res[1] > max_green) next;

      hit = match($i, /([[:digit:]]+) blue/, res);
      if (hit != 0 && res[1] > max_blue) next;
   }
   sum = sum + game_nr[1];
 }

 END {
   print sum;
 }
