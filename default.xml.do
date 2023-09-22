set -eu

# dirname
DIR="${2%/*}"
[ "$DIR" = "$2" ] && DIR="."
DIR="./$DIR"

redo-ifchange "$DIR/text.txt"

cat "$DIR/text.txt" > $3

#redo-ifchange "$DIR/$2.xml"