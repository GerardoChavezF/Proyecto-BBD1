CREATE TABLE acceso (
    id_acceso          INTEGER NOT NULL,
    id_usuario         INTEGER,
    fechahora_acceso   VARCHAR2(45),
    fechacreacion      DATE,
    usuariocreacion    INTEGER,
    fechamod           DATE,
    usuariomod         INTEGER,
    estado             INTEGER,
    usuario_id_usuario INTEGER NOT NULL
);

CREATE UNIQUE INDEX acceso__idx ON
    acceso (
        usuario_id_usuario
    ASC );

ALTER TABLE acceso ADD CONSTRAINT acceso_pk PRIMARY KEY ( id_acceso );

CREATE TABLE bitacora (
    id_bitacora     INTEGER NOT NULL,
    fechacreacion   DATE,
    usuariocreacion INTEGER,
    fechamod        DATE,
    usuariomod      INTEGER,
    estado          INTEGER
);

ALTER TABLE bitacora ADD CONSTRAINT bitacora_pk PRIMARY KEY ( id_bitacora );

CREATE TABLE bodega (
    id_bodega              INTEGER NOT NULL,
    nombre_bodega          VARCHAR2(45),
    telefono               VARCHAR2(15),
    fechacreacion          DATE,
    usuariocreacion        INTEGER,
    fechamod               DATE,
    usuariomod             INTEGER,
    estado                 INTEGER,
    direccion_id_direccion INTEGER NOT NULL
);

ALTER TABLE bodega ADD CONSTRAINT bodega_pk PRIMARY KEY ( id_bodega );

