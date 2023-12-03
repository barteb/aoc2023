 #  :see-no-evil:

 BEGIN {
    RS = "" ; 
    FS = "\n";
    i = 1;
 }
{
    while (i <= NF) {
        while (match($i, /(\*)/) != 0) {
            gear_loc = RSTART;

            # find numbers around the gear

            nrs_found = 0;

            if (i > 1) {
                row_idx = i - 1;
                row = $row_idx;
                while (match(row, /([[:digit:]]+)/, found_nr) != 0) {
                    if ((RSTART >= gear_loc - 1 && RSTART <= gear_loc + 1) || (RSTART + RLENGTH - 1 >= gear_loc - 1 && RSTART + RLENGTH - 1 <= gear_loc + 1)) {
                        nrs_found++;
                        nrs[nrs_found] = found_nr[1];
                    }
                    subst = "."
                    for (x = 1; x < length(found_nr[1]); x++) {
                        subst = subst ".";
                    }
                    sub(/([[:digit:]]+)/, subst, row);
                    # print row;
                };
            }


            row = $i;
            while (match(row, /([[:digit:]]+)/, found_nr) != 0) {
                    if ((RSTART >= gear_loc - 1 && RSTART <= gear_loc + 1) || (RSTART + RLENGTH - 1 >= gear_loc - 1 && RSTART + RLENGTH - 1 <= gear_loc + 1)) {
                        nrs_found++;
                        nrs[nrs_found] = found_nr[1];
                    }
                    subst = "."
                    for (x = 1; x < length(found_nr[1]); x++) {
                        subst = subst ".";
                    }
                    sub(/([[:digit:]]+)/, subst, row);
            };



            if (i < NF) {
                row_idx = i + 1;
                row = $row_idx;
                while (match(row, /([[:digit:]]+)/, found_nr) != 0) {
                    if ((RSTART >= gear_loc - 1 && RSTART <= gear_loc + 1) || (RSTART + RLENGTH - 1 >= gear_loc - 1 && RSTART + RLENGTH - 1 <= gear_loc + 1)) {
                        nrs_found++;
                        nrs[nrs_found] = found_nr[1];
                    }
                    subst = "."
                    for (x = 1; x < length(found_nr[1]); x++) {
                        subst = subst ".";
                    }
                    sub(/([[:digit:]]+)/, subst, row);
                };
            }

            if (nrs_found == 2) {
                sum = sum + (nrs[1] * nrs[2])
            }

            for (t = 1; t <= nrs_found; t++) {
                print "GEAR " i " " gear_loc;
                print nrs[t];
            }

            sub(/\*/, ".", $i);
            print $i;

        }
        i++;

    }
}

END {
    print sum;
}