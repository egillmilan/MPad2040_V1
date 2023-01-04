function imgFloydSteinbergDots = FloydSteinbergDots(img,RS, EF, sigma)

% Good starting values can b RS = 3, EF = 20, sigma = 1

if length(size(img)) > 2
    img = rgb2gray(img);
end

imgRS = imresize(img, round(size(img)/RS));
imgDithered = dither(imgRS);
% figure; imshow(imgDithered)

if nargin > 2
    imgEnlarged = imresize(imgDithered, size(imgDithered)*EF);
    imgRemapped = uint8(imgEnlarged)*255;
    imgGauss = imgaussfilt(imgRemapped, sigma);
    % figure; imshow(imgGauss)
    imgFloydSteinbergDots = imresize(imbinarize(imgGauss), size(img));
else
    imgFloydSteinbergDots = imresize(imgDithered, size(img));
end

% figure; imshow(imgFloydSteinbergDots);
end