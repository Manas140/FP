#FP --> font preview
name="FP"
version="0.1"
help="$name v$version : Font Preview

Arguments:

-h, --help            show this help page.
-ff, --fontfile         path/to/font/file.
-fs, --fontsize                 font size.
-fg, --foreground        foreground color.
-bg, --background        background color.
-ws, --windowsize             window size.
-pt, --previewtext           preview text.
-lg, --linear-gradient      color1-color2.
-rg, --radial-gradient      color1-color2."
size="550x350"
fontsize="15"
font="FiraCode-Bold.ttf"
text="A B C D E F G H I J K L M
N O P Q R S T U V W X Y Z
a b c d e f g h i j k l m
n o p q r s t u v w x y z
0 1 2 3 4 5 6 7 8 9
' ? ! ( ~ ) [ # ] { @ }
/ & < - + = > $ : ; , . *"
output_file="$name.png"
foreground="#c1c1c1"
background="#1c1c1c"

main() {
    dependencies=(feh convert)
    for dependency in "${dependencies[@]}"; do
        type -p "$dependency" &>/dev/null || {
            echo "error: Could not find '${dependency}', Make sure it's installed." >&2
            exit 1
        }
    done
    preview
}

help() {
    text=$help
}

preview() {
   convert -background "$background" -fill "$foreground" -font "$font" -size "$size" xc: -annotate +20+20 "$font" -gravity center -pointsize "$fontsize" -font "$font" -annotate +0+0 "$text" -flatten "$output_file" && feh "$output_file" && rm "$output_file"
}

while true; do
    case "$1" in
        -ff|--fontfile) font="$2"
        ;;
        -bg|--background) background="$2"
        ;;
        -fg|--foreground) foreground="$2"
        ;;
        -fs|--fontsize) fontsize="$2"
        ;;
        -ws|--windowsize) size="$2"
        ;;
        -pt|--previewtext) text="$2"
        ;;
        -lg|--linear-gradient) foreground="gradient:$2"
        ;;
        -rg|--radial-gradient) foreground="radial-gradient:$2"
        ;;
        -h|--help) help
        ;;
        *)
            break
    esac
    shift
    shift
done

main
