function ruta=comprobarExistenciaFichero(nombreImagen)
    ruta=which(nombreImagen);
    if ~exist(ruta,'file') 
        % Explosion!!!! El fichero no existe
        mensaje=sprintf("No se ha encontrado el fichero: %s", nombreImagen);
        uiwait(warndlg(mensaje, 'ERROR: Imposible continuar', 'modal'));
        error(mensaje);
    end
end