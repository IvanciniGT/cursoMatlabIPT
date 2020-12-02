iniciarProyectoIPT();
%crearRejilla(1,2);
%--------------------------------------------------------------------------
% Mostrar imagen original y sus canales
%--------------------------------------------------------------------------
imagen=cargarImagen('hotcoffee.tif');
%mostrarImagen(imagen,"Imagen Original",1,1);
%mostrarHistograma(imagen,"Histograma",0,1,2);
minimo=min(imagen(:));
maximo=max(imagen(:));
rango=[minimo maximo];
imshow(imagen,rango,'Colormap',hot);
umbrales=[30 38];%multithresh(imagen,2);
objetos=imquantize(imagen,umbrales);

disco = strel('disk', 11);
objetos=imclose(objetos,disco);
objetos=imfill(objetos,'holes');

propiedades=regionprops(objetos.*(objetos~=1),imagen,'all');

imshow(imagen,rango,'Colormap',hot)
hold on;
for indice=1:length(propiedades)
    propiedadesObjeto=propiedades(indice);
    rectangle('Position',propiedadesObjeto.BoundingBox,'EdgeColor',[0 1 1]);
    text(propiedadesObjeto.Centroid(1),propiedadesObjeto.Centroid(2),...
        sprintf("%2.1f ºC",propiedadesObjeto.MeanIntensity), 'color',[1 1 1]);
end
hold off;