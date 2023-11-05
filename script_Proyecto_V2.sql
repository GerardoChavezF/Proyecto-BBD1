
-- -----------------------------------------------------
-- Table ENVIO
-- -----------------------------------------------------
CREATE TABLE ENVIO (
  id_envio INT NOT NULL,
  fecha_envio DATE NULL,
  producto_envio INT NOT NULL,
  cantidad INT NOT NULL,
  id_cliente INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_envio))
 ;

-- -----------------------------------------------------
-- Table persona
-- -----------------------------------------------------
CREATE TABLE persona (
  id_persona INT NOT NULL,
  primernombre VARCHAR(20) NOT NULL,
  segundonombre VARCHAR(20) NULL,
  otronombre VARCHAR(20) NULL,
  primerapellido VARCHAR(20) NULL,
  segundoapellido VARCHAR(20) NOT NULL,
  otroapellido VARCHAR(20) NULL,
  no_telefono VARCHAR(15) NOT NULL,
  email VARCHAR(255) NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  direccion INT NOT NULL,
  cui VARCHAR(13) NOT NULL,
  PRIMARY KEY (id_persona));

-- -----------------------------------------------------
-- Table USUARIO
-- -----------------------------------------------------
CREATE TABLE USUARIO (
  id_usuario INT NOT NULL,
  nombre_usuario VARCHAR(45) NOT NULL,
  contrasenia VARCHAR(45) NOT NULL,
  id_rol VARCHAR(45) NULL,
  persona_id_persona INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_usuario),
  CONSTRAINT fk_usuario_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona))
 ;

-- -----------------------------------------------------
-- Table ROLES
-- -----------------------------------------------------
CREATE TABLE ROLES (
  id_rol INT NOT NULL,
  nombre_rol VARCHAR(45) NOT NULL,
  usuario_id_usuario INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_rol),
  CONSTRAINT fk_ROLES_usuario1
    FOREIGN KEY (usuario_id_usuario)
    REFERENCES USUARIO (id_usuario))
 ;

-- -----------------------------------------------------
-- Table COLABORADOR
-- -----------------------------------------------------
CREATE TABLE COLABORADOR (
  id_colaborador INT NOT NULL,
  id_persona INT NOT NULL,
  persona_id_persona INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_colaborador),
  CONSTRAINT fk_COLABORADOR_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona))
 ;

-- -----------------------------------------------------
-- Table COMPRA
-- -----------------------------------------------------
CREATE TABLE COMPRA (
  id_compra INT NOT NULL,
  COMPRAcol DATE NOT NULL,
  totalcompra FLOAT NULL,
  id_proveedor INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_compra))
 ;

-- -----------------------------------------------------
-- Table PROVEEDOR
-- -----------------------------------------------------
CREATE TABLE PROVEEDOR (
  id_proveedor INT NOT NULL,
  id_persona INT NOT NULL,
  persona_id_persona INT NOT NULL,
  COMPRA_id_compra INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_proveedor),
  CONSTRAINT fk_PROVEEDOR_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona),
  CONSTRAINT fk_PROVEEDOR_COMPRA1
    FOREIGN KEY (COMPRA_id_compra)
    REFERENCES COMPRA (id_compra))
 ;

-- -----------------------------------------------------
-- Table ORDENCOMPRA
-- -----------------------------------------------------
CREATE TABLE ORDENCOMPRA (
  id_ordencompra INT NOT NULL,
  fecha_odencompra DATE NOT NULL,
  total_ordencompra FLOAT NULL,
  id_preveedor INT NOT NULL,
  PROVEEDOR_id_proveedor INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_ordencompra),
  CONSTRAINT fk_ORDENCOMPRA_PROVEEDOR1
    FOREIGN KEY (PROVEEDOR_id_proveedor)
    REFERENCES PROVEEDOR (id_proveedor))
 ;
-- -----------------------------------------------------
-- Table  DETALLEVENTA
-- -----------------------------------------------------
CREATE TABLE  DETALLEVENTA (
  id_detalleventa INT NOT NULL,
  id_venta VARCHAR(45) NOT NULL,
  id_producto VARCHAR(45) NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_detalleventa))
 ;
-- -----------------------------------------------------
-- Table VENTA
-- -----------------------------------------------------
CREATE TABLE VENTA (
  id_venta INT NOT NULL,
  fechaventa DATE NULL,
  totalventa FLOAT NULL,
  id_cliente INT NULL,
  id_vendedor VARCHAR(45) NULL,
  DETALLEVENTA_id_detalleventa INT NOT NULL,
  id_formapago VARCHAR(45) NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_venta),
  CONSTRAINT fk_VENTA_DETALLEVENTA1
    FOREIGN KEY (DETALLEVENTA_id_detalleventa)
    REFERENCES DETALLEVENTA (id_detalleventa))
 ;

