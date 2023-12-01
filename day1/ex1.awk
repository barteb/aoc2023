 {
    gsub(/[[:alpha:]]/, "");
    first = substr($0, 1, 1);
    last = substr($0, length($0), 1);
    coord = first last;
    sum = sum + coord;
 }
 END {
    print sum;
 }
