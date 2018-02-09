FootDetector
=====
        This is a matlab demo for barefoot keypoints detection. You can get six keypoints by using these programs.
How to use it?
========
        Keypoint detector
        If you want to generate keypoints of a barefoot print by yourself, just use ’footDetector.m’. 
        [draw_img, FP]=footDetector(img)
        img:The image you want to process.
        FP: The  coordinate of keypoints which is an array shaped 6*2. 
        draw_img: The keypoints have been draw on img. In draw_img you can see the keypoints on original image.
        ![https://github.com/zjc798719285/FootDetector/raw/master/testImg.jpg]

        Rectangle detector 
        If you just want to detect barefoot in one image, you can use 'footRectDetector.m'.
        [rect,draw_img]=footRectDetector(img)
        img: The image you want to process.
        rect: The coordinate of rectangle which is an array shaped [x,y,w,h]. 
        draw_img: The rectangle have been draw on img. 

  
 
