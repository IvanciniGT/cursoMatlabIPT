
function iniciarProyectoIPT()
    clearvars; % Borra las variables del entorno
    clc;   % Borrar la consola de comandos 
    workspace;    % Mostrar la informaciónd e todas las variables que tenemos cargadas
    imtool close all;   % Todas la imágenes que tenga abiertas, las cierra.
    tengoLicencia=license('test','image_toolbox');
    if ~tengoLicencia
        error('No hay licencia de ImageToolbox. '); %Genera un mensa de error(ROJITO)
    else
        fprintf("Licencia de IPT instalada.\n");
    end
    format compact;   % Hace que la salida en la ventana de comandos, sea más compacta
                      % Quita muchos saltos de linea innecesarios.
    format long g;    % Nos saca los decimales máximos y evita el formato cientifico
end