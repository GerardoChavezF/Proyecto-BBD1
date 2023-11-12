
ALTER TABLE acceso
    ADD CONSTRAINT acceso_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE bodega
    ADD CONSTRAINT bodega_direccion_fk FOREIGN KEY ( direccion_id_direccion )
        REFERENCES direccion ( id_direccion );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE colaborador
    ADD CONSTRAINT colaborador_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE compra
    ADD CONSTRAINT compra_preveedor_fk FOREIGN KEY ( preveedor_id_proveedor )
        REFERENCES preveedor ( id_proveedor );

ALTER TABLE cotizaciones
    ADD CONSTRAINT cotizaciones_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE cotizaciones
    ADD CONSTRAINT cotizaciones_vendedor_fk FOREIGN KEY ( vendedor_id_vendedor )
        REFERENCES vendedor ( id_vendedor );

ALTER TABLE cuadre
    ADD CONSTRAINT cuadre_puntosventa_fk FOREIGN KEY ( puntosventa_id_puntosventa )
        REFERENCES puntosventa ( id_puntosventa );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detallecotizacion
    ADD CONSTRAINT detallecotizacion_cotizaciones_fk FOREIGN KEY ( cotizaciones_id_cotizacion )
        REFERENCES cotizaciones ( id_cotizacion );

ALTER TABLE detallecotizacion
    ADD CONSTRAINT detallecotizacion_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE detalleventa
    ADD CONSTRAINT detalleventa_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE detalleventa
    ADD CONSTRAINT detalleventa_venta_fk FOREIGN KEY ( venta_id_venta )
        REFERENCES venta ( id_venta );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_municipio_fk FOREIGN KEY ( municipio_id_municipio )
        REFERENCES municipio ( id_municipio );

ALTER TABLE empresa
    ADD CONSTRAINT empresa_direccion_fk FOREIGN KEY ( direccion_id_direccion )
        REFERENCES direccion ( id_direccion );

ALTER TABLE municipio
    ADD CONSTRAINT municipio_departamento_fk FOREIGN KEY ( departamento_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE odencompra
    ADD CONSTRAINT odencompra_preveedor_fk FOREIGN KEY ( preveedor_id_proveedor )
        REFERENCES preveedor ( id_proveedor );

ALTER TABLE persona
    ADD CONSTRAINT persona_direccionp_fk FOREIGN KEY ( direccion_id_direccion )
        REFERENCES direccion ( id_direccion );

ALTER TABLE persona
    ADD CONSTRAINT persona_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE preveedor
    ADD CONSTRAINT preveedor_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE puntosventa
    ADD CONSTRAINT puntosventa_direccion_fk FOREIGN KEY ( direccion_id_direccion )
        REFERENCES direccion ( id_direccion );

ALTER TABLE roles
    ADD CONSTRAINT roles_usuario_fk FOREIGN KEY ( usuario_id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_direccion_fk FOREIGN KEY ( direccion_id_direccion )
        REFERENCES direccion ( id_direccion );

ALTER TABLE traslado
    ADD CONSTRAINT traslado_bodega_fk FOREIGN KEY ( bod_origen )
        REFERENCES bodega ( id_bodega );

ALTER TABLE traslado
    ADD CONSTRAINT traslado_bodega_fkv1 FOREIGN KEY ( bod_destino )
        REFERENCES bodega ( id_bodega );

ALTER TABLE traslado
    ADD CONSTRAINT traslado_producto_fk FOREIGN KEY ( producto_id_producto )
        REFERENCES producto ( id_producto );

ALTER TABLE vendedor
    ADD CONSTRAINT vendedor_persona_fk FOREIGN KEY ( persona_id_persona )
        REFERENCES persona ( id_persona );

ALTER TABLE venta
    ADD CONSTRAINT venta_cliente_fk FOREIGN KEY ( cliente_id_cliente )
        REFERENCES cliente ( id_cliente );

ALTER TABLE venta
    ADD CONSTRAINT venta_formapago_fk FOREIGN KEY ( formapago_id_formapago )
        REFERENCES formapago ( id_formapago );

ALTER TABLE venta
    ADD CONSTRAINT venta_vendedor_fk FOREIGN KEY ( vendedor_id_vendedor )
        REFERENCES vendedor ( id_vendedor );
