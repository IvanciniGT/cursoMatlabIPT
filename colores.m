r=uint8(0);
g=uint8(0);
b=uint8(0);
color="Negro";
tablaColores=table(r,g,b,color);

rojos = linspace(0,255,4);
verdes = linspace(0,255,4);
azules = linspace(0,255,4);

for rojo=1:length(rojos)
    for verde=1:length(verdes)
        for azul=1:length(azules)
            color=nombrarColor(rojos(rojo),verdes(verde),azules(azul));
            fila={rojos(rojo),verdes(verde),azules(azul),color};
            tablaColores=[tablaColores;fila];
        end
    end
end
writetable(tablaColores,"colores.csv") ;

function color=nombrarColor(r,g,b)
    pintarRecuadro(r,g,b);
    prompt = {'Color:'};
    dlgtitle = 'Nombrado de colore';
    dims = [1 35];
    definput = {'claro'};
    color=inputdlg(prompt,dlgtitle,dims,definput);
    color=color{1};
end

function pintarRecuadro(r,g,b)
    RGB=zeros(500,500,3,'uint8');  
    RGB(:, :, 1)=r;
    RGB(:, :, 2)=g;
    RGB(:, :, 3)=b;
    imshow(RGB);
end