#!/bin/sh

#just incase for non sh error
printf "${cr}"
#constants
name="FP"
version="0.4"
help_text="
$name v$version : Font Preview

Arguments:

-h, --help                 show this help page.
-fs, --fontsize                      font size.
-fg, --foreground             foreground color.
-bg, --background             background color.
-ws, --windowsize                  window size.
-pt, --previewtext                preview text.
-lf, --linear-fg    linear foreground gradient.
-lb, --linear-bg    linear background gradient.
-rf, --radial-fg    radial foreground gradient.
-rb, --radial-bg    radial background gradient.
-iv, --imageviewer                image viewer.
"
preview_text="
A B C D E F G H I J K L M
N O P Q R S T U V W X Y Z
a b c d e f g h i j k l m
n o p q r s t u v w x y z
0 1 2 3 4 5 6 7 8 9
' \" ? ! ( ~ ) [ # ] { @ }
/ & < - + = > $ : ; , . *
"

#variables
window_size="600x400"
font_size="15"
foreground="#c8c8c8"
background="#181818"
background="xc:$background"
text=$help_text
preview_files="/tmp/fp/*.png"
cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"

#functions
main() {
  type 'convert' >/dev/null || printf "${cr}Error: Could not find 'convert', Make sure you have ImageMagick installed.\n"
  case "$(uname -s)" in 
    Linux*) open_command="xdg-open"
      fonts=$HOME/.fonts/FiraCode-Bold.ttf
      type 'xdg-open' >/dev/null || printf "${cr}Error: Could not find 'xdg-open', Make sure you have xdg-utils installed.\nElse provide a image viewer with -iv flag\n";;
    Darwin*) open_command="open"
      fonts=$HOME/Library/Fonts/FiraCode-Bold.ttf;;
    *) printf "${cr}Error: Os Not Supported\n"
      exit;;
  esac
}

preview() {
  if [ -d $fonts ]; then
    fonts=$fonts/*.*
  fi
  rm -r /tmp/fp
  mkdir /tmp/fp
  for font in $fonts; do
    printf "${cr}"
    font_name=$( basename $font)
    convert -size "$window_size" -fill "$foreground" "$background"\
    -gravity northwest -font "$font" -annotate +10+10 "$font_name"\
    -gravity northeast -font "$font" -annotate +10+10 "$font"\
    -gravity center -pointsize "$font_size" -font "$font" -annotate +0+20 "$text"\
    -flatten "/tmp/fp/$font_name.png" 
    printf "${cg}Font: $font\n"
  done
  $open_command "/tmp/fp/$font_name.png"
}

main
#agruments
while true; do
  case "$1" in
    -bg|--background) background="xc:$2"
      shift;;
    -fg|--foreground) foreground="$2"
      shift;;
    -fs|--fontsize) font_size="$2"
      shift;;
    -ws|--windowsize) window_size="$2"
      shift;;
    -pt|--previewtext) text="$2"
      shift;;
    -lf|--linear-fg) foreground="gradient:$2"
      shift;;
    -rf|--radial-fg) foreground="radial-gradient:$2"
      shift;;
    -lb|--linear-bg) background="gradient:$2"
      shift;;
    -rb|--radial-bg) background="radial-gradient:$2"
      shift;;
    -iv|--imageviewer) open_command="$2"
      shift;;
    -h|--help) text=$help_text && printf "${cr}Report issues at: https://github.com/manas140/fp/\n";;
    "") break;;
    *) fonts="$1"
      text="$preview_text";;
  esac
  shift
done
preview
