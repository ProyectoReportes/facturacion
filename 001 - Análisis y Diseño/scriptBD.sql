CREATE DATABASE facturacion;
USE facturacion;

CREATE TABLE tbl_cliente
  (
    id_cliente VARCHAR (13) NOT NULL ,
    nombre     VARCHAR (101) NOT NULL ,
    apellido   VARCHAR (101) NOT NULL
  ) ;
ALTER TABLE tbl_cliente ADD CONSTRAINT tbl_cliente_PK PRIMARY KEY ( id_cliente ) ;

CREATE TABLE tbl_entrada
  (
    id_entrada    VARCHAR (18) NOT NULL ,
    fecha         DATETIME NOT NULL ,
    id_marca      VARCHAR (5) NOT NULL ,
    cantidad      INTEGER ,
    precio_unidad NUMERIC (14,4) ,
    num_factura   VARCHAR (20) ,
    id_producto   VARCHAR (10) NOT NULL
  ) ;
ALTER TABLE tbl_entrada ADD CONSTRAINT tbl_entrada_PK PRIMARY KEY ( id_entrada ) ;

CREATE TABLE tbl_inventario
  (
    id_entrada          VARCHAR (18) NOT NULL ,
    cantidad_total      INTEGER ,
    cantidad_disponible INTEGER ,
    ubicacion           VARCHAR (20)
  ) ;
ALTER TABLE tbl_inventario ADD CONSTRAINT tbl_inventario_PK PRIMARY KEY ( id_entrada ) ;

CREATE TABLE tbl_marca
  (
    id_marca    VARCHAR (5) NOT NULL ,
    descripcion VARCHAR (50) NOT NULL
  ) ;
ALTER TABLE tbl_marca ADD CONSTRAINT tbl_marca_PK PRIMARY KEY ( id_marca ) ;

CREATE TABLE tbl_producto
  (
    id_producto      VARCHAR (10) NOT NULL ,
    descripcion      VARCHAR (50) NOT NULL ,
    categoria        VARCHAR (3) ,
    id_unidad_medida VARCHAR (4) NOT NULL
  ) ;
ALTER TABLE tbl_producto ADD CONSTRAINT producto_PK PRIMARY KEY ( id_producto ) ;

CREATE TABLE tbl_rol
  (
    id_rol      VARCHAR (3) NOT NULL ,
    descripcion VARCHAR (30)
  ) ;
ALTER TABLE tbl_rol ADD CONSTRAINT tbl_roles_usuarios_PK PRIMARY KEY ( id_rol ) ;

CREATE TABLE tbl_salida
  (
    id_salida           VARCHAR (21) NOT NULL ,
    id_entrada          VARCHAR (18) NOT NULL ,
    id_cliente          VARCHAR (13) NOT NULL ,
    cantidad_salida     INTEGER NOT NULL ,
    fecha               DATETIME NOT NULL ,
    estado_inventario   INTEGER ,
    factura_relacionada VARCHAR (20),
    id_empleado         VARCHAR (13) NOT NULL
  ) ;
ALTER TABLE tbl_salida ADD CONSTRAINT tbl_salida_PK PRIMARY KEY ( id_salida ) ;

CREATE TABLE tbl_unidad_medida
  (
    id_unidad_medida VARCHAR (4) NOT NULL ,
    descripcion      VARCHAR (50) NOT NULL ,
    abreviatura      VARCHAR (10) NOT NULL
  ) ;
ALTER TABLE tbl_unidad_medida ADD CONSTRAINT tbl_unidad_medida_PK PRIMARY KEY ( id_unidad_medida ) ;

CREATE TABLE tbl_usuarios
  (
    id_usuario       VARCHAR (13) NOT NULL ,
    pr_nombre        VARCHAR (50) NOT NULL ,
    sg_nombre        VARCHAR (50) ,
    pr_apellido      VARCHAR (50) NOT NULL ,
    sg_apellido      VARCHAR (50) ,
    e_mail           VARCHAR (100) ,
    id_rol           VARCHAR (3) NOT NULL ,
    f_creacion       DATETIME ,
    f_ultimo_ingreso DATETIME
  ) ;
ALTER TABLE tbl_usuarios ADD CONSTRAINT tbl_usuarios_PK PRIMARY KEY ( id_usuario ) ;

ALTER TABLE tbl_entrada ADD CONSTRAINT tbl_entrada_tbl_marca_FK FOREIGN KEY ( id_marca ) REFERENCES tbl_marca ( id_marca ) ;

ALTER TABLE tbl_entrada ADD CONSTRAINT tbl_entrada_tbl_producto_FK FOREIGN KEY ( id_producto ) REFERENCES tbl_producto ( id_producto ) ;

ALTER TABLE tbl_inventario ADD CONSTRAINT tbl_inventario_tbl_entrada_FK FOREIGN KEY ( id_entrada ) REFERENCES tbl_entrada ( id_entrada ) ;

ALTER TABLE tbl_producto ADD CONSTRAINT tbl_prduct_tbl_u_medida_FK FOREIGN KEY ( id_unidad_medida ) REFERENCES tbl_unidad_medida ( id_unidad_medida ) ;

ALTER TABLE tbl_salida ADD CONSTRAINT tbl_salida_tbl_cliente_FK FOREIGN KEY ( id_cliente ) REFERENCES tbl_cliente ( id_cliente ) ;

ALTER TABLE tbl_salida ADD CONSTRAINT tbl_salida_tbl_inventario_FK FOREIGN KEY ( id_entrada ) REFERENCES tbl_inventario ( id_entrada ) ;

ALTER TABLE tbl_salida ADD CONSTRAINT tbl_salida_tbl_usuarios_FK FOREIGN KEY ( id_empleado ) REFERENCES tbl_usuarios ( id_usuario ) ;

ALTER TABLE tbl_usuarios ADD CONSTRAINT tbl_usuarios_tbl_rol_FK FOREIGN KEY ( id_rol ) REFERENCES tbl_rol ( id_rol ) ;