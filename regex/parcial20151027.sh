#!/bin/bash

FACTURAS="FacturasElectronicas.dat"
BOLETOS="BoletosBancarios.dat"

NRO_FACTURA=$1

# Muestre URL_IMAGEN_FACTURA;NRO_CUOTA;URL_IMAGEN_BOLETO

CODIGO_BOLETO_BANCARIO=$(grep "^$NRO_FACTURA," $FACTURAS | sed "s@^.*,.*,\(.*\),.*,.*@\1@")
URL_IMAGEN_FACTURA=$(grep "^$NRO_FACTURA," $FACTURAS | sed "s@^.*,.*,.*,\(.*\),.*@\1@")

grep "^$CODIGO_BOLETO_BANCARIO,.*" $BOLETOS | sed "s@@$URL_IMAGEN_FACTURA;\1;\3@g"
