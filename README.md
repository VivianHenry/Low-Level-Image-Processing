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

<h2>Sample Results</h2>

Histogram equalization:

![image](https://user-images.githubusercontent.com/67223688/184458124-e14db406-ddb7-4c7d-afa3-ceb120f79c94.jpeg)

Range compression:

![image](https://user-images.githubusercontent.com/67223688/184458171-abfab282-f6b7-44eb-82c9-1dc2b645442b.png)

Rotation:

![image](https://user-images.githubusercontent.com/67223688/184458186-d4891302-306f-49dd-8e3f-378d8a134df7.png)

Gaussian averaging:

![image](https://user-images.githubusercontent.com/67223688/184458196-3a219e07-800e-4875-a4a5-3a01e1693e2f.png)

Median averaging:

![image](https://user-images.githubusercontent.com/67223688/184458211-1022f949-4971-41e1-9f4f-8f55e904d2b5.png)
