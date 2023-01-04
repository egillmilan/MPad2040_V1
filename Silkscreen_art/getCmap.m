function cmap = getCmap(name, exclusions)
    
    if matches('purple', name)
        silk    =   [255 255 255]/255;
        Cu      =   [255 153   0]/255;
        mask    =   [102   0 102]/255;
        mask_Cu =   [153  51 153]/255;
        FR4     =   [255 204 102]/255;
    end
    
    if matches('black', name)
        silk    =   [255 255 255]/255;
        Cu      =   [255 153   0]/255;
        mask    =   [  0   0   0]/255;
        mask_Cu =   [ 10  10  10]/255;
        FR4     =   [255 204 102]/255;
    end

    cmap = [];
    if ~max(matches('silk', exclusions))
        cmap = [cmap; silk];
    end
    if ~max(matches('Cu', exclusions))
        cmap = [cmap; Cu];
    end
    if ~max(matches('mask', exclusions))
        cmap = [cmap; mask];
    end
    if ~max(matches('mask_Cu', exclusions))
        cmap = [cmap; mask_Cu];
    end
    if ~max(matches('FR4', exclusions))
        cmap = [cmap; FR4];
    end

end