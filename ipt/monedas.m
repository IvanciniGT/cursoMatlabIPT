iniciarProyectoIPT();
crearRejilla(2,4);

imagen=cargarImagen('coins.png');
mostrarImagen(imagen,"Imagen Original",1,1);

mostrarHistograma(imagen,"Histograma original",105,2,1);

mascara=(imagen>105);
mostrarImagen(mascara,"Mascara",1,2);

mostrarImagen(imagen.*uint8(mascara),"Imagen con mascara",1,3);


mascaraRellena=imfill(mascara,'holes');
mostrarImagen(mascaraRellena,"Mascara rellena",2,2);

mostrarImagen(imagen.*uint8(mascaraRellena),"Imagen con mascara rellena",2,3);

imagenConMonedasEtiquetadas=bwlabel(mascaraRellena,8);
imagenConMonedasColoreadas=label2rgb(imagenConMonedasEtiquetadas);
mostrarImagen(imagenConMonedasColoreadas,"Imagen con monedas coloreadas",1,4);

bordes=bwboundaries(mascaraRellena);
propiedades=regionprops(imagenConMonedasEtiquetadas, imagen,'all');

numeroDeMonedas=length(bordes);
totalMonedas=zeros(2);

for moneda=1:numeroDeMonedas
    puntos=bordes{moneda};
    propiedadesMoneda=propiedades(moneda);
    perimetroMoneda=propiedadesMoneda.Perimeter;
    centroMoneda=propiedadesMoneda.Centroid;
    diametroMoneda=perimetroMoneda/pi;
    totalMonedas((diametroMoneda>50)+1)=totalMonedas((diametroMoneda>50)+1)+1;

    subplot(2,4,1); % El borde verde en la primera imagen
    hold on;
    plot(puntos(:,2),puntos(:,1),"g-");
    hold off;

    subplot(2,4,4); % El numero de moneda va en la imagen de colores
    hold on;
    text(  centroMoneda(1)   ,   centroMoneda(2)  , sprintf('%d',moneda) , 'color', [0 0 0] );
    hold off;
    
    fprintf("Moneda %d, Diametro: %f\n",moneda,diametroMoneda);
end

fprintf("Monedas grandes : %d\n",totalMonedas(2));
fprintf("Monedas pequeñas: %d\n",totalMonedas(1));