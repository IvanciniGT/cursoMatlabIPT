%mascara1=crearMascaraRedonda([300 300],250, [1200 1200]);
%mascara2=crearMascaraRedonda([350 350],250, [1200 1200]);
%imshow(restarMascaras(mascara1,mascara2));
imagen=cargarImagen('coloredChips.png');
fichas=identificarCirculos(imagen,[20 50],0.9);
fichas

function eliminarDuplicados()
end


%distanciaEntrePuntos([1 1],[2 2])
function distancia=distanciaEntrePuntos(p1,p2)
    distancia=sqrt((p2(1)-p1(1))^2+(p2(2)-p1(2))^2);
end

function mascara=crearMascaraRedonda(centro,radio,tamano)
    mascara=zeros(tamano,'logical');
    for i=1:tamano(1)
        for j=1:tamano(2)
            if distanciaEntrePuntos([i,j],centro) < radio
                mascara(i,j)=1;
            end
        end
    end
end

function resultado=restarMascaras(mascara1,mascara2)
    resultado=mascara1-mascara2;
end

function tabla=identificarCirculos(imagen,intervaloRadio,sensitividad)
    [centrosBrillantes, radiosBrillantes] = imfindcircles(imagen,intervaloRadio,'ObjectPolarity','Bright','Sensitivity',sensitividad);
    [centrosOscuras, radiosOscuras] = imfindcircles(imagen,intervaloRadio,'ObjectPolarity','Dark','Sensitivity',sensitividad);
    tabla=table(centrosBrillantes,radiosBrillantes);
    for oscura=1:length(centrosOscuras)
        estaRepetida=0;
        for brillante=1:length(centrosBrillantes)
            % Miro si la oscura que estoy procesando es igual a ESTA clara
            if abs(radiosBrillantes(brillante)- radiosOscuras(oscura))< (radiosOscuras(oscura)/10) 
                if distanciaEntrePuntos(centrosBrillantes(brillante,:),centrosOscuras(oscura,:))< (radiosOscuras(oscura)/10)
                    % Si son iguales: 
                    estaRepetida=1;
                    break;
                end
            end
        end
        if estaRepetida==0
            nuevaFila={centrosOscuras(oscura,:),radiosOscuras(oscura)};
            tabla=[tabla;nuevaFila];
        end
    end
end
function identificarColor()

end
