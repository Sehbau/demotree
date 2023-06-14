clear;

addpath('UtilMb');

[sts, Out] = dos('baumfarb Imgs/img2.jpg --depth 3');
%[sts, Out] = dos('baumgray Imgs\aachen.png --depth 4 --regMinPixNode 300');

[ABon nBon szI Dth] = LoadBonPix('Farb.bonPix'); % in UtilMb

Dth    = Dth + 1;                   % zero to one-indexing
depth  = max(Dth);

%% ------------   Plot Boundaries   -------------
%Col  = [1 0 0; 0 1 0; 0 0 1; 0 0 0]; % 4 colors
Col  = repmat([0:0.2:1]',1,3);      % gray-scales

figure(3); clf; 
for d = 1 : depth                   % loops depths
    
    subplot(2,2,d); hold on;
    set(gca,'fontsize', 6);
    
    IxDth = find(Dth==d);           % indices for this depth
    for b = 1:length(IxDth);        % loops boundaries for this depth
        
        Pix = ABon{IxDth(b)};       % extract one boundary
        hp  = plot(Pix.Cl+1, Pix.Rw+1, '-'); % plot this boundary
        set(hp, 'color', Col(d,:));   % set coloras

    end
    axis tight;
    axis ij;
    
end

%% ------------   Plot Images   -------------
figure(4); clf;
for d = 1 : depth                   % loops depths
    
    subplot(2,2,d); 
    
    imagesc(imread(['Ifarb_' num2str(d-1) '.png']));
    
end