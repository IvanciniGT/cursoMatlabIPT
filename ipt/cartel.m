crearRejilla(1,4);
imagen=cargarImagen('handicapSign.jpg');
mostrarImagen(imagen,"Imagen Original",1,1);

canalAzul=imadjust(imagen(:,:,3));
mostrarImagen(canalAzul,"Canal Azul",1,2);

disco = strel('disk', 9);
canalAzul=imclose(canalAzul,disco);
mostrarImagen(canalAzul,"Canal Azul Limpio",1,3);

mascara=canalAzul>250;
mascara=imopen(mascara,disco);
mascara=imfill(mascara,'holes');

mostrarImagen(mascara,"Mascara",1,4);

mascara=imdilate(mascara,disco);
zonaCartel=regionprops(mascara,'all');
subplot(1,4,1);
hold on;
rectangle('Position',zonaCartel.BoundingBox);
hold off;
textoReconocido=ocr(imagen,zonaCartel.BoundingBox);
fprintf(textoReconocido.Text)














