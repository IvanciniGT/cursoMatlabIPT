iniciarProyectoIPT();
crearRejilla(1,3);
imagen=cargarImagen('circles.png');
    mostrarImagen(imagen,"Imagen Original",1,1);
[centers, radii] = imfindcircles(imagen,[10 50],'ObjectPolarity','Bright');
hold on;
viscircles(centers, radii);
hold off;

imagen=cargarImagen('circlesBrightDark.png');
    mostrarImagen(imagen,"Imagen Original",1,2);

hold on;
[centers, radii] = imfindcircles(imagen,[20 100],'ObjectPolarity','Bright');
viscircles(centers, radii);
[centers, radii] = imfindcircles(imagen,[20 100],'ObjectPolarity','Dark');
viscircles(centers, radii);
hold off;


imagen=cargarImagen('coins.png');
    mostrarImagen(imagen,"Imagen Original",1,3);
[centers, radii] = imfindcircles(imagen,[20 300],'ObjectPolarity','Bright');
hold on;
viscircles(centers, radii);
hold off;