-- -----------------------------------------------------
-- Table VENDEDOR
-- -----------------------------------------------------
CREATE TABLE VENDEDOR (
  id_vendedor INT NOT NULL,
  id_persona VARCHAR(45) NOT NULL,
  persona_id_persona INT NOT NULL,
  VENTA_id_venta INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_vendedor),
  CONSTRAINT fk_VENDEDOR_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona),
  CONSTRAINT fk_VENDEDOR_VENTA1
    FOREIGN KEY (VENTA_id_venta)
    REFERENCES VENTA (id_venta))
 ;

-- -----------------------------------------------------
-- Table CLIENTE
-- -----------------------------------------------------
CREATE TABLE CLIENTE (
  id_cliente INT NOT NULL,
  id_persona VARCHAR(45) NOT NULL,
  fechacreacion DATE NULL,
  persona_id_persona INT NOT NULL,
  VENTA_id_venta INT NOT NULL,
  ENVIO_id_envio INT NOT NULL,
  fechacreacion_copy1 DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_cliente),
  CONSTRAINT fk_CLIENTE_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona),
  CONSTRAINT fk_CLIENTE_VENTA1
    FOREIGN KEY (VENTA_id_venta)
    REFERENCES VENTA (id_venta),
  CONSTRAINT fk_CLIENTE_ENVIO1
    FOREIGN KEY (ENVIO_id_envio)
    REFERENCES ENVIO (id_envio))
 ;
-- -----------------------------------------------------
-- Table COTIZACIONES
-- -----------------------------------------------------
CREATE TABLE COTIZACIONES (
  id_cotizacion INT NOT NULL,
  fechacotizacion DATE NOT NULL,
  id_producto INT NULL,
  detalle_cotizacion VARCHAR(45) NULL,
  totalcotizacion FLOAT NOT NULL,
  id_cliente INT NULL,
  id_vendedor INT NULL,
  VENDEDOR_id_vendedor INT NOT NULL,
  CLIENTE_id_cliente INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_cotizacion),
  CONSTRAINT fk_COTIZACIONES_VENDEDOR1
    FOREIGN KEY (VENDEDOR_id_vendedor)
    REFERENCES VENDEDOR (id_vendedor),
  CONSTRAINT fk_COTIZACIONES_CLIENTE1
    FOREIGN KEY (CLIENTE_id_cliente)
    REFERENCES CLIENTE (id_cliente))
 ;
-- -----------------------------------------------------
-- Table EMPRESA
-- -----------------------------------------------------
CREATE TABLE EMPRESA (
  id_empresa INT NOT NULL,
  nombre_empresa VARCHAR(45) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_empresa))
 ;

-- -----------------------------------------------------
-- Table DEPARTAMENTO
-- -----------------------------------------------------
CREATE TABLE DEPARTAMENTO (
  id_departamento INT NOT NULL,
  departamento VARCHAR(45) NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_departamento))
 ;


-- -----------------------------------------------------
-- Table MUNICIPIO
-- -----------------------------------------------------
CREATE TABLE MUNICIPIO (
  id_municipio INT NOT NULL,
  id_departamento INT NULL,
  municipio VARCHAR(45) NULL,
  departamento_municipio INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_municipio),
  CONSTRAINT fk_MUNICIPIO_DEPARTAMENTO
    FOREIGN KEY (departamento_municipio)
    REFERENCES DEPARTAMENTO (id_departamento))
 ;

-- -----------------------------------------------------
-- Table DIRECCION
-- -----------------------------------------------------
CREATE TABLE DIRECCION (
  id_direccion INT NOT NULL,
  id_municipio INT NOT NULL,
  calle VARCHAR(45) NULL,
  avenida VARCHAR(45) NULL,
  otros VARCHAR(100) NULL,
  MUNICIPIO_id_municipio INT NOT NULL,
  CLIENTE_idcliente INT NOT NULL,
  EMPRESA_id_empresa INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_direccion),
  CONSTRAINT fk_DIRECCION_MUNICIPIO1
    FOREIGN KEY (MUNICIPIO_id_municipio)
    REFERENCES MUNICIPIO (id_municipio),
  CONSTRAINT fk_DIRECCION_CLIENTE1
    FOREIGN KEY (CLIENTE_idcliente)
    REFERENCES persona (id_persona),
  CONSTRAINT fk_DIRECCION_EMPRESA1
    FOREIGN KEY (EMPRESA_id_empresa)
    REFERENCES EMPRESA (id_empresa))
 ;

-- -----------------------------------------------------
-- Table BODEGA
-- -----------------------------------------------------
CREATE TABLE BODEGA (
  id_bodega INT NOT NULL,
  nombre_bodega VARCHAR(45) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  DIRECCION_id_direccion INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_bodega),
  CONSTRAINT fk_BODEGA_DIRECCION1
    FOREIGN KEY (DIRECCION_id_direccion)
    REFERENCES DIRECCION (id_direccion))
 ;

