#! /bin/bash
THEME="Adwaita-Slim"
COMPILED_FOLDER="scss/compiled-css"
OUTPUT="Compiled"

# GTK2 #
COMMON_FOLDER="src/gtk-2.0/common-files"
ASSETS_FOLDER="src/gtk-2.0/variant-assets"
###
  echo "Compiling and copying..."
for variant in "" "-Dark"; do
  sassc -t expanded src/gnome-shell/gnome-shell${1,,}.scss $OUTPUT/$THEME${1^}/gnome-shell/gnome-shell.css
done

for variant in "","" "-Dark","-dark"; do
  if [ $1="-Dark" ];
    then
        sassc -t expanded src/gtk-3.0/gtk-dark.scss $OUTPUT/$THEME-Dark/gtk-3.0/gtk.css
        cp src/gtk-3.0/assets/*dark* $OUTPUT/$THEME-Dark/gtk-3.0/assets
        cp src/gtk-2.0/common-files/* $OUTPUT/$THEME-Dark/gtk-2.0/
        cp src/gtk-2.0/dark-variant-files/* $OUTPUT/$THEME-Dark/gtk-2.0/
        cp src/gtk-2.0/assets/dark-assets/* $OUTPUT/$THEME-Dark/gtk-2.0/assets
        cp src/gtk-2.0/gtkrc-dark $OUTPUT/$THEME-Dark/gtk-2.0/gtkrc
    fi
        sassc -t expanded src/gtk-3.0/gtk.scss $OUTPUT/$THEME/gtk-3.0/gtk.css
        sassc -t expanded src/gtk-3.0/gtk-dark.scss $OUTPUT/$THEME/gtk-3.0/gtk-dark.css
        cp src/gtk-3.0/assets/* $OUTPUT/$THEME/gtk-3.0/assets
        cp src/gtk-2.0/common-files/* $OUTPUT/$THEME/gtk-2.0/
        cp src/gtk-2.0/assets/light-assets/* $OUTPUT/$THEME/gtk-2.0/assets
        cp src/gtk-2.0/gtkrc-light $OUTPUT/$THEME/gtk-2.0/gtkrc
      break
done
