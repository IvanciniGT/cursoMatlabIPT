function mostrarImagen(imagen,titulo,fila,columna,alto,ancho)
    posicion=ancho*(fila-1)+columna;
    subplot(alto,ancho,posicion);
    imshow(imagen);
    title(titulo);
end