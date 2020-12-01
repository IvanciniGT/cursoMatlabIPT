function mostrarImagen(imagen,titulo,fila,columna)
    global ANCHO_REJILLA;
    global ALTO_REJILLA;
    posicion=ANCHO_REJILLA*(fila-1)+columna;
    subplot(ALTO_REJILLA,ANCHO_REJILLA,posicion);
    imshow(imagen);
    title(titulo);
end