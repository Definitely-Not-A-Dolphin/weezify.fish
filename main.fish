function average_color
  echo (magick $argv[1] -resize 1x1\! -format "%[fx:int(255*r+.5)] %[fx:int(255*g+.5)] %[fx:int(255*b+.5)]" info:- | string split " ")
end

set -l --path imagePath $argv[1];
set -l dimensions (identify $imagePath | grep -Eo [0-9]+x[0-9]+ | string split \n | string split x)[1..2]; # Evil expression no.1
echo $dimensions;

set -l avgColor (average_color $imagePath);
echo $avgColor
