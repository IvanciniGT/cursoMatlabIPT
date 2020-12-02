iniciarProyectoIPT();
crearRejilla(2,4);

imagen=cargarImagen('rice.png');
%mostrarImagen(imagen,"Imagen Original",1,1);
umbralAdaptativo=adaptthresh(imagen,0.4,'ForegroundPolarity', 'bright','NeighborhoodSize',49);
arroz=imbinarize(imagen,umbralAdaptativo);
mostrarImagen(arroz,"Letras",1,1)
