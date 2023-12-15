drop schema if exists superufide;
drop user if exists usuario_cliente;
CREATE SCHEMA superufide ;

create user 'usuario_cliente'@'%' identified by 'Usuar1o_cliente';

grant all privileges on superufide.* to 'usuario_cliente'@'%';
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
  cantidad INT NOT NULL,  
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
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table superufide.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha date,  
  total double,
  estado int,
  PRIMARY KEY (id_factura),
  foreign key fk_factura_usuario (id_usuario) references usuario(id_usuario)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table superufide.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio double, 
  cantidad int,
  PRIMARY KEY (id_venta),
  foreign key fk_ventas_factura (id_factura) references factura(id_factura),
  foreign key fk_ventas_producto (id_producto) references producto(id_producto) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;



INSERT INTO superufide.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'Emilio05','$2a$10$P1','Emilio', 'Rodriguez Quiros','EmiRoQ@gmail.com','4556-8978', 'https://th.bing.com/th/id/R.1ca4ed91cae8c867996c5c3ad22f249c?rik=DTkbwGDQqyorng&riu=http%3a%2f%2fwww3.pictures.zimbio.com%2fgi%2fOKI%2bOpen%2bde%2bEspana%2bSenior%2bCleveland%2bGolf%2bSrixon%2bT-6DQQGLQjbx.jpg&ehk=M2Q5RBuNqpGOowI9OxoTgOC%2fsQ%2btzoZmaPDsZW3RGhc%3d&risl=&pid=ImgRaw&r=0',true),
(2,'AnaCL','CJ0lQRi','Ana',  'Acu;a Lopez', 'NanaLopz@gmail.com', '5456-8789','https://th.bing.com/th/id/R.76bd08bd91f46adb1bbd3d45d6a5f605?rik=3LotKAsQJe%2flrQ&pid=ImgRaw&r=0',true),
(3,'Catalina87','qXnPbO','Catalina', 'Chamoro Trejos','CataTreCha@gmail.com','7898-8936','https://th.bing.com/th/id/OIP.afCJk0EuMjerIFYa_BkdZgAAAA?rs=1&pid=ImgDetMain',true),
(4,'Fran','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Fran', 'Rodriguez Saborio', 'franrs200309@gmail.com', '4556-8978', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true);


INSERT INTO superufide.categoria (id_categoria, descripcion, ruta_imagen,activo) VALUES 
('1','Bebidas y Licores', 'https://th.bing.com/th/id/OIP.ZAOAC3iN1smSwv-DE32WCgHaHa?rs=1&pid=ImgDetMain',   true), 
('2','Abarrotes',  'https://static.vecteezy.com/system/resources/previews/004/477/786/non_2x/grocery-food-2d-isolated-illustration-vegetables-and-eggs-in-container-products-from-supermarket-flat-composition-on-cartoon-background-retail-and-commerce-colourful-scene-vector.jpg',   true),
('3','Higiene y Belleza','https://www.alamy.es/aggregator-api/download?url=https://c8.alamy.com/compes/jk97cj/iconos-de-la-higiene-personal-estilo-de-dibujos-animados-jk97cj.jpg',true),
('4','Embutidos','https://th.bing.com/th/id/OIP.wVC6icsyBuSJggEIyriMpQHaFP?rs=1&pid=ImgDetMain',    true);


INSERT INTO superufide.producto (id_producto, id_categoria, descripcion, cantidad, precio, ruta_imagen, activo) VALUES
('1','1','Bebida 1','1','23000','https://th.bing.com/th/id/OIP.bvGzgJg2VKOiwY2BsZO0ogAAAA?rs=1&pid=ImgDetMain',true),
('2','1','Bebida 2','21','27000','https://th.bing.com/th/id/OIP.bvGzgJg2VKOiwY2BsZO0ogAAAA?rs=1&pid=ImgDetMain',true),
('3','1','Bebida 3','2','24000','https://th.bing.com/th/id/OIP.bvGzgJg2VKOiwY2BsZO0ogAAAA?rs=1&pid=ImgDetMain',true),
('4','1','bebida 4','4','27600','https://th.bing.com/th/id/OIP.bvGzgJg2VKOiwY2BsZO0ogAAAA?rs=1&pid=ImgDetMain',true),
('5','2','Abarrote 1','6','45000','https://th.bing.com/th/id/R.083b514854104256af44a1b62e24a964?rik=Zrfbh3Dkg6A4vw&pid=ImgRaw&r=0',true),
('6','2','Abarrote 2','33','57000','https://th.bing.com/th/id/R.083b514854104256af44a1b62e24a964?rik=Zrfbh3Dkg6A4vw&pid=ImgRaw&r=0',true),
('7','2','Abarrote 3','3','25000','https://th.bing.com/th/id/R.083b514854104256af44a1b62e24a964?rik=Zrfbh3Dkg6A4vw&pid=ImgRaw&r=0',true),
('8','2','Abarrote 4','43','27600','https://th.bing.com/th/id/R.083b514854104256af44a1b62e24a964?rik=Zrfbh3Dkg6A4vw&pid=ImgRaw&r=0',true),
('9','3','Higiene y Belleza 1','5','15780','https://th.bing.com/th/id/R.cdcf48b45f29f5496dfeacf958107e71?rik=JLcLMWgB4HnVVQ&pid=ImgRaw&r=0',true),
('10','3','Higiene y Belleza 2','89','15000','https://th.bing.com/th/id/R.cdcf48b45f29f5496dfeacf958107e71?rik=JLcLMWgB4HnVVQ&pid=ImgRaw&r=0',true),
('11','3','Higiene y Belleza 3','7','25400','https://th.bing.com/th/id/R.cdcf48b45f29f5496dfeacf958107e71?rik=JLcLMWgB4HnVVQ&pid=ImgRaw&r=0',true),
('12','3','Higiene y Belleza 4','34','45000','https://th.bing.com/th/id/R.cdcf48b45f29f5496dfeacf958107e71?rik=JLcLMWgB4HnVVQ&pid=ImgRaw&r=0',true),
('13','4','Embutidos 1','4','285000','https://th.bing.com/th/id/OIP.wVC6icsyBuSJggEIyriMpQHaFP?rs=1&pid=ImgDetMain',true),
('14','4','Embutidos 3','8','154000','https://th.bing.com/th/id/OIP.wVC6icsyBuSJggEIyriMpQHaFP?rs=1&pid=ImgDetMain',true),
('15','4','Embutidos 3','5','330000','https://th.bing.com/th/id/OIP.wVC6icsyBuSJggEIyriMpQHaFP?rs=1&pid=ImgDetMain',true);

INSERT INTO superufide.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',4), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2), (5,'ROLE_USER',2),
 (6,'ROLE_USER',3);