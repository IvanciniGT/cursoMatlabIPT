iniciarProyectoIPT();
crearRejilla(1,3);
imagen=cargarImagen('coloredChips.png');
    mostrarImagen(imagen,"Fichas claras",1,1);
[centers, radii] = imfindcircles(imagen,[20 50],'ObjectPolarity','Bright','Sensitivity',0.9);
hold on;
viscircles(centers, radii);
hold off;
    mostrarImagen(imagen,"Fichas oscuras",1,2);
[centers, radii] = imfindcircles(imagen,[20 50],'ObjectPolarity','Dark','Sensitivity',0.9);
hold on;
viscircles(centers, radii);
hold off;
