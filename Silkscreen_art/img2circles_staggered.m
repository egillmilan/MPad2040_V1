clc; clear all; close all;

img = imread('saturn/saturn19.jpg');

DSF = 200;              % Scaling Factor
ISF = round(DSF/2.6);   % Image scaling factor
RF = 6;                % Resizing Factor
circArray = circlefunc(DSF);

% if length(size(img)) > 2
%     img = rgb2gray(img);
% end

imgBW = histeq(rgb2gray(img));
imgRS = imresize(imgBW,round(size(imgBW)/RF));
buffer = DSF-ISF;
imgDot = logical(zeros(size(imgRS)*ISF+buffer));

stagger = false;
for i = 1:2:size(imgRS,1)
    for j = 1:2:(size(imgRS,2)-1)
        j = j + int32(stagger);
        circleSize = round(double(imgRS(i,j))/256*DSF);
        addedData = circArray(:,:,circleSize+1);

        target = imgDot(1+(i-1)*ISF:buffer+i*ISF,1+(j-1)*ISF:buffer+j*ISF);
        newArea = target | addedData;

        imgDot(1+(i-1)*ISF:buffer+i*ISF,1+(j-1)*ISF:buffer+j*ISF) = newArea;
    end
    stagger = ~stagger;
end

[M,N] = size(imgDot);
crop = buffer;
imgDot = imgDot(crop:M-crop, crop:N-2*crop);

imgDot = imresize(imgDot,size(img(:,:,1)));

figure;
imshow(imgDot);

% imwrite(imgDot,'waveDotsStaggered.bmp','bmp');