X=[1;3;1;8;14];
Y=[5;4;1;9;17];
Puntos=[[1 2]; [3 5]; [4,8]; [1 2];[4 7]];
Radio=[2;2;4;2;3];
Color=[ "Azul"; "Verde";"Amarillo";"Rojo";"Rojo"];

miTabla=table(Puntos,Radio,Color);
miTabla(2,:)

miFila={[1 2],7,"Moradito"};
miTabla=[miTabla;miFila];
miTabla