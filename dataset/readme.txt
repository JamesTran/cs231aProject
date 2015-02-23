Landmark3D Dataset V1.0

[Motivation] 
This dataset provides a collection of web images and 3D models for research on landmark recognition (especially for methods based on 3D models). We hope it could serve as a useful benchmark for evaluating and comparing different methods.

[Contents of the Dataset] 
Currently the dataset involves:
	1) 25 landmarks, each with a 3D model (point cloud) reconstructed using structure-from-motion (SfM);
	2) 45,180 database images (1.4K~2K per landmark) registered to the 3D models; 
	3) 10,000 positive test images for evaluation (400 per landmark); 
	4) ~2.7 million 3D points in the 3D models (29K~223K per landmark); 
	5) ~58 million SIFT features registered to the 3D models. 

The list of landmarks is provided in the file list_landmarks.txt in the root folder.

For each landmark, there is a subfolder containing four files:
	1) list_db.txt -- the list of database images 
	2) list_test.txt -- the list of test images 
	3) model.nvm -- the 3D model reconstructed using VisualSFM 
	4) model.ply -- the 3D points in the 3D model (for visualization only) 

[File Formats]
1) list_landmarks.txt
	Each line stores information (separated by TABs) of a landmark, in the format of:
	<Landmark_ID> <Landmark_Name> <#Database_images> <#3D_points> <#Registered_SIFT_features>
	
2) list_db.txt
	Each line stores information (separated by TABs) of a database image, in the format of:
	<Image_Name> <Image_URL> <Image_Width(pixels)> <Image_Height(pixels)> <Focal_Length(pixels)> 
	
3) list_test.txt
	Each line stores information (separated by TABs) of a test image, in the format of:
	<Image_Name> <Image_URL> <Image_Width(pixels)> <Image_Height(pixels)> 
	
4) model.nvm
	Please refer to VisualSFM document for the file format. Note that only one 3D model is recorded for each landmark; and we have discarded any 3D points appearing in less than three database images.
 
[Usage]
1) This dataset is for research purpose only.
2) Considering the copyright of (Flickr) images, currently only the URLs of database/test images are provided. Please contact us if you encounter difficulties in downloading the images by yourself.
3) If you use this dataset in a publication, please cite the following paper:
	Qiang Hao, Rui Cai, Zhiwei Li, Lei Zhang, Yanwei Pang, and Feng Wu. "3D Visual Phrases for Landmark Recognition". in Proc. of the 25th IEEE Conference on Computer Vision and Pattern Recognition (CVPR), 2012. 

[Contact]
If you have questions about this dataset, please contact Qiang Hao (haoq@live.com).
