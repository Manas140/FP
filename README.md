# FP FontPreview

Simple Customizable FontPreview Bash Script

Dependencies:
```
    ImageMagic
    Any Image Viewer
```

Install:
```
    git clone https://github.com/Manas140/FP.git && cd FP
    ./install -i
```

Usage:
```
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

Example:
    fp -ff ~/.fonts/ComicNeue-Bold.ttf -fs 25 -lb SlateBlue3-IndianRed1 -fg snow1
```

![animatedGIF](https://user-images.githubusercontent.com/64472354/124351195-74003b80-dbe8-11eb-8d37-b758eb74e2f8.gif)
