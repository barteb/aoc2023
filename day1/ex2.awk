 BEGIN {
    map["one"] = "1";
    map["two"] = "2";
    map["three"] = "3";
    map["four"] = "4";
    map["five"] = "5";
    map["six"] = "6";
    map["seven"] = "7";
    map["eight"] = "8";
    map["nine"] = "9";
 }
 
 {
    x = $0

    while (match(x, /(one|two|three|four|five|six|seven|eight|nine)/)) {
        nr = substr(x, RSTART, RLENGTH);
        p1 = substr(x, 0, RSTART - 1);
        p3 = substr(x, RSTART + RLENGTH - 1, length(x) - RLENGTH + 1);
        x = sprintf("%s%s%s", p1, map[nr], p3)
    }

    gsub(/[[:alpha:]]/, "", x);

    first = substr(x, 1, 1);
    last = substr(x, length(x), 1);
    coord = first last;
    sum = sum + coord;
 }

 END {
    print sum;
 }