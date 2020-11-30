iniciarProyectoIPT();
imagen=cargarImagen('coloredChips.png');
imshow(imagen);

[alto,ancho,canales]=size(imagen);
%Información de un pixel: Intensidad con la que presenta "o no" un color

%canalRojo=imagen(:,:,1);
%canalVerde=imagen(:,:,2);
canalAzul=imagen(:,:,3);

%figure;imhist(imagen)
%figure;imhist(canalRojo)
%figure;imhist(canalVerde)
%figure;imhist(canalAzul)

%imshow(canalAzul>230);
mascara=uint8(canalVerde>200);
imshow(imagen.*mascara);