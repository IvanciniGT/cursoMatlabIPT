%mascara1=crearMascaraRedonda([300 800],250, [600 1200]);
%mascara2=crearMascaraRedonda([350 850],250, [600 1200]);
%imshow(restarMascaras(mascara1,mascara2));
imagen=cargarImagen('coloredChips.png');
canalRojo=imagen(:,:,1);
canalVerde=imagen(:,:,2);
canalAzul=imagen(:,:,3);
tamano=size(imagen);
tamano=tamano(1:2);
fichas=identificarCirculos(imagen,[20 50],0.9);
imshow(imagen);
hold on;

%---------------------------------------------------------------------------
% Generando una tabla con las mascaras
%---------------------------------------------------------------------------
clear var mascaras;
for i=1:height(fichas)
    mascara=crearMascaraRedonda(fichas{i,1},fichas{i,2}, tamano);
    if ~exist('mascaras','var')
        mascaras=table({mascara});
    else
        mascaras=[mascaras;{mascara}];
    end
end
%---------------------------------------------------------------------------
% Restar a todas las mascaras las demas
%---------------------------------------------------------------------------
for i=1:height(fichas)
    mascaraActual=mascaras.Var1{i};
    for j=1:height(fichas)
        if i==j
            continue;
        end
        otraMascara=mascaras.Var1{j};
        mascaraActual=(mascaraActual-otraMascara)==1;
    end
    %imshow(mascaraActual);
    r=regionprops(mascaraActual,canalRojo,'MeanIntensity').MeanIntensity;
    g=regionprops(mascaraActual,canalVerde,'MeanIntensity').MeanIntensity;
    b=regionprops(mascaraActual,canalAzul,'MeanIntensity').MeanIntensity;
    color=procesarColor(r,g,b);
    centroide=fichas{i,1};
    text(centroide(1),centroide(2),color);
end

hold off;



%distanciaEntrePuntos([1 1],[2 2])
function distancia=distanciaEntrePuntos(p1,p2)
    distancia=sqrt((p2(1)-p1(1))^2+(p2(2)-p1(2))^2);
end

function mascara=crearMascaraRedonda(centro,radio,tamano)
    mascara=zeros(tamano,'logical');
    for i=1:tamano(1)
        for j=1:tamano(2)
            if distanciaEntrePuntos([j,i],centro) < radio
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
function color=identificarColor(r,g,b)
    ratioRG=(r-g)/255;
    ratioRB=(r-b)/255;
    ratioGB=(g-b)/255;
    
    if ratioRG >= -0.1 && ratioRG <= 0.1
        % Verde y Rojo son mas o menos iguales -> AMARILLO, GRISES, AZUL
        if ratioRB <-0.1
            color="Azul";
        elseif ratioRB >= -0.1 && ratioRB <= 0.1
            color="GRIS";
        else
            color="Amarillo";    
        end
    end
end











