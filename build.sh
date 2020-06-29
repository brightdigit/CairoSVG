libraries=(cairo fontconfig freetype fribidi gdk-pixbuf gettext glib graphite2 harfbuzz icu4c libcroco libffi libpng librsvg pango pcre pixman)
for library in "${libraries[@]}"
do
   rsync -r --prune-empty-dirs --include '*/' --include '*.h'  --include '*.dylib' --exclude '*' /usr/local/Cellar/$library Dependencies
   # do whatever on $i
done
