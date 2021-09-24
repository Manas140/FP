# FP FontPreview

Simple Customizable FontPreview Posix Script.

<p align="center">
  <img src="preview.png">
</p>

FP (Font Preview) is a simple customizable Posix script to view font in any image viewer, which makes use of imagemagick's `convert` for generating preview image.
Dependencies:

```
  ImageMagick
```

Install:

```
  git clone https://github.com/Manas140/FP.git && cd FP
  ./install.sh i
```

Usage:

```
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
```

Example:

```
  fp ~/.fonts/ComicNeue-Bold.ttf -fs 25 -lb SlateBlue3-IndianRed1 -fg snow1
```

