iniciarProyectoIPT();
crearRejilla(1,1);
global identificadorDeMoneda;
identificadorDeMoneda=1;
imagen=cargarImagen('circlesBrightDark.png');
    mostrarImagen(imagen,"Imagen Original",1,1);
%    mostrarHistograma(imagen,"Histograma original",0,2,1);
    
umbrales=multithresh(imagen,2);
imagenEnLonchas=imquantize(imagen,umbrales);
%    mostrarImagen(label2rgb(imagenEnLonchas),"Imagen Loncheada",1,2);
% En la imanenEnLonchas tengo:
% 1: Negro
% 2: Fondo (gris)
% 3: Blancas
%negras=imagen<50;
%blancas=imagen>200;
negras=imagenEnLonchas==1;
blancas=imagenEnLonchas==3;
%    mostrarImagen(negras,"Negras",1,3);
%    mostrarImagen(blancas,"Blancas",2,3);

procesarFichas(negras,"Negra");
procesarFichas(blancas, "Blanca");
   
function procesarFichas(imagenConFichasBinarizada, color)
    fichasEtiquetadas=bwlabel(imagenConFichasBinarizada,8);
    propiedadesFichas=regionprops(fichasEtiquetadas,'all');
    global identificadorDeMoneda;
    for indice=[1:length(propiedadesFichas)]
        ficha=propiedadesFichas(indice);
        if ficha.Area<10
            continue; 
        end
        fprintf("Tengo la moneda de color %s: %d. Tamaño: %d\n",color,identificadorDeMoneda, ficha.MaxFeretDiameter);
        hold on;
            viscircles(mean(ficha.MaxFeretCoordinates),ficha.MaxFeretDiameter/2 );
            text(ficha.Centroid(1),ficha.Centroid(2),sprintf("%d",identificadorDeMoneda),'color',[1 0 0],'fontsize',20);
            %plot(ficha.MaxFeretCoordinates(:,1),ficha.MaxFeretCoordinates(:,2),"r-.");

        hold off;
        identificadorDeMoneda=identificadorDeMoneda+1;
    end
end

