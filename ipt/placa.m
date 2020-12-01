iniciarProyectoIPT();
crearRejilla(1,6);
%--------------------------------------------------------------------------
% Mostrar imagen original y sus canales
%--------------------------------------------------------------------------
imagen=cargarImagen('board.tif');
canalRojo=imagen(:,:,1);
canalVerde=imagen(:,:,2);
canalAzul=imagen(:,:,3);
    mostrarImagen(imagen,"Imagen Original",1,1);
    mostrarImagen(canalRojo,"Rojo",1,2);
    mostrarImagen(canalVerde,"Verde",1,3);
    mostrarImagen(canalAzul,"Azul",1,4);
final=(255-imadjust(canalVerde-canalRojo))>150+canalAzul;
    mostrarImagen(final,"Mezclados",1,5);
    disco = strel('disk', 3);
final=imfill(final,'holes');
final=imopen(final,disco);
    mostrarImagen(final,"Repaso",1,6);
    
