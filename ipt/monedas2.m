iniciarProyectoIPT();
imagen=cargarImagen('eight.tif');
mostrarImagen(imagen,"Imagen Original",1,1,2,3);

mascara=(imagen<150);
mostrarImagen(mascara,"Mascara",1,2,2,3);

mostrarImagen(imagen.*uint8(mascara),"Imagen con mascara",1,3,2,3);


mascaraRellena=imfill(mascara,'holes');
mostrarImagen(mascaraRellena,"Mascara rellena",2,2,2,3);

mostrarImagen(imagen.*uint8(mascaraRellena),"Imagen con mascara rellena",2,3,2,3);
