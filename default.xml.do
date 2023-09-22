set -eu

# dirname
DIR="${2%/*}"
[ "$DIR" = "$2" ] && DIR="."
DIR="./$DIR"

redo-ifchange "$DIR/text.txt"

cat "$DIR/text.txt" > $3

DEPS=()
shopt -s nullglob
for DEP in "$DIR"/*/text.txt; do
    DEPS+=("${DEP%/*}/test.complete")
done
[ "${#DEPS[@]}" -eq 0 ] || redo-ifchange "${DEPS[@]}"

#redo-ifchange "$DIR/$2.xml"
