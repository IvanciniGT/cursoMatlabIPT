function imagen=cargarImagen(nombreFichero)
    ruta=comprobarExistenciaFichero(nombreFichero);
    imagen=imread(ruta);
end