-- -----------------------------------------------------
-- Table TLASLADO
-- -----------------------------------------------------
CREATE TABLE TLASLADO (
  id_traslada INT NOT NULL,
  fecha_traslado DATE NULL,
  producto_tras INT NULL,
  cantidad INT NULL,
  origen INT NOT NULL,
  destino INT NOT NULL,
  BODEGA_id_bodega INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_traslada),
  CONSTRAINT fk_TLASLADO_BODEGA1
    FOREIGN KEY (BODEGA_id_bodega)
    REFERENCES BODEGA (id_bodega))
 ;

-- -----------------------------------------------------
-- Table FORMAPAGO
-- -----------------------------------------------------
CREATE TABLE FORMAPAGO (
  id_formapago INT NOT NULL,
  nombre_formapago VARCHAR(45) NOT NULL,
  VENTA_id_venta INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_formapago),
  CONSTRAINT fk_FORMAPAGO_VENTA1
    FOREIGN KEY (VENTA_id_venta)
    REFERENCES VENTA (id_venta))
 ;

-- -----------------------------------------------------
-- Table PRODUCTO
-- -----------------------------------------------------
CREATE TABLE PRODUCTO (
  id_producto INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(100) NULL,
  precio FLOAT NOT NULL,
  stock INT NOT NULL,
  DETALLEVENTA_id_detalleventa INT NOT NULL,
  COTIZACIONES_id_cotizacion INT NOT NULL,
  TLASLADO_id_traslada INT NOT NULL,
  ENVIO_id_envio INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_producto),
  CONSTRAINT fk_PRODUCTO_DETALLEVENTA1
    FOREIGN KEY (DETALLEVENTA_id_detalleventa)
    REFERENCES DETALLEVENTA (id_detalleventa),
  CONSTRAINT fk_PRODUCTO_COTIZACIONES1
    FOREIGN KEY (COTIZACIONES_id_cotizacion)
    REFERENCES COTIZACIONES (id_cotizacion),
  CONSTRAINT fk_PRODUCTO_TLASLADO1
    FOREIGN KEY (TLASLADO_id_traslada)
    REFERENCES TLASLADO (id_traslada),
  CONSTRAINT fk_PRODUCTO_ENVIO1
    FOREIGN KEY (ENVIO_id_envio)
    REFERENCES ENVIO (id_envio))
 ;
-- -----------------------------------------------------
-- Table CUADRE
-- -----------------------------------------------------
CREATE TABLE CUADRE (
  id_cuadre INT NOT NULL,
  fechacuadre DATE NOT NULL,
  totalcaja FLOAT NOT NULL,
  total_ventadia FLOAT NOT NULL,
  id_puntoventa INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_cuadre))
 ; 
-- -----------------------------------------------------
-- Table puntosventa
-- -----------------------------------------------------
CREATE TABLE puntosventa (
  id_puntosventa INT NOT NULL,
  nombre_puntoventa VARCHAR(45) NOT NULL,
  telefono VARCHAR(15) NULL,
  id_direccion VARCHAR(45) NULL,
  DIRECCION_id_direccion INT NOT NULL,
  CUADRE_id_cuadre INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_puntosventa),
  CONSTRAINT fk_puntosventa_DIRECCION1
    FOREIGN KEY (DIRECCION_id_direccion)
    REFERENCES DIRECCION (id_direccion),
  CONSTRAINT fk_puntosventa_CUADRE1
    FOREIGN KEY (CUADRE_id_cuadre)
    REFERENCES CUADRE (id_cuadre))
 ;
-- -----------------------------------------------------
-- Table SUCURSAL
-- -----------------------------------------------------
CREATE TABLE SUCURSAL (
  id_sucursal INT NOT NULL,
  nombresucursal VARCHAR(45) NOT NULL,
  telefono VARCHAR(15) NULL,
  id_direccion VARCHAR(45) NULL,
  DIRECCION_id_direccion INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_sucursal),
  CONSTRAINT fk_SUCURSAL_DIRECCION1
    FOREIGN KEY (DIRECCION_id_direccion)
    REFERENCES DIRECCION (id_direccion))
 ;

-- -----------------------------------------------------
-- Table ACCESO
-- -----------------------------------------------------
CREATE TABLE ACCESO (
  id_acceso INT NOT NULL,
  id_usuario INT NULL,
  USUARIO_id_usuario INT NOT NULL,
  fechahora_acceso VARCHAR(45) NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  estado INT NOT NULL,
  PRIMARY KEY (id_acceso),
  CONSTRAINT fk_ACCESO_USUARIO1
    FOREIGN KEY (USUARIO_id_usuario)
    REFERENCES USUARIO (id_usuario))
 ;


-- -----------------------------------------------------
-- Table BITACORA
-- -----------------------------------------------------
CREATE TABLE BITACORA (
  id_bitacora INT NOT NULL,
  fechacreacion DATE NOT NULL,
  usuariocreacion INT NOT NULL,
  fechamod DATE NOT NULL,
  usuariomod INT NOT NULL,
  PRIMARY KEY (id_bitacora))
 ;



