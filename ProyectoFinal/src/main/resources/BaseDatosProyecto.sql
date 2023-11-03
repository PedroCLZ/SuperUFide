drop schema if exists superufide;
drop user if exists usuario_cliente;
CREATE SCHEMA superufide ;

create user 'usuario_cliente'@'%' identified by 'Usuar1o_cliente';

grant all privileges on techshop.* to 'usuario_cliente'@'%';
flush privileges;

create table superufide.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(100) NOT NULL,  
  precio double, 
  cantidad int,
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_categoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table superufide.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(100) NOT NULL,
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


