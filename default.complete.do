set -eu

redo-ifchange "$2.xml"

# dirname
DIR="${2%/*}"
[ "$DIR" = "$2" ] && DIR="."

for d in "$DIR"/*; do
    [ -d $d ] || continue
    redo-ifchange "$d/$2.complete"
done
   
