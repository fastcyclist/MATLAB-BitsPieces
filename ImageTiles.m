%function ImageTiles

% Tile size
W = 3;  % Width of the tiles
H = 2;  % Height of the tiles

[FileName, PathName] = uigetfile('*.jpg');
Image = imread([PathName, FileName]);
imfinfo([PathName, FileName])
PixelSize = size(Image);

TileImage = uint8(zeros(PixelSize(1)*H, PixelSize(2)*W, 3));

for i=1:H
    for j=1:W

        TileImage( 1+(i-1)*PixelSize(1) : i*PixelSize(1), ...
                   1+(j-1)*PixelSize(2) : j*PixelSize(2), ...
                   1:3 ) = Image;
    end
end

imwrite(TileImage,[PathName, FileName, 'tile.jpg'],'jpg')