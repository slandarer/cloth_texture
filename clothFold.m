function clothFold
bkgPic=imread('background.jpg');
bkgPic=rgb2gray(bkgPic);
forePic=imread('foreground.jpg');
forePic=imresize(forePic,size(bkgPic));

exforePic=uint8(zeros(size(forePic)+[26,26,0]));
exforePic(14:end-13,14:end-13,1)=forePic(:,:,1);
exforePic(14:end-13,14:end-13,2)=forePic(:,:,2);
exforePic(14:end-13,14:end-13,3)=forePic(:,:,3);

for i=1:13
    exforePic(i,14:end-13,:)=forePic(1,:,:);
    exforePic(end+1-i,14:end-13,:)=forePic(end,:,:);
    exforePic(14:end-13,i,:)=forePic(:,1,:);
    exforePic(14:end-13,end+1-i,:)=forePic(:,end,:);
end
for i=1:3
    exforePic(1:13,1:13,i)=forePic(1,1,i);
    exforePic(end-13:end,end-13:end,i)=forePic(end,end,i);
    exforePic(end-13:end,1:13,i)=forePic(end,1,i);
    exforePic(1:13,end-13:end,i)=forePic(1,end,i);
end
    
newforePic=uint8(zeros(size(forePic)));
for i=1:size(bkgPic,1)
    for j=1:size(bkgPic,2)
        goffset=(double(bkgPic(i,j))-128)/10;
        offsetLim1=floor(goffset)+13;
        offsetLim2=ceil(goffset)+13;
        sep1=goffset-floor(goffset);
        sep2=ceil(goffset)-goffset;
        c1=double(exforePic(i+offsetLim1,j+offsetLim1,:));
        c2=double(exforePic(i+offsetLim2,j+offsetLim2,:));
        if sep1==0
            c=double(exforePic(i+offsetLim1,j+offsetLim1,:));
        else
            c=c2.*sep1+c1.*sep2;
        end
        newforePic(i,j,:)=c;
    end
end

%grayForePic=rgb2gray(newforePic);
%rate=double(bkgPic)./double(grayForePic);

newforePic=uint8((double(newforePic).*double(bkgPic))./220);
imwrite(newforePic,'result.jpg')
imshow(newforePic)
end