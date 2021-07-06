#!/usr/bin/bash
name="FP"
version="0.2"
help_text="
$name v$version : Font Preview

Arguments:
:
-h, --help                 show this help page.
-ff, --fontfile             path/to/font/files.
-fs, --fontsize                      font size.
-fg, --foreground             foreground color.
-bg, --background             background color.
-ws, --windowsize                  window size.
-pt, --previewtext                preview text.
-lf, --linear-fg    linear foreground gradient.
-rf, --radial-fg    radial foreground gradient.
-lb, --linear-bg    linear background gradient.
-rb, --radial-bg    radial background gradient.
"
preview_text="
A B C D E F G H I J K L M
N O P Q R S T U V W X Y Z
a b c d e f g h i j k l m
n o p q r s t u v w x y z
0 1 2 3 4 5 6 7 8 9
' ? ! ( ~ ) [ # ] { @ }
/ & < - + = > $ : ; , . *
"
window_size="600x400"
font_size="15"
font="$HOME/.fonts/FiraCode-Bold.ttf"
foreground="#c1c1c1"
background="#1c1c1c"
background="xc:$background"
text=$help_text

main() {
    type -p 'convert' &>/dev/null || echo -e "error: Could not find 'convert', Make sure you have ImageMagick installed."
    type -p 'xdg-open' &>/dev/null || echo -e "error: Could not find 'xdg-open', Make sure you have xdg-utils installed."
    preview
}

preview() {
    font_name=$( echo "$font" | awk -F/ '{print $(NF)}')
    output_file="/tmp/$name-$font_name.png"
    convert -size "$window_size" -fill "$foreground" "$background"\
    -gravity northwest -font "$font" -annotate +10+10 "$font_name"\
    -gravity northeast -font "$font" -annotate +10+10 "$font"\
    -gravity center -pointsize "$font_size" -font "$font" -annotate +0+20 "$text"\
    -flatten "$output_file" && xdg-open "$output_file" && sleep 0.1; rm /tmp/$name-*
}

while true; do
    case "$1" in
        -ff|--fontfile) font="$2"
        text=$preview_text
        shift
        ;;
        -bg|--background) background="xc:$2"
        shift
        ;;
        -fg|--foreground) foreground="$2"
        shift
        ;;
        -fs|--fontsize) font_size="$2"
        shift
        ;;
        -ws|--windowsize) window_size="$2"
        shift
        ;;
        -pt|--previewtext) text="$2"
        shift
        ;;
        -lf|--linear-fg) foreground="gradient:$2"
        shift
        ;;
        -rf|--radial-fg) foreground="radial-gradient:$2"
        shift
        ;;
        -lb|--linear-bg) background="gradient:$2"
        shift
        ;;
        -rb|--radial-bg) background="radial-gradient:$2"
        shift
        ;;
        -h|--help) text=$help_text
        ;;
        *)
            break
    esac
    shift
done

main
