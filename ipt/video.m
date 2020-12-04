elVideo=VideoReader("traffic.mj2");
crearRejilla(2,3);

%numeroFrames=elVideo.NumFrames;
%for i=1:numeroFrames
i=75;

    frame=read(elVideo,i);
    mostrarImagen(frame,"Imagen Original",1,1);
    frame=rgb2gray(frame);
    mostrarImagen(frame,"Coche",1,2);

    disco = strel('disk',7); 
    minidisco = strel('disk', 3);
    
    frame=imclose(frame,disco);
    frame=imadjust(frame);
    frame=frame>200;
    frame=imopen(frame,disco);
    mostrarImagen(frame,"Coche",1,3);
%end





%get(elVideo);
%implay("traffic.mj2");
%numeroFrames=elVideo.NumFrames;
%for i=1:numeroFrames
%    imshow(read(elVideo,i));
%    
%end

