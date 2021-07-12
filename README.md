# FP FontPreview

Simple Customizable FontPreview Bash Script.

<p align="center">
  <img width="460" height="300" src="https://user-images.githubusercontent.com/64472354/124871166-3e29d100-dfb3-11eb-81a7-b1046dc2403a.gif">
</p>

FP (Font Preview) is a simple customizable bash script to view font in any image viewer, which makes use of Imagemagick's `convert` for generating preview image.
Dependencies:
```
    ImageMagick
    Any Image Viewer
```

Install:
```
    git clone https://github.com/Manas140/FP.git && cd FP
    sudo make install
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
    -lb, --linear-bg    linear background gradient.
    -rf, --radial-fg    radial foreground gradient.
    -rb, --radial-bg    radial background gradient.
    -iv, --imageviewer                image viewer.
```

Example:
```
    fp -ff ~/.fonts/ComicNeue-Bold.ttf -fs 25 -lb SlateBlue3-IndianRed1 -fg snow1
```