CREATE TABLE cliente (
    id_cliente         INTEGER NOT NULL,
    fechacreacion      DATE,
    usuariocreacion    INTEGER,
    fechamod           DATE,
    usuariomod         INTEGER,
    estado             INTEGER,
    persona_id_persona INTEGER NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE colaborador (
    id_colaborador     INTEGER NOT NULL,
    id_persona         INTEGER,
    fechacreacion      DATE,
    usuariocreacion    INTEGER,
    fechamod           DATE,
    usuariomod         INTEGER,
    estado             INTEGER,
    persona_id_persona INTEGER NOT NULL
);

ALTER TABLE colaborador ADD CONSTRAINT colaborador_pk PRIMARY KEY ( id_colaborador );

CREATE TABLE compra (
    id_compra              INTEGER NOT NULL,
    totalcompra            FLOAT,
    fechacreacion          DATE,
    usuariocreacion        INTEGER,
    fechamod               DATE,
    usuariomod             INTEGER,
    estado                 INTEGER,
    preveedor_id_proveedor INTEGER NOT NULL
);

ALTER TABLE compra ADD CONSTRAINT compra_pk PRIMARY KEY ( id_compra );

CREATE TABLE cotizaciones (
    id_cotizacion        INTEGER NOT NULL,
    fechacotizacion      DATE,
    detalle_cotizacion   VARCHAR2(45),
    total_cotizacion     NUMBER,
    fechacreacion        DATE,
    usuariocreacion      INTEGER,
    fechamod             DATE,
    usuariomod           INTEGER,
    estado               INTEGER,
    vendedor_id_vendedor INTEGER NOT NULL,
    cliente_id_cliente   INTEGER NOT NULL
);

ALTER TABLE cotizaciones ADD CONSTRAINT cotizaciones_pk PRIMARY KEY ( id_cotizacion );

CREATE TABLE cuadre (
    id_cuadre                  INTEGER NOT NULL,
    fechacuadre                DATE,
    totalcaja                  NUMBER,
    total_ventadia             NUMBER,
    fechacreacion              DATE,
    usuariocreacion            INTEGER,
    fechamod                   DATE,
    usuariomod                 INTEGER,
    estado                     INTEGER,
    puntosventa_id_puntosventa INTEGER NOT NULL
);

ALTER TABLE cuadre ADD CONSTRAINT cuadre_pk PRIMARY KEY ( id_cuadre );

CREATE TABLE departamento (
    id_departamento INTEGER NOT NULL,
    departamento    VARCHAR2(45),
    fechacreacion   DATE,
    usuariocreacion INTEGER,
    fechamod        DATE,
    usuariomod      INTEGER,
    estado          INTEGER
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE detallecotizacion (
    id_detallecotizacion       INTEGER NOT NULL,
    cantidad                   INTEGER,
    precio                     NUMBER,
    fechacreacion              DATE,
    usuariocreacion            INTEGER,
    fechamod                   DATE,
    usuariomod                 INTEGER,
    estado                     INTEGER,
    producto_id_producto       INTEGER NOT NULL,
    cotizaciones_id_cotizacion INTEGER NOT NULL
);

ALTER TABLE detallecotizacion ADD CONSTRAINT detallecotizacion_pk PRIMARY KEY ( id_detallecotizacion );

CREATE TABLE detalleventa (
    id_detalleventa      INTEGER NOT NULL,
    cantidad             INTEGER,
    precio               NUMBER,
    fechacreacion        DATE,
    usuariocreacion      INTEGER,
    fechamod             DATE,
    usuariomod           INTEGER,
    estado               INTEGER,
    venta_id_venta       INTEGER NOT NULL,
    producto_id_producto INTEGER NOT NULL
);

ALTER TABLE detalleventa ADD CONSTRAINT detalleventa_pk PRIMARY KEY ( id_detalleventa );

CREATE TABLE direccion (
    id_direccion           INTEGER NOT NULL,
    calle                  VARCHAR2(45),
    avenida                VARCHAR2(45),
    otros                  VARCHAR2(100),
    fechacreacion          DATE,
    usuariocreacion        INTEGER,
    fechamod               DATE,
    usuariomod             INTEGER,
    estado                 INTEGER,
    municipio_id_municipio INTEGER NOT NULL
);

ALTER TABLE direccion ADD CONSTRAINT direccion_pk PRIMARY KEY ( id_direccion );

CREATE TABLE empresa (
    id_empresa             INTEGER NOT NULL,
    nombre_empresa         VARCHAR2(45),
    telefono               VARCHAR2(15),
    fechacreacion          DATE,
    usuariocreacion        INTEGER,
    fechamod               DATE,
    usuariomod             INTEGER,
    estado                 INTEGER,
    direccion_id_direccion INTEGER NOT NULL
);

CREATE UNIQUE INDEX empresa__idx ON
    empresa (
        direccion_id_direccion
    ASC );

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( id_empresa );

CREATE TABLE formapago (
    id_formapago     INTEGER NOT NULL,
    nombre_formapago VARCHAR2(45),
    fechacreacion    DATE,
    usuariocreacion  INTEGER,
    fechamod         DATE,
    usuariomod       INTEGER,
    estado           INTEGER
);

ALTER TABLE formapago ADD CONSTRAINT formapago_pk PRIMARY KEY ( id_formapago );

CREATE TABLE municipio (
    id_municipio                 INTEGER NOT NULL,
    municipio                    VARCHAR2(45),
    fechacreacion                DATE,
    usuariocreacion              INTEGER,
    fechamod                     DATE,
    usuariomod                   INTEGER,
    estado                       INTEGER,
    departamento_id_departamento INTEGER NOT NULL
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( id_municipio );

CREATE TABLE odencompra (
    id_ordencompra         INTEGER NOT NULL,
    fecha_ordencompra      DATE,
    total_ordencompra      NUMBER,
    fechacreacion          DATE,
    usuariocreacion        INTEGER,
    fechamod               DATE,
    usuariomod             INTEGER,
    estado                 INTEGER,
    preveedor_id_proveedor INTEGER NOT NULL
);

ALTER TABLE odencompra ADD CONSTRAINT odencompra_pk PRIMARY KEY ( id_ordencompra );

CREATE TABLE persona (
    id_persona             INTEGER NOT NULL,
    primernombre           VARCHAR2(20),
    segundonombre          VARCHAR2(20),
    otronombre             VARCHAR2(20),
    primerapellido         VARCHAR2(20),
    segundoapellido        VARCHAR2(20),
    otroapellido           VARCHAR2(20),
    no_telefono            VARCHAR2(15),
    cui                    VARCHAR2(13),
    email                  INTEGER,
    fechacreacion          DATE,
    usuariocreacion        INTEGER,
    fechamod               DATE,
    usuariomod             INTEGER,
    estado                 INTEGER,
    direccion_id_direccion INTEGER NOT NULL,
    usuario_id_usuario     INTEGER NOT NULL
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( id_persona );

CREATE TABLE preveedor (
    id_proveedor       INTEGER NOT NULL,
    fechacreacion      DATE,
    usuariocreacion    INTEGER,
    fechamod           DATE,
    usuariomod         INTEGER,
    estado             INTEGER,
    persona_id_persona INTEGER NOT NULL
);

ALTER TABLE preveedor ADD CONSTRAINT preveedor_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE producto (
    id_producto     INTEGER NOT NULL,
    nombre          VARCHAR2(100),
    descripcion     VARCHAR2(100),
    precio          NUMBER,
    stock           INTEGER,
    fechacreacion   DATE,
    usuariocreacion INTEGER,
    fechamod        DATE,
    usuariomod      INTEGER,
    estado          INTEGER
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE puntosventa (
    id_puntosventa         INTEGER NOT NULL,
    nombre_puntosventa     VARCHAR2(45),
    telefono               VARCHAR2(15),
    fechacreacion          DATE,
    usuariocreacion        INTEGER,
    fechamod               DATE,
    usuariomod             INTEGER,
    estado                 INTEGER,
    direccion_id_direccion INTEGER NOT NULL
);

CREATE UNIQUE INDEX puntosventa__idx ON
    puntosventa (
        direccion_id_direccion
    ASC );

ALTER TABLE puntosventa ADD CONSTRAINT puntosventa_pk PRIMARY KEY ( id_puntosventa );

CREATE TABLE roles (
    id_rol             INTEGER NOT NULL,
    nombre_rol         VARCHAR2(45),
    fechacreacion      DATE,
    usuariocreacion    INTEGER,
    fechamod           DATE,
    usuariomod         INTEGER,
    estado             INTEGER,
    usuario_id_usuario INTEGER NOT NULL
);

CREATE UNIQUE INDEX roles__idx ON
    roles (
        usuario_id_usuario
    ASC );

ALTER TABLE roles ADD CONSTRAINT roles_pk PRIMARY KEY ( id_rol );

CREATE TABLE sucursal (
    id_sucursal            INTEGER NOT NULL,
    nombresucursal         VARCHAR2(45),
    telefono               VARCHAR2(15),
    fechacreacion          DATE,
    usuariocreacion        INTEGER,
    fechamod               DATE,
    usuariomod             INTEGER,
    estado                 INTEGER,
    direccion_id_direccion INTEGER NOT NULL
);

CREATE UNIQUE INDEX sucursal__idx ON
    sucursal (
        direccion_id_direccion
    ASC );

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( id_sucursal );

CREATE TABLE traslado (
    id_traslado          INTEGER NOT NULL,
    fecha_traslado       INTEGER,
    cantidad             INTEGER,
    bod_origen           INTEGER NOT NULL,
    bod_destino          INTEGER NOT NULL,
    fechacreacion        DATE,
    usuariocreacion      INTEGER,
    fechamod             DATE,
    usuariomod           INTEGER,
    estado               INTEGER,
    producto_id_producto INTEGER NOT NULL
);

ALTER TABLE traslado ADD CONSTRAINT traslado_pk PRIMARY KEY ( id_traslado );

CREATE TABLE usuario (
    id_usuario         INTEGER NOT NULL,
    nombre_usuario     VARCHAR2(45),
    contrasenia        VARCHAR2(45),
    id_rol             VARCHAR2(45),
    persona_id_persona INTEGER,
    fechacreacion      DATE,
    usuariocreacion    INTEGER,
    fechamod           DATE,
    usuariomod         INTEGER,
    estado             INTEGER
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

CREATE TABLE vendedor (
    id_vendedor        INTEGER NOT NULL,
    fechacreacion      DATE,
    usuariocreacion    INTEGER,
    fechamod           DATE,
    usuariomod         INTEGER,
    estado             INTEGER,
    persona_id_persona INTEGER NOT NULL
);

ALTER TABLE vendedor ADD CONSTRAINT vendedor_pk PRIMARY KEY ( id_vendedor );

CREATE TABLE venta (
    id_venta               INTEGER NOT NULL,
    fechaventa             DATE,
    totalventa             NUMBER,
    fechacreacion          DATE,
    usuariocreacion        INTEGER,
    fechamod               DATE,
    usuariomod             INTEGER,
    estado                 INTEGER,
    vendedor_id_vendedor   INTEGER NOT NULL,
    cliente_id_cliente     INTEGER NOT NULL,
    formapago_id_formapago INTEGER NOT NULL
);

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( id_venta );
