#!/bin/bash

rm -rf Dependencies
mkdir -p Dependencies
libraries=(lzo cairo fontconfig freetype fribidi gdk-pixbuf gettext glib graphite2 harfbuzz icu4c libcroco libffi libpng librsvg pango pcre pixman)
for library in "${libraries[@]}"
do
   brew install $library
   rsync -r --prune-empty-dirs --include '*/' --include '*.h'  --include '*.dylib' --exclude '*' /usr/local/Cellar/$library Dependencies
   # do whatever on $i
done

DEPFILE="$(mktemp)"
CPFILE="$(mktemp)"

echo "targets:" > dependencies.yml
echo "  CairoSVG:" >> dependencies.yml


 dylibs=()
 while IFS= read -d $'\0' -r file ; do
     dylibs=("${dylibs[@]}" "$file")
 done < <(find Dependencies -type f -name '*.dylib' -print0)

touch $DEPFILE
touch $CPFILE

echo "    dependencies:" > $DEPFILE
echo "    sources:" > $CPFILE

for dependency in "${dylibs[@]}"
do 
 echo "    - sdk: \"$dependency\"" >> $DEPFILE
 echo "      root: SOURCE_ROOT" >> $DEPFILE
 echo "      embed: true" >> $DEPFILE
 echo "      implicit: true" >> $DEPFILE
 echo "      codeSign: true" >> $DEPFILE

 echo "         - path: \"$dependency\"" >> $CPFILE
 echo "           buildPhase:" >> $CPFILE
 echo "             copyFiles:" >> $CPFILE
 echo "               destination: frameworks" >> $CPFILE
 echo "               codeSign: true" >> $CPFILE
done

cat $DEPFILE >> dependencies.yml
cat $CPFILE >> dependencies.yml

rm Dependencies/gettext/0.20.2_1/include/textstyle/stdbool.h

xcodegen