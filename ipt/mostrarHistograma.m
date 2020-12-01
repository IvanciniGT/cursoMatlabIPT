function mostrarHistograma(imagen,titulo,umbral,fila,columna)
    global ANCHO_REJILLA;
    global ALTO_REJILLA;
    posicion=ANCHO_REJILLA*(fila-1)+columna;
    subplot(ALTO_REJILLA,ANCHO_REJILLA,posicion);
    imhist(imagen);
    x=[umbral umbral];
    y=ylim;
    hold on;
    plot(x,y,"r-");
    text(umbral+15, y(2)- range(y)*0.1, sprintf("Umbral: %d",umbral),"color",[ 1 0 0 ]);
    hold off;
    title(titulo);
end