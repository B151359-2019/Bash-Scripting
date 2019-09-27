#Initialize our FS and OFS
BEGIN {
FS="\t";OFS="_";
}

{
print field
}

END {

}

