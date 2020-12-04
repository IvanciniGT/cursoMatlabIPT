iniciarProyectoIPT();
crearRejilla(1,1);
%--------------------------------------------------------------------------
% Mostrar imagen original y sus canales
%--------------------------------------------------------------------------
imagen=imadjust(cargarImagen('printedText.png'));
%mostrarImagen(imagen,"Imagen Original",1,1);
%mostrarHistograma(imagen,"Histograma",0,1,2);
%mostrarImagen(imagen.*uint8(imagen>230),"Imagen Original",1,3);
%disco=strel('disk',9);
%fondo=imerode(imagen,disco);
%mostrarImagen(fondo,"Fondo",2,1);
%mostrarImagen((255-imadjust(imagen-fondo))>235,"Letras",2,2);

umbralAdaptativo=adaptthresh(imagen,0.75,'ForegroundPolarity', 'bright','NeighborhoodSize',31,'Statistic','gaussian');
letras=imbinarize(imagen,umbralAdaptativo);
mostrarImagen(letras,"Letras",1,1)
%'NeighborhoodSize
%ForegroundPolarity bright
%Statistic mean

textoReconocido=ocr(letras);
textoReconocido.Text
