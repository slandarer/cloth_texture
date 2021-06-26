# cloth_texture
Apply the pattern to the fabric
author @slandarer

you should change the **[background pic path]** and **[foreground pic path]** like follows

```
bkgPic=imread('background.jpg');
bkgPic=rgb2gray(bkgPic);
forePic=imread('foreground.jpg');
forePic=imresize(forePic,size(bkgPic));
```

## background pic display:

<img 
     src="https://github.com/slandarer/cloth_texture/blob/main/gallery/background.jpg" width="500"/>

## foreground pic display:

<img 
     src="https://github.com/slandarer/cloth_texture/blob/main/gallery/foreground.jpg" width="500"/>
     
## result pic display

save pic as **[result.jpg]**

<img 
     src="https://github.com/slandarer/cloth_texture/blob/main/gallery/result.jpg" width="500"/>
