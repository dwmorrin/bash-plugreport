# ard2csv
# input: Apple Remote Desktop UNIX command output from multiple locations
# output: moves location to the first field until next location is found
# example input:
#   Some Computer Name (1.1.1.1)
#   01,baz,bar,etc
#   02,foo,bar,etc
#     ...
#   Another Computer Name (1.1.1.2)
#     ...
#
# expected output:
#   Some Computer Name (1.1.1.1),01,baz,bar,etc
#   Some Computer Name (1.1.1.1),02,foo,bar,etc
#     ...

BEGIN {
    FS = ","
    OFS = ","
}
NF < 2 && $0 != "" {
    location = $0
    next
}
$1 == "identifier" || $1 == "" {
    next
}
{
    print location, $0
}

