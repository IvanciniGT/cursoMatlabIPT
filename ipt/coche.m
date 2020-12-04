crearRejilla(2,3);
imagen=cargarImagen('coche.jpg');
mostrarImagen(imagen,"Imagen Original",1,1);


canalAzul=imadjust(rgb2gray(imagen));
mostrarImagen(canalAzul,"Grise4s",1,2);

disco = strel('disk', 17);
canalAzul=imclose(canalAzul,disco);
canalAzul=imadjust(imclearborder(canalAzul,8));
mostrarImagen(canalAzul,"Canal Gris Limpio",1,3);
mascara=canalAzul>200;
mascara=imopen(mascara,disco);
mascara=imfill(mascara,'holes');


%mascara=imdilate(mascara,disco);
mascara=imdilate(mascara,disco);
mostrarImagen(mascara,"Mascara",2,1);

zonaCartel=regionprops(mascara,'all');

mostrarImagen(labeloverlay(imagen,mascara),"Mascara",1,4);

letras=imagen+im2uint8(~mascara);
letras=imcrop(letras,zonaCartel.BoundingBox);
mostrarImagen(letras,"Mascara",2,2);

letras=1-(rgb2gray(letras)<50);
minidisco = strel('disk', 3);
letras=imerode(letras,minidisco);

mostrarImagen(letras,"Mascara",2,3);
textoReconocido=ocr(letras);
fprintf(textoReconocido.Text)














