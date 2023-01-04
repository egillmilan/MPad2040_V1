% clc; clear all; close all;

imgRGB = imread('wave.jpg');

DSF = 100;              % Scaling Factor
RF = 20;                % Resizing Factor
ISF = round(DSF*2/3);   % Image scaling factor
circArray = circlefunc(DSF);

imgBW = histeq(rgb2gray(imgRGB));
imgRS = imresize(imgBW,round(size(imgBW)/RF));
buffer = DSF-ISF;
imgDot = logical(zeros(size(imgRS)*ISF+buffer));

for i = 1:size(imgRS,1)
    for j = 1:size(imgRS,2)
        circleSize = round(double(imgRS(i,j))/256*DSF);
        addedData = circArray(:,:,circleSize+1);

        target = imgDot(1+(i-1)*ISF:buffer+i*ISF,1+(j-1)*ISF:buffer+j*ISF);
        newArea = target | addedData;

        imgDot(1+(i-1)*ISF:buffer+i*ISF,1+(j-1)*ISF:buffer+j*ISF) = newArea;
    end
end

[M,N] = size(imgDot);
crop = round(buffer/2);
imgDot = imgDot(crop:M-crop, crop:N-crop);

imgDot = imresize(imgDot,size(imgRGB(:,:,1)));

figure;
imshow(imgDot);

% imwrite(imgDot,'baboonDotsSquare.bmp','bmp');