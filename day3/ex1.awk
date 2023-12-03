#  :see-no-evil:
 
 BEGIN {
    RS = "" ; 
    FS = "\n";
    i = 1;
 }
{
    while (i <= NF) {
        while(match($i, /([[:digit:]]+)/, found) != 0) {
            nr_start = RSTART;
            nr_end = RSTART + RLENGTH - 1;

            nr_cleared_subst = "."
            for (x = 1; x < length(found[1]); x++) {
                nr_cleared_subst = nr_cleared_subst ".";
            }

            hit = 0;

                if (i > 1) {
                    row_idx = i - 1;
                    row = $row_idx;
                    while (match(row, /([^\.[:digit:]])/, special) != 0) {
                        if (RSTART >= nr_start - 1 && RSTART <= nr_end +1){
                            sum = sum + found[1];
                            hit = 1;
                            sub(/([^\.[:digit:]])/, ".", row);
                            break;
                        }
                        sub(/([^\.[:digit:]])/, ".", row);
                    };
                }

                if (hit == 1) {
                    sub(/([[:digit:]]+)/, nr_cleared_subst, $i);
                    continue;
                }

                row = $i;
                while (match(row, /([^\.[:digit:]])/, special) != 0) {
                    if (RSTART >= nr_start - 1 && RSTART <= nr_end +1){
                        sum = sum + found[1];
                        hit = 1;
                        print "Added " found[1];
                            sub(/([^\.[:digit:]])/, ".", row);
                            break;
                    }
                    sub(/([^\.[:digit:]])/, ".", row);
                };

                if (hit == 1) {
                    sub(/([[:digit:]]+)/, nr_cleared_subst, $i);
                    continue;
                }

                if (i < NF) {
                    row_idx = i + 1;
                    row = $row_idx;
                    while (match(row, /([^\.[:digit:]])/, special) != 0) {
                        if (RSTART >= nr_start - 1 && RSTART <= nr_end + 1){
                            sum = sum + found[1];
                            print "Added " found[1];
                            sub(/([^\.[:digit:]])/, ".", row);
                            break;
                        }
                        sub(/([^\.[:digit:]])/, ".", row);
                    };
                }

                sub(/([[:digit:]]+)/, nr_cleared_subst, $i);
        }
        print i;
        i++;
    }
}
END {
 print sum;
}
