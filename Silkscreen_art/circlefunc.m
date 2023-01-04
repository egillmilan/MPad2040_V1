function circArray = circlefunc(s)
    circle = imbinarize(imread('circle.png'));
    circArray = logical(zeros(s, s, s+1));
    for i = 1:s
        c = round((s-i)/2);
        circArray(c+1:c+i, c+1:c+i, i+1) = imresize(circle,[i,i]);
    end
end