 BEGIN {
   FS = ";"
 }

 {
   max_red = 0;
   max_green = 0;
   max_blue = 0;

   for (i = 1; i <= NF; i++) {
      match($i, /([[:digit:]]+) red/, res);
      max_red = res[1] > max_red ? res[1] : max_red;

      match($i, /([[:digit:]]+) green/, res);
      max_green = res[1] > max_green ? res[1] : max_green;

      match($i, /([[:digit:]]+) blue/, res);
      max_blue = res[1] > max_blue ? res[1] : max_blue;
   }

   sum = sum + (max_green * max_red * max_blue);
 }

 END {
   print sum;
 }