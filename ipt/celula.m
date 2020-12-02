iniciarProyectoIPT();
crearRejilla(2,6);
%--------------------------------------------------------------------------
% Mostrar imagen original y su histograma
%--------------------------------------------------------------------------
imagen=cargarImagen('cell.tif');
    mostrarImagen(imagen,"Imagen Original",1,1);
    mostrarHistograma(imagen,"Histograma original",0,2,1);
%--------------------------------------------------------------------------
% Calcular bordes, con umbral automatico y manual
%--------------------------------------------------------------------------
[bordes,umbralDeCambio]=edge(imagen,'sobel');
    mostrarImagen(bordes,"Umbral automático",1,2);
[bordes,umbralDeCambio]=edge(imagen,'sobel',umbralDeCambio*0.5);
    mostrarImagen(bordes,"Umbral reducido",2,2);
%--------------------------------------------------------------------------
% Engrosar los bordes
%--------------------------------------------------------------------------
disco = strel('disk', 3);
bordesEngrosados=imdilate(bordes,disco);
    mostrarImagen(bordesEngrosados,"Bordes engrosados",1,3);
    mostrarImagen(labeloverlay(imagen,bordesEngrosados),"Celulas",2,3);
%--------------------------------------------------------------------------
% Eliminar celulas que estuvieran en el borde de la imagen (cortadas)
%--------------------------------------------------------------------------
bordesEngrosadosLimpios=imclearborder(bordesEngrosados,8);
    mostrarImagen(bordesEngrosadosLimpios,"Bordes engrosados limpios",1,4);
    mostrarImagen(labeloverlay(imagen,bordesEngrosadosLimpios),"Celula",2,4);
%--------------------------------------------------------------------------
% Rellenar huecos en la celula
%--------------------------------------------------------------------------
bordesEngrosadosLimpiosRellenos=imfill(bordesEngrosadosLimpios,'holes');
    mostrarImagen(bordesEngrosadosLimpios,"Bordes engrosados rellenos",1,5);
    mostrarImagen(labeloverlay(imagen,bordesEngrosadosLimpiosRellenos),"Celula",2,5);
%--------------------------------------------------------------------------
% Lijar los bordes, para comer lo que habiamos engordado
%--------------------------------------------------------------------------
bordesLimpiosRellenos=imerode(bordesEngrosadosLimpiosRellenos,disco);
    mostrarImagen(bordesLimpiosRellenos,"Bordes finales",1,6);
    mostrarImagen(labeloverlay(imagen,bordesLimpiosRellenos),"Celula",2,6);
%--------------------------------------------------------------------------
% Contornear la célula
%--------------------------------------------------------------------------
subplot(2,6,1);
hold on;
imshow(labeloverlay(imagen,bwperim(bordesLimpiosRellenos)));
hold off;
%--------------------------------------------------------------------------
% Extraer sus medidas
%--------------------------------------------------------------------------
propiedadesCelula=regionprops(bordesLimpiosRellenos,imagen,'all');
%--------------------------------------------------------------------------
% Rotamos la imagen y la máscara
%--------------------------------------------------------------------------
angulo=propiedadesCelula.MaxFeretAngle;
bordesLimpiosRellenos=imrotate(bordesLimpiosRellenos,angulo);
imagen=imrotate(imagen,angulo);
%--------------------------------------------------------------------------
% Recalcularlas propiedades tras rotar
%--------------------------------------------------------------------------
propiedadesCelula=regionprops(bordesLimpiosRellenos,imagen,'all');
%--------------------------------------------------------------------------
% Recortar imagen
%--------------------------------------------------------------------------
recuadro=propiedadesCelula.BoundingBox;
laCelula=imcrop(imagen,recuadro);
crearRejilla(1,1);
mostrarImagen(laCelula,"Celula",1,1);
%--------------------------------------------------------------------------
% Recalcularlas propiedades tras recortar
%--------------------------------------------------------------------------
propiedadesCelula=regionprops(imcrop(bordesLimpiosRellenos,recuadro),laCelula,'all');
%--------------------------------------------------------------------------
% Pintar ejes
%--------------------------------------------------------------------------
hold on;
ejeLargo=propiedadesCelula.MaxFeretCoordinates;
ejeCorto=propiedadesCelula.MinFeretCoordinates;
plot(ejeLargo(:,1),ejeLargo(:,2),"r-.");
plot(ejeCorto(:,1),ejeCorto(:,2),"r-.");
hold off;
%--------------------------------------------------------------------------
% Mostrar detalle de la celula
%--------------------------------------------------------------------------
fprintf("El area de la celula es: %d",propiedadesCelula.Area );
fprintf("La masa de la celula es: %d",propiedadesCelula.Area*propiedadesCelula.MeanIntensity );