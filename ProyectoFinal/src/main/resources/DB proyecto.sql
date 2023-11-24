drop schema if exists superufide;
drop user if exists usuario_cliente;
CREATE SCHEMA superufide ;

create user 'usuario_cliente'@'%' identified by 'Usuar1o_cliente';

grant all privileges on techshop.* to 'usuario_cliente'@'%';
flush privileges;


create table superufide.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(100) NOT NULL,
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table superufide.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(100) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio double, 
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_categoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table superufide.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (id_usuario)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table superufide.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20) NOT NULL,
  PRIMARY KEY (id_rol)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

INSERT INTO superufide.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'Emilio05','$2a$10$P1','Emilio', 'Rodriguez Quiros','EmiRoQ@gmail.com','4556-8978', 'https://th.bing.com/th/id/R.1ca4ed91cae8c867996c5c3ad22f249c?rik=DTkbwGDQqyorng&riu=http%3a%2f%2fwww3.pictures.zimbio.com%2fgi%2fOKI%2bOpen%2bde%2bEspana%2bSenior%2bCleveland%2bGolf%2bSrixon%2bT-6DQQGLQjbx.jpg&ehk=M2Q5RBuNqpGOowI9OxoTgOC%2fsQ%2btzoZmaPDsZW3RGhc%3d&risl=&pid=ImgRaw&r=0',true),
(2,'AnaCL','CJ0lQRi','Ana',  'Acu;a Lopez', 'NanaLopz@gmail.com', '5456-8789','https://th.bing.com/th/id/R.76bd08bd91f46adb1bbd3d45d6a5f605?rik=3LotKAsQJe%2flrQ&pid=ImgRaw&r=0',true),
(3,'Catalina87','qXnPbO','Catalina', 'Chamoro Trejos','CataTreCha@gmail.com','7898-8936','https://th.bing.com/th/id/OIP.afCJk0EuMjerIFYa_BkdZgAAAA?rs=1&pid=ImgDetMain',true);


INSERT INTO superufide.categoria (id_categoria, descripcion, ruta_imagen,activo) VALUES 
('1','Bebidas y Licores', 'https://th.bing.com/th/id/OIP.ZAOAC3iN1smSwv-DE32WCgHaHa?rs=1&pid=ImgDetMain',   true), 
('2','Abarrotes',  'https://static.vecteezy.com/system/resources/previews/004/477/786/non_2x/grocery-food-2d-isolated-illustration-vegetables-and-eggs-in-container-products-from-supermarket-flat-composition-on-cartoon-background-retail-and-commerce-colourful-scene-vector.jpg',   true),
('3','Higiene y Belleza','https://www.alamy.es/aggregator-api/download?url=https://c8.alamy.com/compes/jk97cj/iconos-de-la-higiene-personal-estilo-de-dibujos-animados-jk97cj.jpg',true),
('4','Embutidos','https://th.bing.com/th/id/OIP.wVC6icsyBuSJggEIyriMpQHaFP?rs=1&pid=ImgDetMain',    true);


