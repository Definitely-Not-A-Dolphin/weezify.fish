set -l --path imagePath $argv[1];
set -l dimensions (identify $imagePath | grep -Eo "[0-9]+x[0-9]+" | string split "\n" | string split "x")[1..2]; # Evil expression no.1
echo $dimensions;
