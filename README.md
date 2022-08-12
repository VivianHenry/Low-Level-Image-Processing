<h1>Low Level Image Processing Techniques</h2>

The purpose of this repository is to practically implement various low-level image processing techniques and study their effects on images. These pre-processing techniques are a pivotal first step into higher-level image processing techniques as it aims to handle undesirable characteristics, such as noise. These techniques can broadly be classified into 2 categories:

<ol>
  <li> Point operations: Applied to each pixel in the image irrespective of the pixels’ neighbors. Examples are histogram equalization, range compression, contrast stretching, clipping, thresholding, etc.
  <li> Spatial operations: Applied to each pixel while considering the pixels’ neighborhood. These operations are rooted in convolution operations. The function to be applied is treated as a square mask, having a size that can be altered as desired, that moves along the image matrix. Examples are Gaussian averaging, median averaging, filtering, etc.
</ol>

In image processing, the spatial operations are represented by masks with which the image is convolved, as mentioned above. The procedure is described as below:

<ol>
  <li> Place mask on pixel(i, j) for which the result is to be computed
  <li> Compute pointwise multiplication of all pixels of the image and mask that overlap
  <li> Compute the sum of all the computations above
  <li> Replace pixel(i, j) value with the sum above
  <li> Slide mask over to the next pixel and repeat steps 2-4
</ol>

The techniques studied in this assignment are the following:

<ul>
  <li> Histogram equalization
  <li> Range compression (Log mapping)
  <li> Rotation
  <li> Gaussian averaging
  <li> Median averaging
</ul>
