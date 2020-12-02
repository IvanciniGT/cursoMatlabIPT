iniciarProyectoIPT();
crearRejilla(2,6);
%--------------------------------------------------------------------------
% Mostrar imagen original y su histograma
%--------------------------------------------------------------------------
imagen=cargarImagen('rice.png');
    mostrarImagen(imagen,"Imagen Original",1,1);
    mostrarHistograma(imagen,"Histograma original",0,2,1);
%--------------------------------------------------------------------------
% Calculado bordes
%--------------------------------------------------------------------------
bordes=edge(imagen,'sobel');
    mostrarImagen(bordes,"Bordes",1,2);
%--------------------------------------------------------------------------
% Engrosado bordes
%--------------------------------------------------------------------------
disco = strel('disk', 3);
bordesEngrosados=imdilate(bordes,disco);
    mostrarImagen(bordesEngrosados,"Bordes Engrosados",1,3);
%--------------------------------------------------------------------------
% Rellenado bordes
%--------------------------------------------------------------------------
bordesEngrosadosRellenos=imfill(bordesEngrosados,'holes');
    mostrarImagen(bordesEngrosadosRellenos,"Bordes Rellenos",1,4);
%--------------------------------------------------------------------------
% Erosiono para sacar el fondo
%--------------------------------------------------------------------------
disco = strel('disk', 11);
fondo=imerode(imagen,disco);
    mostrarImagen(fondo,"Fondo",2,1);
%--------------------------------------------------------------------------
% Resto a la imagen el fondo... me quedo con los granos
%--------------------------------------------------------------------------
granos=imagen-fondo;
    mostrarImagen(granos,"Granos",2,2);
mostrarHistograma(granos,"Histograma granos",0,2,3);
%--------------------------------------------------------------------------
% Aumentar contrastre
%--------------------------------------------------------------------------
granos=imadjust(granos);
    mostrarImagen(granos,"Contraste",2,4);
mostrarHistograma(granos,"Histograma contraste",130,2,5);
%--------------------------------------------------------------------------
% Binarizar
%--------------------------------------------------------------------------
granos=granos>130;
    mostrarImagen(granos,"Finales",1,5);
%--------------------------------------------------------------------------
% Lijo los granos
%--------------------------------------------------------------------------
crearRejilla(1,1);
disco = strel('disk', 3);
granos=imerode(granos,disco);
    mostrarImagen(granos,"Pulidos",1,1);
%--------------------------------------------------------------------------
% Contar los granos
%--------------------------------------------------------------------------
granos=bwlabel(granos); %Etiqueto cada granos con un numero
limitesDeCadaGrano=bwboundaries(granos);
fprintf("Tengo %d granos.\n",length(limitesDeCadaGrano));

