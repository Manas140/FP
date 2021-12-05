#!/bin/sh

# variables
cr="\033[1;31m"
cg="\033[1;32m"
cb="\033[1;34m"
text="
A B C D E F G H I J K L M
N O P Q R S T U V W X Y Z
a b c d e f g h i j k l m
n o p q r s t u v w x y z
0 1 2 3 4 5 6 7 8 9
' \" ? ! ( ~ ) [ # ] { @ }
/ & < - + = > $ : ; , . *
"
window_size="600x400"
font_size="20"
foreground="#e8e3e3"
background="#151515"
background="xc:$background"
imageviewer="xdg-open"

#function
help() {
  printf "${cg}FP : Font Preview
Usage: fp ${cb}-[fs|fg|bg|ws|pt|lf|lb|rf|rb|iv|h] font_path
   ${cb}-h: ${cg}help
  ${cb}-fs: ${cg}font size.
  ${cb}-fg: ${cg}foreground color.
  ${cb}-bg: ${cg}background color.
  ${cb}-ws: ${cg}window size.
  ${cb}-pt: ${cg}preview text.
  ${cb}-lf: ${cg}linear foreground gradient.
  ${cb}-lb: ${cg}linear background gradient.
  ${cb}-rf: ${cg}radial foreground gradient.
  ${cb}-rb: ${cg}radial background gradient.
  ${cb}-iv: ${cg}image viewer.
${cr}Report issues at: https://github.com/manas140/fp/
" && exit
}

check_dependencies() {
  if ! $(type 'convert' >/dev/null); then
    printf "${cr}Error: Could not find 'convert', Make sure you have ImageMagick installed.\n" && exit 1
  fi
  case "$(cat /proc/version)" in
    *Linux*)
      if $(type 'xdg-open' >/dev/null); then
        open_command="xdg-open"
      else
        printf "${cr}Error: Could not find 'xdg-open', Make sure you have xdg-utils installed.\n"
      fi;;
    *Darwin*) open_command="open";;
    *) printf "${cr}Error: Os Not Supported\n" && exit 1;;
  esac
  if [ $open_command = "" ]; then
    printf "${cr}Error: No ImageViewer Found, Try Using '-iv open_command' flag\n" && exit 1;
  fi
}

main() {
  if ! [ -d "$fonts" ] && [ -f "$fonts" ]; then
    printf "${cr}Error: Not A Valid Font '$fonts'\n" && exit 1;
  fi
  rm -r /tmp/fp 2>/dev/null
  mkdir -p /tmp/fp
  for font in $fonts; do
    printf "${cr}"
    c=$(( $c + 1))
    convert -size "$window_size" -fill "$foreground" "$background"\
    -gravity southwest -font "$font" -annotate +10+10 "$font"\
    -gravity center -pointsize "$font_size" -font "$font" -annotate +0+0 "$text"\
    -flatten "/tmp/fp/$c.png" && printf "${cg}Font: $font\n"
  done
  $open_command /tmp/fp/1.png
}

check_dependencies
while true; do
  case "$1" in
    "") break;;
    -bg) background="xc:$2"; shift;;
    -fg) foreground="$2"; shift;;
    -fs) font_size="$2"; shift;;
    -ws) window_size="$2"; shift;;
    -pt) text="$2"; shift;;
    -lf) foreground="gradient:$2"; shift;;
    -rf) foreground="radial-gradient:$2"; shift;;
    -lb) background="gradient:$2"; shift;;
    -rb) background="radial-gradient:$2"; shift;;
    -iv) open_command="$2"; shift;;
    *-h*) help;;
    *) fonts="$fonts $(ls $1)";;
  esac
  shift
done
main
