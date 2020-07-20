#!/bin/bash

function join_by { local IFS="$1"; shift; echo "$*"; }

rm -rf Dependencies
mkdir -p Dependencies

libraries=(lzo cairo fontconfig freetype fribidi gdk-pixbuf gettext glib graphite2 harfbuzz icu4c libcroco libffi libpng librsvg pango pcre pixman)

if (( $UPDATE_DEPS )); then
  echo "Updating Homebrew..."
  brew rm  --ignore-dependencies --force ${libraries[*]}
  brew update
else
  echo "Disabling Homebrew Auto-Update..."
  HOMEBREW_NO_AUTO_UPDATE=1
fi


brew install ${libraries[*]}

if (( $UPDATE_DEPS )); then
  echo "Upgrading Homebrew..."
  brew upgrade --build-from-source ${libraries[*]}
fi

for library in "${libraries[@]}"
do
   rsync -r --prune-empty-dirs --include '*/' --include '*.h'  --include '*.dylib' --exclude '*' /usr/local/Cellar/$library Dependencies
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
 echo "           group: Frameworks" >> $CPFILE
 echo "           buildPhase:" >> $CPFILE
 echo "             copyFiles:" >> $CPFILE
 echo "               destination: frameworks" >> $CPFILE
 echo "               codeSign: true" >> $CPFILE
done

cat $DEPFILE >> dependencies.yml
cat $CPFILE >> dependencies.yml

rm Dependencies/gettext/0.20.2_1/include/textstyle/stdbool.h

brew install xcodegen
brew link xcodegen

xcodegen
