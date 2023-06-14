%
% Loads as saved under B_BON/Util/BonIO.h-s_BonPix().
%
function [APix nBon szM Org] = LoadBonPix(lfn) 

fileID   = fopen(lfn, 'r');
if (fileID<0), error('file %s not found', lfn); end

%% ====  sizes  ====
nBon     = fread(fileID, 1, 'int=>single');
szM      = fread(fileID, 2, 'int=>single');

fprintf('[%4d %4d] nBon %4d', szM(1), szM(2), nBon);
    
%% ====  arrays  ====
APix = cell(nBon,1);
Org  = zeros(nBon,1);
for b = 1:nBon
    
    nPx     = fread(fileID, 1, 'int=>single');
    Org(b)  = fread(fileID, 1, 'uint8=>single');
    
    Pix.Rw  = fread(fileID, nPx, 'int16=>single');
    Pix.Cl  = fread(fileID, nPx, 'int16=>single');
    
    APix{b} = Pix;
end

idf     = fread(fileID, 1, 'int=>single');
assert(idf==626);

fprintf('\n');

