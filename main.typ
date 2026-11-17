= Weezer

For every color vector $p$, we need to find the opacitity vector $O$ of the red, green and blue album covers so that when they overlay then form the original color $p$. So, we need to solve this system of equations:

#let inv(n) = $#n^(-1)$;

$
  cases(
    O_r dot W_(r r) + O_g dot W_(g r) + O_b dot W_(b r) = p_r,
    O_r dot W_(r g) + O_g dot W_(g g) + O_b dot W_(b g) = p_g,
    O_r dot W_(r b) + O_g dot W_(g b) + O_b dot W_(b b) = p_b,
  )
$

These equations can be condensed into a matrix and vector like so:

$
  mat(W_(r r), W_(g r), W_(b r); W_(r g), W_(g g), W_(b g); W_(r b), W_(g b), W_(b b)) dot vec(O_r, O_g, O_b) & = vec(p_r, p_g, p_b) \
  W dot O & = p \
  O & = inv(W) p \
$

Here, $W$ is the Weezer matrix, the matrix containing the rgb-color values of the average color of the covers of the red, green and blue albums. $O$ is our opacity vector, and $p$ is the color vector representing our original color. We need to solve for the opacity vector.

First, lets find the Weezer matrix:

// Inverse Weezer Matrix
#let iwm = (
  ($frac(363, 46711)$, $- frac(841, 93422)$, $frac(247, 46711)$),
  ($- frac(661, 1307908)$, $frac(22635, 2615816)$, $- frac(4407, 653954)$),
  ($- frac(3711, 1307908)$, $frac(2421, 2615816)$, $frac(3949, 653954)$),
);
#let iwmMat = math.mat(..iwm);

$
       W & = mat(153, 155, 39; 58, 162, 130; 63, 48, 164) \
  inv(W) & = #iwmMat
$

So,

$
                   O & = inv(W) p \
  vec(O_r, O_g, O_b) & = #iwmMat dot vec(p_r, p_g, p_b) \
$
$
  cases(
    O_r = #iwm.at(0).at(0) dot p_r #iwm.at(0).at(1) dot p_g + #iwm.at(0).at(2) dot p_b,
    O_g = #iwm.at(1).at(0) dot p_r + #iwm.at(1).at(1) dot p_g #iwm.at(1).at(2) dot p_b,
    O_g = #iwm.at(2).at(0) dot p_r + #iwm.at(2).at(1) dot p_g + #iwm.at(2).at(2) dot p_b,
  )
$