INSERT INTO superufide.producto (id_producto, id_categoria, descripcion, detalle, precio, ruta_imagen, activo) VALUES
('1','1','Bebida 1','Lorem ipsum dolor sit amet consectetur adipiscing elit iaculis, ullamcorper in fringilla eu cras tempor mi. Luctus blandit sapien mauris vestibulum consequat mattis taciti aliquam ullamcorper, sagittis suscipit etiam urna convallis.','23000','https://th.bing.com/th/id/OIP.bvGzgJg2VKOiwY2BsZO0ogAAAA?rs=1&pid=ImgDetMain',true),
('2','1','Bebida 2','Quisque in ridiculus scelerisque platea accumsan libero sem vel, mi cras metus cubilia tempor conubia fermentum volutpat gravida, maecenas semper sodales potenti turpis enim dapibus. Volutpat accumsan vivamus dignissim blandit vel ','27000','https://th.bing.com/th/id/OIP.bvGzgJg2VKOiwY2BsZO0ogAAAA?rs=1&pid=ImgDetMain',true),
('3','1','Bebida 3','Natoque lacinia accumsan hendrerit pretium sociis imperdiet a, nullam ornare erat suspendisse praesent porta, euismod in augue tempus aliquet habitasse. Non accumsan nostra cras vestibulum augue facilisi auctor scelerisque suscipit.','24000','https://th.bing.com/th/id/OIP.bvGzgJg2VKOiwY2BsZO0ogAAAA?rs=1&pid=ImgDetMain',true),
('4','1','bebida 4','Elementum sagittis dictumst leo curabitur porta, pellentesque interdum mauris class augue, penatibus vulputate dignissim lobortis, risus euismod ullamcorper ultrices. Hac suspendisse id odio tempus eleifend a malesuada, conubia gravida.','27600','https://th.bing.com/th/id/OIP.bvGzgJg2VKOiwY2BsZO0ogAAAA?rs=1&pid=ImgDetMain',true),
('5','2','Abarrote 1','Aenean senectus diam vitae curae habitant risus a et netus ante, sociis metus quisque euismod aptent etiam platea fringilla class vestibulum, dis habitasse facilisis fusce varius nam arcu blandit congue. Rutrum placerat congue etiam .','45000','https://th.bing.com/th/id/R.083b514854104256af44a1b62e24a964?rik=Zrfbh3Dkg6A4vw&pid=ImgRaw&r=0',true),
('6','2','Abarrote 2','Auctor id morbi tempor litora fusce potenti, ornare integer imperdiet turpis accumsan enim, sagittis suscipit purus lacus nunc. Posuere tellus elementum imperdiet sollicitudin consequat torquent urna risus, pulvinar ac per quis egestas.','57000','https://th.bing.com/th/id/R.083b514854104256af44a1b62e24a964?rik=Zrfbh3Dkg6A4vw&pid=ImgRaw&r=0',true),
('7','2','Abarrote 3','Cum placerat etiam lobortis curabitur fames class facilisi hac duis, congue vulputate mus feugiat nostra imperdiet neque vehicula. Mi mollis ridiculus montes aenean sagittis vitae metus, netus massa ligula sociis magnis porttitor, torquent.','25000','https://th.bing.com/th/id/R.083b514854104256af44a1b62e24a964?rik=Zrfbh3Dkg6A4vw&pid=ImgRaw&r=0',true),
('8','2','Abarrote 4','Purus dictumst scelerisque mollis platea malesuada per vehicula lectus blandit sed, vulputate morbi imperdiet duis dapibus congue class accumsan nullam, ligula eleifend tincidunt urna mi condimentum dis posuere tellus. Sem rutrum erat mauris .','27600','https://th.bing.com/th/id/R.083b514854104256af44a1b62e24a964?rik=Zrfbh3Dkg6A4vw&pid=ImgRaw&r=0',true),
('9','3','Higiene y Belleza 1','Morbi egestas sociis magnis curabitur suscipit nostra blandit magna torquent convallis, enim parturient feugiat fringilla litora aliquam turpis nisl at velit, fames aenean dui viverra arcu habitasse nascetur platea ac. Lectus nibh imperdiet .','15780','https://th.bing.com/th/id/R.cdcf48b45f29f5496dfeacf958107e71?rik=JLcLMWgB4HnVVQ&pid=ImgRaw&r=0',true),
('10','3','Higiene y Belleza 2','Rhoncus ante magna cursus consequat proin senectus ridiculus, varius maecenas tellus justo facilisi ligula eros dapibus, taciti sollicitudin vulputate vivamus lacus fusce. Lacus aptent facilisi urna volutpat vestibulum nunc sociis viverra habitasse.','15000','https://th.bing.com/th/id/R.cdcf48b45f29f5496dfeacf958107e71?rik=JLcLMWgB4HnVVQ&pid=ImgRaw&r=0',true),
('11','3','Higiene y Belleza 3','Primis quis sollicitudin ac himenaeos dui metus ridiculus, viverra vitae erat litora mauris eget, ut nisl platea feugiat inceptos cum. Diam vitae sem nulla commodo hendrerit duis dictum, tristique senectus maecenas eu augue dignissim lectus, eros cursus.','25400','https://th.bing.com/th/id/R.cdcf48b45f29f5496dfeacf958107e71?rik=JLcLMWgB4HnVVQ&pid=ImgRaw&r=0',true),
('12','3','Higiene y Belleza 4','Risus tristique donec faucibus cursus dictumst vestibulum maecenas, ac scelerisque luctus purus senectus quisque pellentesque, dictum commodo accumsan himenaeos placerat suscipit. Pharetra erat cubilia sapien feugiat aenean molestie vulputate ac, lectus.','45000','https://th.bing.com/th/id/R.cdcf48b45f29f5496dfeacf958107e71?rik=JLcLMWgB4HnVVQ&pid=ImgRaw&r=0',true),
('13','4','Embutidos 1','Nam ad hac curae mollis dui scelerisque convallis eros, dignissim faucibus velit nostra dapibus cursus vehicula habitasse facilisi, mi conubia pellentesque quisque cras justo inceptos. Integer varius consequat volutpat at dui scelerisque dapibus magnis platea.','285000','https://th.bing.com/th/id/OIP.wVC6icsyBuSJggEIyriMpQHaFP?rs=1&pid=ImgDetMain',true),
('14','4','Embutidos 3','Luctus lacus montes vulputate libero purus est litora, risus magnis quisque ac urna magna sollicitudin, suspendisse mauris massa euismod quam placerat. Facilisis congue id posuere tortor et porttitor curabitur pulvinar sapien, cubilia tempus pharetra.','154000','https://th.bing.com/th/id/OIP.wVC6icsyBuSJggEIyriMpQHaFP?rs=1&pid=ImgDetMain',true),
('15','4','Embutidos 3','Nullam porttitor vivamus phasellus tempus in morbi aliquet platea duis, nulla tristique inceptos pellentesque pulvinar congue sagittis euismod vitae lacinia, scelerisque mus orci sociosqu libero proin sed felis. Pretium tincidunt ultrices eu vel nam.','330000','https://th.bing.com/th/id/OIP.wVC6icsyBuSJggEIyriMpQHaFP?rs=1&pid=ImgDetMain',true),
('16','4','Embutidos 4','Litora metus senectus mattis egestas mus fames tempus suscipit, inceptos luctus hendrerit congue quis sem. Potenti quis conubia fermentum non dictum nibh, viverra neque sed pretium eros aptent, metus hac at imperdiet est. Accumsan donec sociosqu.','273000','https://th.bing.com/th/id/OIP.wVC6icsyBuSJggEIyriMpQHaFP?rs=1&pid=ImgDetMain',true);
