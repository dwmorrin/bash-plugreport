# input == output of `plutil -p Info.plist`
# ext=filename extension, passed by script
BEGIN {
    FS = " => "
    exec = ""
    vers = ""
    sign = ""
    iden = ""
}
{ 
    gsub(/[",]/, "")
}
/ShortVersion/ {
    vers = $2
}
/Executable/ {
    exec = $2
}
/Identifier/ {
    iden = $2
}
/Signature/ {
    sign = $2
}
END {
    OFS = ","
    print  iden, sign, exec, ext, vers
}
