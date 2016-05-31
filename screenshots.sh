#!/bin/sh -x

convert ./screenshot.png -resize 50% screenshot-small.png; # Smaller screenshot
convert ./screenshot.png -resize 20% screenshot-toc.png; # Table of Contents screenshot

echo "git add screenshot*"
