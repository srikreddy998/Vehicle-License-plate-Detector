clear;
clc;

f=imread('License_2.jpg'); % Reading the number plate image.
f=imresize(f,[400 NaN]); % Resizing the image keeping aspect ratio same.
g=rgb2gray(f); % Changing the color of the image
k=medfilt2(g); %median filter removes noise
figure
imshow(k)
se=strel('disk',1);  %structuring element
k1=imdilate(k,se);   %Dilate the Image
k2=imerode(k,se);    %erode the Image
k3=imsubtract(k1,k2); %subtracting both images for better clarity
figure
imshow(k3)
b=im2bw(k3,0.228);     %changing it to binary
x=ceil((graythresh(k3))); 
b1=imfill(b,x);      %filling the holes in the image
b2 =~b1;              %Complementing the image 
b3=bwareaopen(b2,1200); % selecting the area of the number plate
b3=~b3;   
b4=b3-b1;            %subtracting the two images to get the desired part
b4=imfill(b4);       % fill the holes
figure
imshow(b4);         

%----------- Finding the porperties of the image---------------
%Finding the properties of the Image
[label n] = bwlabel(b4);
stats = regionprops(label, {'Area', 'BoundingBox'});

 area = [stats.Area];
 
 idx = find((100 <= area) & (area <= 5000));
    b5 = ismember(label,idx);
Ibox=[stats.BoundingBox];
Ibox=reshape(Ibox,[4,n]);

figure
imshow(b5)   

[label n] = bwlabel(b5);
stats = regionprops(label, {'Area', 'BoundingBox'});

 area = [stats.Area];  %  Specifying the area of the required character in the image

 idx = find((100 <= area) & (area <= 5000));
    b5 = ismember(label,idx);
Ibox=[stats.BoundingBox];
Ibox=reshape(Ibox,[4,n]);

c=zeros(1:n);
carnum=[];
 for j=1:n
 
     hold on
 rectangle('Position',Ibox(:,j),'EdgeColor','r','LineWidth',2 );
 c=imcrop(b4,Ibox(:,j));            %crop out the detected character
 figure 
 imshow(c)
 chs=correlation(c);                  
 carnum=[carnum chs];
 end
 hold off
fid = fopen('carnum.txt', 'wt');         
 fprintf(fid,'%s',carnum);
  fclose(fid);

  winopen('carnum.txt')

 