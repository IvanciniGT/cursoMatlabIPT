iniciarProyectoIPT();
crearRejilla(1,6);
%--------------------------------------------------------------------------
% Mostrar imagen original y sus canales
%--------------------------------------------------------------------------
imagen=cargarImagen('board.tif');
canalRojo=double(imagen(:,:,1));
canalVerde=double(imagen(:,:,2));
canalAzul=double(imagen(:,:,3));
    mostrarImagen(imagen,"Imagen Original",1,1);
    mostrarImagen(canalRojo,"Rojo",1,2);
    mostrarImagen(canalVerde,"Verde",1,3);
    mostrarImagen(canalAzul,"Azul",1,4);

canalAzul=canalAzul.*(canalAzul<120);
divisionRojoVerde=canalRojo./(canalVerde+1);
divisionVerdeAzul=canalAzul./(canalVerde+1);

resultado=divisionRojoVerde.*divisionVerdeAzul;
resultado=resultado>0.45 & resultado<5;
    mostrarImagen(resultado,"RESULTADO",1,5);
disco = strel('disk', 3);
resultado=imfill(resultado,'holes');
resultado=imopen(resultado,disco);

disco = strel('disk', 7);
resultado=imopen(resultado,disco);
    mostrarImagen(resultado,"RESULTADO",1,6);
    
    
    
    
    
    
%%final=(255-imadjust(canalVerde-canalRojo))>150+canalAzul;
%    mostrarImagen(final,"Mezclados",1,5);
%    disco = strel('disk', 3);
%final=imfill(final,'holes');
%final=imopen(final,disco);
%    mostrarImagen(final,"Repaso",1,6);
    