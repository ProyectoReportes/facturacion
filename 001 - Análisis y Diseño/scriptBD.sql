-- Generado por Oracle SQL Developer Data Modeler 4.0.0.833
--   en:        2014-10-12 03:26:31 CST
--   sitio:      SQL Server 2000
--   tipo:      SQL Server 2000




CREATE
  TABLE tbl_cliente
  (
    id_cliente VARCHAR (13) NOT NULL ,
    nombre     VARCHAR (101) NOT NULL ,
    apellido   VARCHAR (101) NOT NULL ,
    CONSTRAINT tbl_cliente_PK PRIMARY KEY  (id_cliente)
  )
;

CREATE
  TABLE tbl_entrada
  (
    id_entrada    VARCHAR (18) NOT NULL ,
    fecha         DATE NOT NULL ,
    hora          TIME ,
    id_marca      VARCHAR (5) NOT NULL ,
    cantidad      INTEGER ,
    precio_unidad NUMERIC (14,4) ,
    num_factura   VARCHAR (20) ,
    id_producto   VARCHAR (10) NOT NULL ,
    id_proveedor  VARCHAR (10) NOT NULL ,
    CONSTRAINT tbl_entrada_PK PRIMARY KEY  (id_entrada)
  )
;

CREATE
  TABLE tbl_inventario
  (
    id_entrada          VARCHAR (18) NOT NULL ,
    cantidad_total      INTEGER ,
    cantidad_disponible INTEGER ,
    ubicacion           VARCHAR (20) ,
    CONSTRAINT tbl_inventario_PK PRIMARY KEY  (id_entrada)
  )
;

CREATE
  TABLE tbl_marca
  (
    id_marca    VARCHAR (5) NOT NULL ,
    descripcion VARCHAR (50) NOT NULL ,
    CONSTRAINT tbl_marca_PK PRIMARY KEY  (id_marca)
  )
;

CREATE
  TABLE tbl_producto
  (
    id_producto      VARCHAR (10) NOT NULL ,
    descripcion      VARCHAR (50) NOT NULL ,
    categoria        VARCHAR (3) ,
    id_unidad_medida VARCHAR (4) NOT NULL ,
    CONSTRAINT producto_PK PRIMARY KEY  (id_producto)
  )
;

CREATE
  TABLE tbl_proveedores
  (
    id_proveedor VARCHAR (10) NOT NULL ,
    nombre       VARCHAR (50) NOT NULL ,
    direccion    VARCHAR (200) NOT NULL ,
    telefono     VARCHAR (8) NOT NULL ,
    correo       VARCHAR (50) NOT NULL ,
    CONSTRAINT tbl_proveedores_PK PRIMARY KEY  (id_proveedor)
  )
;

CREATE
  TABLE tbl_rol
  (
    id_rol      VARCHAR (3) NOT NULL ,
    descripcion VARCHAR (30) ,
    CONSTRAINT tbl_roles_usuarios_PK PRIMARY KEY  (id_rol)
  )
;

CREATE
  TABLE tbl_salida
  (
    id_salida           VARCHAR (21) NOT NULL ,
    id_entrada          VARCHAR (18) NOT NULL ,
    id_cliente          VARCHAR (13) NOT NULL ,
    cantidad_salida     INTEGER NOT NULL ,
    fecha               DATE NOT NULL ,
    hora                TIME ,
    estado_inventario   INTEGER ,
    factura_relacionada VARCHAR (20) ,
    id_empleado         VARCHAR (13) NOT NULL ,
    CONSTRAINT tbl_salida_PK PRIMARY KEY  (id_salida)
  )
;

CREATE
  TABLE tbl_unidad_medida
  (
    id_unidad_medida VARCHAR (4) NOT NULL ,
    descripcion      VARCHAR (50) NOT NULL ,
    abreviatura      VARCHAR (10) NOT NULL ,
    CONSTRAINT tbl_unidad_medida_PK PRIMARY KEY  (id_unidad_medida)
  )
;

CREATE
  TABLE tbl_usuarios
  (
    id_usuario       VARCHAR (13) NOT NULL ,
    pr_nombre        VARCHAR (50) NOT NULL ,
    sg_nombre        VARCHAR (50) ,
    pr_apellido      VARCHAR (50) NOT NULL ,
    sg_apellido      VARCHAR (50) ,
    e_mail           VARCHAR (100) ,
    id_rol           VARCHAR (3) NOT NULL ,
    f_creacion       DATE ,
    h_creacion       TIME ,
    f_ultimo_ingreso DATE ,
    h_ultimo_ingreso TIME ,
    CONSTRAINT tbl_usuarios_PK PRIMARY KEY  (id_usuario)
  )
;

ALTER TABLE tbl_entrada
ADD CONSTRAINT tbl_entrada_tbl_marca_FK FOREIGN KEY
(
id_marca
)
REFERENCES tbl_marca
(
id_marca
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE tbl_entrada
ADD CONSTRAINT tbl_entrada_tbl_producto_FK FOREIGN KEY
(
id_producto
)
REFERENCES tbl_producto
(
id_producto
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE tbl_entrada
ADD CONSTRAINT tbl_entrada_tbl_proveedores_FK FOREIGN KEY
(
id_proveedor
)
REFERENCES tbl_proveedores
(
id_proveedor
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE tbl_inventario
ADD CONSTRAINT tbl_inventario_tbl_entrada_FK FOREIGN KEY
(
id_entrada
)
REFERENCES tbl_entrada
(
id_entrada
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE tbl_producto
ADD CONSTRAINT tbl_prduct_tbl_u_medida_FK FOREIGN KEY
(
id_unidad_medida
)
REFERENCES tbl_unidad_medida
(
id_unidad_medida
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE tbl_salida
ADD CONSTRAINT tbl_salida_tbl_cliente_FK FOREIGN KEY
(
id_cliente
)
REFERENCES tbl_cliente
(
id_cliente
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE tbl_salida
ADD CONSTRAINT tbl_salida_tbl_inventario_FK FOREIGN KEY
(
id_entrada
)
REFERENCES tbl_inventario
(
id_entrada
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE tbl_salida
ADD CONSTRAINT tbl_salida_tbl_usuarios_FK FOREIGN KEY
(
id_empleado
)
REFERENCES tbl_usuarios
(
id_usuario
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;

ALTER TABLE tbl_usuarios
ADD CONSTRAINT tbl_usuarios_tbl_rol_FK FOREIGN KEY
(
id_rol
)
REFERENCES tbl_rol
(
id_rol
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
;


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
